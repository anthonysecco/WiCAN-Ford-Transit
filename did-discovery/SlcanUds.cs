// Raw-CAN UDS engine for the WiCAN Pro's SLCAN TCP socket (default port 3333).
// ISO-TP (11-bit normal addressing), one outstanding request per module, many modules in parallel.
// READ-ONLY: every request passes an allowlist (0x22, 0x3E, 0x19 report sub-functions, 0x10 01/03,
// 0x24, OBD 01/06/09). Compiled at runtime by PowerShell (Add-Type), C# 5 syntax only.
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Globalization;
using System.Net.Sockets;
using System.Text;
using System.Threading;

public class SlcanUds : IDisposable
{
    TcpClient client;
    NetworkStream stream;
    Thread reader;
    volatile bool running;
    readonly object txLock = new object();
    readonly ConcurrentDictionary<uint, BlockingCollection<byte[]>> rxQueues = new ConcurrentDictionary<uint, BlockingCollection<byte[]>>();
    public long FramesRx, FramesTx, BadLines, Strays;
    public string LastLine = "";

    public void Connect(string host, int port)
    {
        client = new TcpClient();
        client.NoDelay = true;
        client.Connect(host, port);
        stream = client.GetStream();
        running = true;
        reader = new Thread(ReadLoop);
        reader.IsBackground = true;
        reader.Start();
        RawWrite("C\r");          // close if open
        Thread.Sleep(100);
        RawWrite("S6\r");         // 500 kbit/s
        Thread.Sleep(100);
        RawWrite("O\r");          // open (normal mode: we must ACK/transmit)
        Thread.Sleep(200);
    }

    void RawWrite(string s)
    {
        byte[] b = Encoding.ASCII.GetBytes(s);
        lock (txLock) { stream.Write(b, 0, b.Length); }
    }

    void ReadLoop()
    {
        byte[] buf = new byte[8192];
        StringBuilder line = new StringBuilder();
        try
        {
            while (running)
            {
                int n = stream.Read(buf, 0, buf.Length);
                if (n <= 0) break;
                for (int i = 0; i < n; i++)
                {
                    char c = (char)buf[i];
                    if (c == '\r' || c == '\n' || c == '\a')
                    {
                        if (line.Length > 0) { HandleLine(line.ToString()); line.Length = 0; }
                    }
                    else line.Append(c);
                }
            }
        }
        catch (Exception) { }
    }

    static int Hex(char c) { return int.Parse(c.ToString(), NumberStyles.HexNumber); }

    void HandleLine(string l)
    {
        LastLine = l;
        try
        {
            int idLen;
            if (l[0] == 't') idLen = 3;          // 11-bit
            else if (l[0] == 'T') idLen = 8;     // 29-bit
            else return; // z/Z acks, version replies, etc.
            uint id = uint.Parse(l.Substring(1, idLen), NumberStyles.HexNumber);
            int dlc = Hex(l[1 + idLen]);
            if (l.Length < 2 + idLen + dlc * 2) { BadLines++; return; }
            byte[] d = new byte[dlc];
            for (int i = 0; i < dlc; i++) d[i] = byte.Parse(l.Substring(2 + idLen + i * 2, 2), NumberStyles.HexNumber);
            Interlocked.Increment(ref FramesRx);
            BlockingCollection<byte[]> q;
            if (rxQueues.TryGetValue(id, out q)) q.Add(d);
        }
        catch (Exception) { BadLines++; }
    }

    // WiCAN 6.0.0-beta.4 asserts in its TWAI tx queue (esp_twai_onchip.c:607) under bursty
    // transmit; space frames evenly across all workers.
    public int MinFrameGapMs = 4;
    readonly object paceLock = new object();
    readonly System.Diagnostics.Stopwatch paceClock = System.Diagnostics.Stopwatch.StartNew();
    long lastSendTicks = -1000000;

    public void SendFrame(uint id, byte[] data)
    {
        lock (paceLock)
        {
            long gap = (long)(MinFrameGapMs * System.Diagnostics.Stopwatch.Frequency / 1000.0);
            while (paceClock.ElapsedTicks - lastSendTicks < gap) Thread.SpinWait(200);
            lastSendTicks = paceClock.ElapsedTicks;
        }
        StringBuilder sb = new StringBuilder();
        if (id > 0x7FF) sb.Append('T').Append(id.ToString("X8")); else sb.Append('t').Append(id.ToString("X3"));
        sb.Append(data.Length.ToString("X1"));
        foreach (byte b in data) sb.Append(b.ToString("X2"));
        sb.Append('\r');
        RawWrite(sb.ToString());
        Interlocked.Increment(ref FramesTx);
    }

    BlockingCollection<byte[]> Queue(uint rx)
    {
        return rxQueues.GetOrAdd(rx, delegate(uint k) { return new BlockingCollection<byte[]>(new ConcurrentQueue<byte[]>()); });
    }

    public static bool IsReadOnly(byte[] p)
    {
        if (p == null || p.Length == 0) return false;
        switch (p[0])
        {
            case 0x22: case 0x3E: case 0x24: case 0x01: case 0x06: case 0x09: return true;
            case 0x10: return p.Length >= 2 && (p[1] == 0x01 || p[1] == 0x03);
            case 0x19: return p.Length >= 2 && Array.IndexOf(new byte[] { 0x01, 0x02, 0x03, 0x04, 0x06, 0x0A }, p[1]) >= 0;
            default: return false;
        }
    }

    static byte[] Pad(List<byte> f) { while (f.Count < 8) f.Add(0x00); return f.ToArray(); }

    /// <summary>True when resp answers req (same service; for 0x22 the echoed DID is one we asked for).
    /// Stray frames (replies to broadcasts, tester present, late answers) are rejected.</summary>
    public static bool Matches(byte[] req, byte[] resp)
    {
        if (resp == null || resp.Length == 0) return false;
        if (resp[0] == 0x7F) return resp.Length >= 2 && resp[1] == req[0];
        if (resp[0] != (byte)(req[0] + 0x40)) return false;
        switch (req[0])
        {
            case 0x22:
                if (resp.Length < 3) return false;
                for (int i = 1; i + 1 < req.Length; i += 2) if (resp[1] == req[i] && resp[2] == req[i + 1]) return true;
                return false;
            case 0x10: case 0x3E: case 0x19: case 0x01: case 0x09: case 0x06:
                return resp.Length >= 2 && resp[1] == req[1];
            default: return true;
        }
    }

    /// <summary>One ISO-TP request/response. Returns the UDS response (e.g. 62 F1 90 ...) or null on timeout.
    /// Handles 0x78 response-pending, multi-frame responses (sends flow control) and multi-frame requests.</summary>
    public byte[] Request(uint tx, uint rx, byte[] payload, int p2Ms, int p2StarMs)
    {
        if (!IsReadOnly(payload)) throw new InvalidOperationException("blocked non-read-only request");
        BlockingCollection<byte[]> q = Queue(rx);
        byte[] junk; while (q.TryTake(out junk)) { }

        if (payload.Length <= 7)
        {
            List<byte> f = new List<byte>(); f.Add((byte)payload.Length); f.AddRange(payload);
            SendFrame(tx, Pad(f));
        }
        else
        {
            List<byte> ff = new List<byte>(); ff.Add((byte)(0x10 | ((payload.Length >> 8) & 0x0F))); ff.Add((byte)(payload.Length & 0xFF));
            for (int i = 0; i < 6; i++) ff.Add(payload[i]);
            SendFrame(tx, ff.ToArray());
            byte[] fc;
            if (!q.TryTake(out fc, p2Ms) || (fc[0] & 0xF0) != 0x30) return null;
            int st = fc[2] <= 0x7F ? fc[2] : 1;
            int idx = 6, sn = 1;
            while (idx < payload.Length)
            {
                List<byte> cf = new List<byte>(); cf.Add((byte)(0x20 | (sn & 0x0F)));
                for (int i = 0; i < 7 && idx < payload.Length; i++) cf.Add(payload[idx++]);
                SendFrame(tx, Pad(cf));
                sn++;
                if (st > 0) Thread.Sleep(st);
            }
        }

        DateTime deadline = DateTime.UtcNow.AddMilliseconds(p2Ms);
        while (true)
        {
            int wait = (int)(deadline - DateTime.UtcNow).TotalMilliseconds;
            if (wait <= 0) return null;
            byte[] fr;
            if (!q.TryTake(out fr, wait)) return null;
            int pci = fr[0] >> 4;
            if (pci == 0)
            {
                int len = fr[0] & 0x0F;
                if (len == 0 || len > fr.Length - 1) continue;
                byte[] resp = new byte[len]; Array.Copy(fr, 1, resp, 0, len);
                if (len >= 3 && resp[0] == 0x7F && resp[1] == payload[0] && resp[2] == 0x78) { deadline = DateTime.UtcNow.AddMilliseconds(p2StarMs); continue; } // pending
                if (!Matches(payload, resp)) { Interlocked.Increment(ref Strays); continue; }
                return resp;
            }
            if (pci == 1)
            {
                int total = ((fr[0] & 0x0F) << 8) | fr[1];
                byte[] resp = new byte[total];
                int got = Math.Min(6, total); Array.Copy(fr, 2, resp, 0, got);
                List<byte> fcf = new List<byte>(); fcf.Add(0x30); fcf.Add(0x00); fcf.Add(0x00);
                SendFrame(tx, Pad(fcf));
                int expect = 1;
                while (got < total)
                {
                    byte[] cf;
                    if (!q.TryTake(out cf, 1000)) return null;
                    if ((cf[0] >> 4) != 2) continue;
                    if ((cf[0] & 0x0F) != (expect & 0x0F)) return null;
                    expect++;
                    int take = Math.Min(7, total - got); Array.Copy(cf, 1, resp, got, take); got += take;
                }
                if (!Matches(payload, resp)) { Interlocked.Increment(ref Strays); continue; }
                return resp;
            }
        }
    }

    /// <summary>Functional OBD broadcast (7DF 01 00) + physical tester present: wakes sleepy Ford modules.</summary>
    public void Wake(uint tx) { Wake(tx, true); }

    /// <summary>broadcast=false: physical tester present only (sweep workers use this so they don't
    /// make every other module answer a broadcast mid-sweep).</summary>
    public void Wake(uint tx, bool broadcast)
    {
        if (broadcast) { SendFrame(0x7DF, new byte[] { 0x02, 0x01, 0x00, 0, 0, 0, 0, 0 }); Thread.Sleep(30); }
        if (tx != 0) SendFrame(tx, new byte[] { 0x02, 0x3E, 0x00, 0, 0, 0, 0, 0 });
        Thread.Sleep(30);
    }

    /// <summary>Fire tester-present at every id in [first,last] and collect who answers (11-bit, rx = tx + 8).</summary>
    public List<uint> Discover(uint first, uint last, int listenMs)
    {
        List<uint> found = new List<uint>();
        for (uint id = first; id <= last; id++) Queue(id + 8);
        Wake(0);
        for (uint id = first; id <= last; id++) { SendFrame(id, new byte[] { 0x02, 0x3E, 0x00, 0, 0, 0, 0, 0 }); Thread.Sleep(2); }
        Thread.Sleep(listenMs);
        for (uint id = first; id <= last; id++)
        {
            BlockingCollection<byte[]> q = Queue(id + 8); byte[] f;
            if (q.TryTake(out f)) { found.Add(id); while (q.TryTake(out f)) { } }
        }
        return found;
    }

    public void Dispose()
    {
        running = false;
        try { RawWrite("C\r"); } catch (Exception) { }
        try { client.Close(); } catch (Exception) { }
    }
}

/// <summary>Sweeps a list of DIDs on one module in its own thread, adaptive multi-DID batching.</summary>
public class DidSweep
{
    public uint Tx, Rx;
    public bool Extended;
    public int Batch = 3;
    public int[] Dids;
    public volatile int Checked, Requests, Timeouts;
    public volatile bool Done, Stop;
    public volatile string State = "pending";
    public ConcurrentDictionary<int, string> Found = new ConcurrentDictionary<int, string>();   // did -> hex data
    public ConcurrentDictionary<int, int> Refused = new ConcurrentDictionary<int, int>();       // did -> NRC (not 0x31)
    SlcanUds bus;
    Thread th;

    public DidSweep(SlcanUds bus, uint tx, uint rx, int[] dids, int batch, bool extended)
    { this.bus = bus; Tx = tx; Rx = rx; Dids = dids; Batch = Math.Max(1, batch); Extended = extended; }

    public void Start() { th = new Thread(Run); th.IsBackground = true; th.Start(); }

    public ConcurrentDictionary<int, bool> NoReply = new ConcurrentDictionary<int, bool>(); // module alive, DID silent

    byte[] Req(byte[] p)
    {
        Requests++;
        byte[] r = bus.Request(Tx, Rx, p, 150, 3000);
        if (r == null) { bus.Wake(Tx, false); Requests++; r = bus.Request(Tx, Rx, p, 1000, 3000); }
        if (r == null) Timeouts++;
        return r;
    }

    bool Alive()
    {
        byte[] r = bus.Request(Tx, Rx, new byte[] { 0x3E, 0x00 }, 500, 1000);
        return r != null;
    }

    void EnterSession()
    {
        if (Extended) { byte[] r = Req(new byte[] { 0x10, 0x03 }); State = (r != null && r[0] == 0x50) ? "extended session" : "extended refused"; }
    }

    void Record(int did, byte[] r)
    {
        if (r == null) return;
        if (r[0] == 0x62 && r.Length >= 3)
        {
            StringBuilder sb = new StringBuilder();
            for (int i = 3; i < r.Length; i++) { if (sb.Length > 0) sb.Append(' '); sb.Append(r[i].ToString("X2")); }
            Found[did] = sb.ToString();
        }
        else if (r[0] == 0x7F && r.Length >= 3 && r[2] != 0x31) Refused[did] = r[2];
    }

    void Run()
    {
        try
        {
            bus.Wake(Tx, false);
            EnterSession();
            if (State == "extended refused") { Done = true; return; }
            State = "scanning";
            DateTime lastTp = DateTime.UtcNow, lastSession = DateTime.UtcNow;
            int i = 0, missesInRow = 0;
            while (i < Dids.Length && !Stop)
            {
                int n = Math.Min(Batch, Dids.Length - i);
                byte[] p = new byte[1 + 2 * n]; p[0] = 0x22;
                for (int k = 0; k < n; k++) { p[1 + 2 * k] = (byte)(Dids[i + k] >> 8); p[2 + 2 * k] = (byte)Dids[i + k]; }
                byte[] r = Req(p);
                // a module that stops answering must not be recorded as "nothing here": stall instead
                if (r == null)
                {
                    if (Alive())
                    {   // module is up, this DID just never answers: note it and move on
                        for (int k = 0; k < n; k++) NoReply[Dids[i + k]] = true;
                        missesInRow = 0; i += n; Checked = i; continue;
                    }
                    if (++missesInRow >= 3) { State = "stalled"; Done = true; return; }
                    Thread.Sleep(500);
                    continue;
                }
                missesInRow = 0;
                if (r != null && r[0] == 0x7F && r.Length >= 3 && r[2] == 0x13 && Batch > 1) { Batch--; continue; }
                if (r != null && (r[0] == 0x62 || (r[0] == 0x7F && r.Length >= 3 && r[2] != 0x31)))
                {
                    if (n == 1) Record(Dids[i], r);
                    else for (int k = 0; k < n; k++) Record(Dids[i + k], Req(new byte[] { 0x22, (byte)(Dids[i + k] >> 8), (byte)Dids[i + k] }));
                }
                i += n; Checked = i;
                if (Extended && (DateTime.UtcNow - lastSession).TotalSeconds > 20) { EnterSession(); lastSession = DateTime.UtcNow; }
            }
            if (Extended) Req(new byte[] { 0x10, 0x01 });
            State = Stop ? "stopped" : "done";
        }
        catch (Exception ex) { State = "error: " + ex.Message; }
        Done = true;
    }

    public bool Finished { get { return State == "done"; } }
}

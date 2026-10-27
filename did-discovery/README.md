# 2021 Ford Transit – module & DID discovery (WiCAN Pro)

A read-only sweep of every diagnostic module reachable from the OBD port of a 2021 Ford Transit (3.5 L V6, 10R80, AWD), using a WiCAN Pro. It covers which modules answer, every UDS DID (0x0000–0xFFFF) they return data for, and decodes for the ones we could identify. Values are in the module's native units.

> Privacy: the VIN serial (last 7 characters) and the GPS position were redacted before publishing. The WiCAN device ID and MAC address were removed.

## What's here

| Path | What it is |
|---|---|
| `output/ford_transit_2021_discovery.json` | Every module and every answering DID: a name (with where it came from), raw bytes, decoded signals (native units), formula and source for each, DTCs, standard OBD PIDs. |
| `output/ford_transit_2021_wican_profile.json` | WiCAN AutoPID profile (profile-editor format) built from the owner's review: 72 PIDs, 77 parameters. On this branch it also replaces the repo's root `2021-Ford-Transit-North-America.json`. |
| `refs/ford_did_library.json` | Merged known-DID library: OBDb Ford signal sets plus this repo's `PIDs.md`. CC BY-SA 4.0 (see below). |
| `refs/crossmatch.json` | The answering-but-unnamed DIDs matched against every named Ford DID from any module or model. |
| `*.ps1`, `SlcanUds.cs`, `preview.html` | The tools that produced all of this (see "Running it"). |

## Findings

### Modules on pins 6/14 (HS-CAN, 500 kbit/s, 11-bit)

All five answer with the ignition on. Nothing answered on 0x600–0x6FF or on any 29-bit physical address.

| Module | Request / response ID | DIDs answering (default session) | Decoded | Verified from live logs |
|---|---|---|---|---|
| PCM – powertrain | 0x7E0 / 0x7E8 | 466 | 189 | 68 |
| BCM – body | 0x726 / 0x72E | 563 | 60 | 27 |
| APIM – SYNC | 0x7D0 / 0x7D8 | 142 | 4 | 0 |
| PAM – parking aid | 0x736 / 0x73E | 85 | 4 | 2 |
| AWDM – all-wheel drive | 0x703 / 0x70B | 67 | 6 | 3 |

The IPC, ABS, RCM, HVAC, SCCM, IPMA, TCU and PSCM are on the second bus (pins 3/11). The WiCAN Pro reaches that bus only through its OBD chip, which didn't work on the unit used here, so none of those modules were scanned.

### Most useful decoded values (all native units)
- **12 V battery (BCM 40xx/41xx/42xx):** state of charge, voltage, current, temperature, age, quiescent current, start/stop readiness flags, cumulative charge/discharge counters, and the second battery's voltage and current.
- **Tires (BCM 2813–2818, 280B–2812, 2827/2828):** per-wheel pressure in kPa (`raw/3 + 22/3`), placard pressure in psi (stored that way), tire temperature, sensor IDs.
- **Powertrain (PCM):** odometer, fuel level, oil life, coolant/cylinder-head temperature, transmission fluid temperature, gear (enum: 70 = P, 60 = R, 50 = N, 1–10 forward), speed, RPM, fuel rate, A/C pressure, fuel trims, knock and misfire counters.
- **Position (APIM 8012):** SYNC GPS latitude/longitude (resolution about 1 arcminute), altitude, heading, speed.

### Signals verified from live logs
Live data was logged with the engine running and on a short drive, in batches of up to 240 PIDs, while the adapter traffic was recorded. Each logged PID was then matched to the DID reply and byte field that reproduce every logged value. These signals have `"id": "LIVE_MATCH"` in the discovery JSON. They cover:
- **10R80 transmission:** gear commanded and engaged, shift in progress, input/output/turbine speeds, shift-solenoid pressures and currents, converter slip and ratio, line pressure.
- **Engine:** MAP, fuel-rail pressure, fuel rate, intake air temperatures, O2 sensors, spark, cam timing, throttle, misfire counts, fuel-system status.
- **Vehicle and body:** speed, odometer, start-stop state, ignition switch, BCM lamp outputs, AWD clutch, a parking sensor.

### DID names
Every answering DID has a `name`, plus `name_source` and `name_detail` saying where the name came from. The first source with a name wins:

1. **`owner`:** renamed by the van's owner during review (the name it replaced is kept as `suggested_name`).
2. **`community`:** OBDb, this repo's `PIDs.md`, forum/GitHub research, ISO 14229 / SAE J1979 standard identifiers, or the same DID on other Fords.
3. **`jakka351`:** the jakka351 GenericDiagnosticTool DID dictionary (see licensing below). These are Ford-wide names, not checked against this van.
4. **`live-match`:** PID names from the live logs, for DIDs matched as above.
5. **`guess`:** derived from the DID's ISO 14229 number range and what the reply looks like (part number, text, empty, data block…). Unverified.

Each reviewed DID also has a `review` block: `reviewed`, and `wican_profile` (`include`, `exclude` or `auto`). Excluded DIDs stay in the discovery JSON; the flag only decides the WiCAN profile.

### Inferred formulas
31 DIDs with no published formula have one inferred from the live data. It comes either from moving in step with a known signal, or from Ford's usual scaling for that kind of value landing every reading in a realistic range. They appear as signals with `"id": "INFERRED"`, a confidence (`likely`, `weaker`, `assumed`), the reasoning, and the owner's `decision`. Examples: parking brake `B4:6`, horn `B4`, gear selector `B4` (100 = P, 101 = R, 102 = N, 103 = D, 105 = position after D). The profile uses an inferred formula only for DIDs the owner included, and only if it was accepted, or is undecided and rated `likely` or `assumed`.

### WiCAN profile notes
- On/off values (doors, hood, horn, parking brake) use WiCAN's bit syntax (`B4:6`) with `sensor_type: binary`.
- WiCAN expressions only produce numbers, so the VIN is in the discovery JSON but not in the profile. Enum values (gear, ignition position) are sent as raw numbers to map in Home Assistant.
- Units are the module's own (kPa, °C, km/h); let Home Assistant convert.

### Behaviour worth knowing
- **Modules stop answering physical requests after a while.** A functional broadcast (`7DF 02 01 00`) wakes them.
- **Batch limits:** the PCM, AWDM and APIM answer an oversized multi-DID `22` request with NRC 0x31 instead of 0x13, so real DIDs disappear silently. Limits measured: PCM 2, AWDM 2, BCM 3, APIM 5. The sweep reads one DID per request.
- **APIM DID C008 (or C007) makes SYNC stop responding for about a minute.** Don't poll it.
- **Ford "global" DIDs (F4xx OBD mirrors, DD01 odometer, D137 DTC count) are served by several modules**, including the AWDM.
- **Ignition on with the engine off pulls the battery below the WiCAN's 11.9 V critical cutoff** within minutes. Run the engine for long scans.

### Open questions (need the engine running)
- **402A battery voltage:** `A/20+6` (OBDb) vs about `A/10` (WiCAN upstream profile). The repo's `[B4:B5]` is wrong because the DID returns 1 byte.
- **0307 fuel pump duty:** three conflicting scalings.
- **091A/093C throttle:** degrees vs percent.
- **1E16 overall ratio:** reads 10.0 in Park.
- **0415 oil pressure:** absolute kPa; subtract barometric pressure.
- **Still to do:** the extended diagnostic session (`10 03`) sweep, which is likely to reveal more DIDs.

## Running it

Requirements:
- Windows PowerShell 5.1. The C# engine compiles at runtime; no other installs.
- A WiCAN Pro on firmware 6.x with:
  - native CAN enabled (500 kbit/s, not silent)
  - for raw-CAN speed, the `slcan0` TCP socket (port 3333) enabled, plus a bridge `{ "a": "can", "b": "slcan0", "translator": "slcan" }`. **`a` must be `can`.**

Scripts (set the WiCAN address in `wican.ps1`):
- `phase1.ps1`: wake, discover modules, then read and decode every known DID through the WiCAN's UDS HTTP API.
- `phase2.ps1 -Session default|extended`: full 0x0000–0xFFFF sweep of every module in parallel over raw CAN (`SlcanUds.cs`), about 30–65 DIDs/s per module. It resumes and recovers on its own.
- `recheck.ps1`: re-sweep windows around suspicious points, such as a key cycle.
- `crossmatch.ps1`: name unknown DIDs from every Ford source.
- `build_library.ps1`, `build_json.ps1`: rebuild the library and the two output files. `build_library.ps1` expects OBDb signal sets in `refs/obdb/` (`https://raw.githubusercontent.com/OBDb/<Model>/HEAD/signalsets/v3/default.json`).
- `serve.ps1` + `preview.html`: a live progress page at `http://localhost:8766`.

**Safety:** every request passes a read-only allowlist: `0x22`, `0x19` report sub-functions, `0x3E`, `0x24`, `0x10 01/03`, and OBD modes 01/06/09. Writes, resets, routines, DTC clearing and programming sessions are blocked in code. Run with the vehicle parked.

**WiCAN 6.0.0-beta.4 note:** bursty SLCAN transmit crashes the firmware with `assert failed: _node_queue_tx esp_twai_onchip.c:607` (task `br_slcan`). The engine spaces frames at least 4 ms apart (`SlcanUds.MinFrameGapMs`) to avoid it.

## Sources and licensing
- OBDb Ford signal sets (https://github.com/OBDb) are licensed **CC BY-SA 4.0**. `refs/ford_did_library.json` and the OBDb-derived decodes in the output files are shared under the same license.
- Research sources are cited per signal (`source` field) in the discovery JSON.
- DID names with `name_source: "jakka351"` come from the DID dictionary in [jakka351/GenericDiagnosticTool](https://github.com/jakka351/GenericDiagnosticTool), **Copyright (c) 2025 Tester Present Specialist Automotive Solutions**, licensed under the [TPSAS Open Source License 1.0](https://github.com/jakka351/GenericDiagnosticTool/blob/main/license). They are provided as-is, without warranty. Modified: only names were taken, matched to the DIDs this van answers.- Collected and decoded with Claude Code (Anthropic) from live reads of the owner's van; formulas marked "reported" or "guess" are unverified.

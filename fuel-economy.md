# Fuel Economy Coaching (future enhancement)

Ideas for using the WiCAN profile to measure how efficiently the van is driven and to coach the driver toward better
fuel economy. Nothing here is built yet. Parameter names match `2021-Ford-Transit-North-America.json`.

## Baseline: how efficient is the engine?

The PCM keeps lifetime counters (mode 09) for distance, fuel used and engine output energy. Dividing energy by fuel
gives the engine's average efficiency.

| Counter | Parameter | Example reading (32,100 km) |
|---|---|---|
| Distance | `pcm-distance-lifetime` | 32,100 km |
| Fuel used | `pcm-fuel-used-lifetime` | 4,524 L (14.1 L/100 km, 16.7 mpg US) |
| Engine output energy | `pcm-engine-energy-lifetime` | 11,916 kWh |

- Output per litre: 11,916 kWh ÷ 4,524 L = **2.63 kWh/L**.
- 87-octane E10 gasoline holds about 8.7 kWh/L, so the average engine efficiency is about **30 %**.
- For a twin-turbo 3.5 L V6, peak efficiency on a dyno is roughly 35–37 %. Real-world averages are about
  15–20 % in the city, 20–25 % mixed and 25–30 % on the highway, so 30 % lifetime is near the top of the range.
  Heavy load and highway miles keep the engine near its efficient zone. Idle, short trips and light-load cruising pull
  the average down.
- On 87 octane the PCM retards spark (and may add extra fuel) at high boost. That costs a few percent at heavy load
  (towing, climbing) but makes little difference when cruising.
- Both counters are the PCM's own estimates: fuel from injector timing, energy from its torque model. Treat the result
  as ±3 points.

## 1. Acceleration coaching

**Goal:** find the pedal, load and RPM range that accelerates the van most efficiently, then coach the driver to stay
in it when traffic allows.

**Engine efficiency map from everyday driving:**
- Engine power (kW) = `pcm-actual-engine-percent-torque` × `pcm-engine-reference-torque` × `pcm-engine-speed` × 2π ÷ 60,000.
- Fuel power (kW) = `pcm-fuel-rate` (g/s) × ~42 kJ/g (E10).
- Efficiency = engine power ÷ fuel power. Average it in a grid of RPM × load.
- Within a few weeks of driving this shows the engine's sweet spot. It also shows where efficiency falls away: enrichment
  (`pcm-commanded-equivalence-ratio-afr-desired-bank` / `pcm-lambda-commanded` richer than 1.0) and high boost.

**What to expect from a turbo gasoline engine:**
- Moderate-to-brisk acceleration at low RPM is usually most efficient.
- Very gentle acceleration keeps the engine at light, inefficient load and spends longer in low gears.
- Full throttle adds fuel enrichment and spark retard.
- The 10R80 picks gears itself, but pedal position decides how early it upshifts.
- A coaching target might read "load between X and Y %, under ~2,500 rpm, no enrichment, torque converter locked"
  (`pcm-torque-converter-slip-ratio` near 1). The data sets the actual numbers.

**Related habit worth scoring:** coasting with fuel cut (`pcm-fuel-rate` = 0 while moving) instead of braking late.
This often saves more than acceleration technique does.

**Signals to add to the profile for this:**
- Accelerator pedal position (standard PIDs 0x49 / 0x4A).
- Spark advance (0x0E), to see knock retard on 87 octane.

## 2. MPG vs MPH curve (40–85 mph)

**Goal:** plot steady-cruise MPG for every 1 mph from 40 to 85. This shows how fast economy drops off with speed, and
any speeds that do unusually well or badly.

**Spotting steady cruise:** keep only windows where all of these hold for 20–30 s:
- speed within ±1 km/h (`pcm-vehicle-speed-high-resolution`);
- steady throttle (`pcm-throttle-position`);
- same gear (`pcm-current-gear`) and the torque converter locked;
- no enrichment, and the engine warm.

**Correcting for conditions:**
- Air density = `pcm-barometric-pressure` ÷ (287 × (`pcm-ambient-air-temperature` + 273.15)). Aero drag scales with it.
- Rather than averaging raw MPG per speed, fit a simple road-load model: rolling resistance + ½ × density × CdA × v².
  Use it to correct every point to standard air (101.3 kPa, 15 °C). The model also fills in speeds with few samples and
  flags outliers.
- Tag each window with the A/C state (`pcm-a-c-compressor-state`) and tire pressures and temperature (TPMS
  parameters). Both change the result.

**Grade and wind** are the main confounders, and the van reports neither. Ways around them:
- **Out-and-back runs** on the same road cancel both. A dedicated session on a flat highway, stepping 40 → 85 mph in
  5 mph steps (85 only where legal), gives a clean curve in an afternoon.
- **GPS altitude** (for example from a phone in Home Assistant) allows passive collection over months.
- **Speed calibration:** the PCM's distance count reads about 0.6 % below the odometer, so check vehicle speed against
  GPS.

**What to expect:**
- A high-roof Transit has a large frontal area, so aero drag dominates above ~50 mph. Fuel per mile rises roughly with
  the square of speed.
- Rough illustration only: 55 → 75 mph might cost 30–35 % in MPG (e.g. 18 → 12–13 mpg). The data will set the real figures.
- There is rarely a hidden "sweet spot" peak. The curve usually falls steadily from the lowest speed where top gear and
  converter lock-up engage.
- The per-mph plot is good at revealing small features: shift points, converter unlock, or a speed where the
  transmission hunts between gears.

## PKE: a driving-smoothness score

**PKE (positive kinetic energy)** measures how much speeding up a drive involves per km. Regulators use it to describe
how aggressive or stop-and-go a driving pattern is. The PCM keeps it in mode 09 (info type 0x18) as
`pcm-pke-recent` and `pcm-pke-lifetime`.

**How it is calculated:**
- Every time the van speeds up, it adds (end speed² − start speed²). Slowing down is ignored.
- The total is divided by distance.
- The result is an acceleration-like figure. The PCM reports it in (km/h)² per km, which is km/h². Divide by 12,960
  to get m/s².

**Why it matters:** every speed-up puts kinetic energy into the van's mass. Braking turns it into heat and it is lost.
High PKE means more speeding up and braking, so more fuel per km. Low PKE means smooth, steady driving. Driving style
and route (city stops, traffic) both raise it. Hills do not, because it only looks at speed.

**Baseline (2026-11-01):**

| | Value | m/s² |
|---|---|---|
| Lifetime | 5,456 km/h² | ≈ 0.42 |
| Recent | 5,650 km/h² | ≈ 0.44 |

The standard EPA test cycles score about 0.2 m/s² (highway), 0.35–0.4 (city) and 0.6–0.7 (aggressive). That makes
this van's lifetime driving typical city/mixed.

**Trip PKE:**
- **From the counters:** (lifetime PKE × lifetime distance after − the same before) ÷ trip distance. The lifetime value
  has coarse steps, so this is accurate to a few percent only on trips of 100 km or more.
- **Live:** sum the positive changes in speed² from `pcm-vehicle-speed-high-resolution` in Home Assistant, divided by
  distance. Slow polling misses brief speed-ups and reads low. Poll speed at 1 s or faster, and compare live PKE only
  with live PKE.

**How to use it:**
- Show trip PKE beside L/100 km. Two trips with the same fuel use but different PKE show whether the route or the
  driving made the difference.
- Track a smoothness trend: trip PKE ÷ lifetime PKE (below 1 = smoother than usual).
- Pair it with the share of time coasting with fuel cut. Low PKE plus a high coasting share is the efficient pattern.
- Use it to normalise comparisons: a curve-fit MPG drop on a high-PKE trip is probably traffic, not the van.

## 3. Driver feedback loop

1. **Live "vs baseline" gauge:** current MPG compared with the curve's value at the current speed (e.g. "8 % worse than
   normal at 65 mph"). Taking speed out of the comparison makes headwind, grade and driving style visible.
2. **Cost of speed:** "75 instead of 65 mph this trip used 9 L more and saved 11 minutes."
3. **Live acceleration indicator:** green/amber/red against the efficiency map while accelerating.
4. **Trip report:**
   - acceleration score;
   - PKE vs baseline (smoothness);
   - share of time coasting with fuel cut;
   - idle share;
   - engine efficiency (energy ÷ fuel);
   - L/100 km and MPG.
5. **Seasonal re-fit:** the map and curve get better as data builds up. Winter fuel blends, tire changes and roof
   loads show up as shifts.

## Recommended refresh rates

The WiCAN polls the whole profile in turn, so with everything enabled each value refreshes only every few seconds. Poll
each signal only as fast as it changes, and leave the time for the signals that need it.

| Use | Signals | Refresh |
|---|---|---|
| Acceleration coaching (only while coaching) | `pcm-vehicle-speed-high-resolution`, `pcm-engine-speed`, `pcm-actual-engine-percent-torque`, `pcm-fuel-rate`, accelerator pedal (to add), `pcm-throttle-position`, `pcm-current-gear`, `pcm-torque-converter-slip-ratio`, `pcm-lambda-commanded` | 200–500 ms (2–5 Hz) |
| Live MPG, steady-cruise detection, live PKE | `pcm-vehicle-speed-high-resolution`, `pcm-fuel-rate`, `pcm-throttle-position`, `pcm-current-gear`, `pcm-torque-converter-slip-ratio` | 1 s |
| Load and state flags | `pcm-engine-load`, `pcm-a-c-compressor-state`, `pcm-gear-shift`, `pcm-commanded-equivalence-ratio-afr-desired-bank` | 2–5 s |
| Temperatures | `pcm-engine-coolant-temperature`, `pcm-transmission-oil-temperature`, `pcm-intake-temperature-alternate` | 10–30 s |
| Air density | `pcm-barometric-pressure`, `pcm-ambient-air-temperature` | 30–60 s |
| Tires and fuel level | TPMS pressures and temperature, `pcm-fuel-level` | 60 s |
| Distance, fuel and energy counters | `pcm-distance-*`, `pcm-fuel-used-*`, `pcm-engine-energy-*` (0x17, 0x18) | 30 s while measuring segments, else 60 s |
| Time, PKE and other counters | `pcm-pke-*` and info types 0x16, 0x19, 0x22, 0x24 | 60 s, or at trip start and end |
| Static | `pcm-engine-reference-torque` | once per drive |

**Mode 09 counter resolution** (measured 2026-11-01). The counters update live while the engine runs, and the time
counters match the clock to the second. Their steps are coarse, so they suit windows of a few minutes, not instant
gauges:

| Counter | Step | Highway, ~100 km/h | Window for ~1 % accuracy |
|---|---|---|---|
| Distance | 0.1 km | one step every 3.6 s | ~10 km |
| Fuel | 0.01 L | one step every ~2.6 s (~14 L/h) | ~4–5 min |
| Engine energy | 0.1 kWh | one step every ~10 s (~35 kW) | ~15–20 min cruising |
| Times | 1 s | every second | — |

- Use the live signals for instant values, and the counters as the reference: integrate `pcm-fuel-rate` over a trip
  and compare it with the fuel counter's change. The ratio is a correction factor for the live gauges; re-check it each
  tank.
- For short windows (the MPG-vs-MPH curve), take distance from integrated live speed rather than the 0.1 km counter.
- Each counter read is a multi-frame reply (info type 0x16 is six frames), so polling them faster than every 30 s
  wastes bus time without adding information.

## Practical constraints

- **Per-signal rates:** check whether the WiCAN firmware supports a poll period per parameter. If it doesn't, switch
  between two profiles: a lean coaching list and the full list.
- **Where it runs:**
  - Home Assistant can handle the live gauges and trip statistics with template sensors and utility meters.
  - The efficiency map and the curve fit are better done offline: export the recorded history (Home Assistant recorder
    or a time-series database), fit it with a script, and feed the resulting curve back into Home Assistant as a lookup
    table.

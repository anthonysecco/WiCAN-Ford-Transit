> This repo is under development.

# WiCAN on the Ford Transit

I'll add some documentation at some point.  Take a look at the YAML for Home Assistant and the json to load into your WiCAN vehicle profile



## List of Modules

| Module Name                     | Abbreviation | CAN ID (Hex) | Description |
|--------------------------------|--------------|--------------|-------------|
| Powertrain Control Module      | PCM          | 7E0          | Engine control, fuel, emissions |
| Transmission Control Module    | TCM          | 7E1          | Transmission shifting and temp |
| Body Control Module            | BCM          | 726          | Doors, lighting, TPMS, HVAC |
| Instrument Panel Cluster       | IPC          | 720          | Gauges, trip data, warnings |
| Anti-lock Brake System         | ABS          | 760          | Wheel speeds, brake pressure |
| Power Steering Control Module  | PSCM         | 730          | Electric power steering data |
| Restraint Control Module       | RCM          | 737          | Airbags, crash sensors |
| Accessory Protocol Interface   | APIM         | 7D0          | SYNC 3/4 infotainment system |
| Audio Control Module           | ACM          | 7D1          | Audio system control (if separate from APIM) |
| All-Wheel Drive Module         | AWDM         | 7E2 (varies) | Torque split, clutch duty, AWD lock |
| Battery Monitoring System      | BMS          | 726 or 7E2   | Battery state, current, voltage |
| Heating, Ventilation, A/C      | HVAC         | 726          | Fan speed, A/C request, cabin temp |
| Trailer Brake Control Module   | TBCM         | 745          | Electric trailer brake interface |
| Door Control Modules (LF/RF)   | DDM / PDM    | 742 / 743    | Mirror and window controls |
| Telematics Control Unit        | TCU          | 7C0          | Remote start, modem, OTA updates |
| Generic Electronic Module      | GEM          | 726          | Older naming for parts of BCM |
| Smart Junction Box             | SJB          | 726          | Relay control, fuses, lighting |
| Tire Pressure Monitoring Sys.  | TPMS         | 726 (Mode 22) or 0x3B3+ | Tire data, often broadcast |

## PIDs of Interest

The following is not exhaustive, but an indication of PIDs that may be interesting to log in WiCAN.  This little will be consolidated.  

Subnmit an issue if you have a request.  Provide the PID (Hex).

### Powertrain Control Module

| CAN ID | PID (Hex) | Description | Home Assistant Idea |
|--------|-----------|-------------|----------------------|
| 7E0    | 22F40B    | Cylinder Head Temperature | Create Gauge |
| 7E0    | 221310    | Engine Oil Temperature | Create Gauge |
| 7E1    | 22134C    | Transmission Fluid Temp | Create Gauge |
| 7E0    | 221672    | Boost Pressure | Create Gauge |
| 7E0    | 22115E    | Engine Load | Create Gauge |
| 7E0    | 22162C    | Mass Air Flow | Estimate fuel economy and load |
| 7E0    | 221106    | Brake Pedal Position | Not sure, could be interesting. |
| 7E0    | 22110E    | Barometric Pressure | Estimate elevation |
| 7E1    | 220407    | Gear Position (PRND) | Trigger cabinet locks and "moving state" |

| PID (Hex) | Description | Type | Home Assistant Use |
|-----------|-------------|------|---------------------|
| 220407    | Gear Position (PRND) | `sensor` (enum) | Trigger "driving mode" automations |
| 22134C    | Transmission Fluid Temperature | `sensor` (°C/°F) | Alert for overheating or trip logging |
| 220408    | Reverse Gear Status | `binary_sensor` | Auto-switch to rear camera or lights |
| 220409    | Transmission Overheat Warning | `binary_sensor` | Trigger warnings or disable towing |
| 22040A    | TCC (Torque Converter Clutch) Lock Status | `binary_sensor` | Detect slippage or active locking |
| 22040B    | TCM Learning Mode Active | `binary_sensor` | Log transmission relearn events |

#### All-Wheel Drive Module

| PID (Hex) | Description                          | Type             | Home Assistant Use |
|-----------|--------------------------------------|------------------|---------------------|
| 221501    | AWD Mode Status (Auto/Lock/Dis)      | `sensor` (enum)  | Display AWD mode and log changes |
| 221502    | AWD Clutch Duty Cycle (%)            | `sensor`         | Estimate torque engagement |
| 221503    | Front Torque Output (Nm)             | `sensor`         | Monitor power distribution to front wheels |
| 221504    | Rear Torque Output (Nm)              | `sensor`         | Monitor torque to rear wheels |
| 221505    | AWD Overheat Status                  | `binary_sensor`  | Alert if AWD system overheats |
| 221506    | AWD Fault Status                     | `binary_sensor`  | Trigger service or diagnostics alerts |
| 221507    | Wheel Slip Detection                 | `binary_sensor`  | Automate safety features on slip |
| 221508    | AWD Lock Active                      | `binary_sensor`  | Detect when AWD lock is engaged |
| 221509    | AWD Off-Road Mode Active             | `binary_sensor`  | Use for off-road automation or logging |
| 22150A    | AWD Torque Request (Driver Input)    | `sensor`         | For advanced logging / driver behavior |
| 22150B    | AWD System Temperature               | `sensor` (°C)    | Monitor thermal state for safety |
| 22150C    | AWD Shaft Speed Front                | `sensor` (RPM)   | Detect traction or wheel sync issues |
| 22150D    | AWD Shaft Speed Rear                 | `sensor` (RPM)   | Cross-check drive ratios |
| 22150E    | AWD Clutch Temperature               | `sensor` (°C)    | Thermal monitoring of clutch pack |
| 22150F    | AWD Torque Gradient Rate             | `sensor`         | Observe torque transition behavior |
| 221510    | Drive Mode Requested (Surface,Tow)  | `sensor` (enum)  | Automate mode-specific settings |

### Body Control Module

| PID (Hex) | Description | Sensor Type | Home Assistant Idea |
|-----------|-------------|----------------|----------------------|
| PID (Hex) | Description                 | Type     | Notes                        |
|-----------|-----------------------------|----------|------------------------------|
| 22149C    | Tire Pressure FL (Front Left)  | `sensor` | Usually in psi or kPa (x0.25) |
| 22149D    | Tire Pressure FR (Front Right) | `sensor` |                              |
| 22149E    | Tire Pressure RL (Rear Left)   | `sensor` |                              |
| 22149F    | Tire Pressure RR (Rear Right)  | `sensor` |                              |
| 220203    | Ignition State | `binary_sensor` | Drive start/stop-based automations |
| 22020F    | Parking Brake Applied | `binary_sensor` | Alert when vehicle is parked |
| 220204    | Key In Ignition | `binary_sensor` | Alert if key left in ignition while parked |
| 220205    | Driver Seatbelt Buckled | `binary_sensor` | Alert or safety condition |
| 22020D    | Reverse Lights Status | `binary_sensor` | Auto-switch rear camera or light when reversing |
| 2211D2    | Door Ajar Status | `binary_sensor` | Trigger door-open alerts or lighting automations |
| 220232    | Left Turn Signal Status | `binary_sensor` | Signal awareness or camera logic |
| 220233    | Right Turn Signal Status | `binary_sensor` | Signal awareness or camera logic |
| 220501    | Headlamp Status | `binary_sensor` | Trigger night mode for screen/lighting |
| 220502    | High Beam Status | `binary_sensor` | Trigger other aftermarket headlamps |
| 220210    | Fog Lamp Status | `binary_sensor` | Drive lighting logic or display |
| 220240    | Interior Light Status | `binary_sensor` | Useful for interior lighting automation |
| 220206    | Power Mode (Run/Acc/Off) | `sensor` (enum) | Determine accessory vs. drive mode for system readiness |
| 220201    | Battery Voltage | `sensor` | Alert on battery drain or alternator failure |
| 22144B    | Ambient Air Temperature | `sensor` | Optimize HVAC or fan automation |
| 220431    | Cabin Temperature | `sensor` | Drive climate fan/vent control logic |
| 220425    | HVAC Blower Speed | `sensor` | Fan speed level (typically 0–7 or 0–100%) |
| 220426    | HVAC A/C Request | `binary_sensor` | Monitor compressor state for fuel economy |
| 220427    | HVAC Recirculation Status | `binary_sensor` | Shows recirc door position (fresh/recirc) |
| 220428    | HVAC Mode Control | `sensor` | Airflow direction: panel/floor/defrost etc. |
| 220429    | HVAC Temperature Setpoint | `sensor` | Target temp for HVAC in °C or °F |
| 22042A    | HVAC Compressor Status | `binary_sensor` | Whether A/C compressor is active |

| PID (Hex) | Description | Type | Home Assistant Use |
|-----------|-------------|------|---------------------|
| 220701    | ABS Active Status | `binary_sensor` | Detect active braking interventions (e.g., icy roads) |
| 220702    | Traction Control Active | `binary_sensor` | Alert when slipping/skidding occurs |
| 220703    | Brake Pressure Applied | `sensor` (bar/psi) | Estimate braking force, trigger alerts or logging |
| 220704    | Wheel Speed FL | `sensor` (km/h or mph) | Per-wheel speed monitoring (front left) |
| 220705    | Wheel Speed FR | `sensor` | For traction/skid detection |
| 220706    | Wheel Speed RL | `sensor` | Rear left speed |
| 220707    | Wheel Speed RR | `sensor` | Rear right speed |
| 220708    | Yaw Rate | `sensor` (°/s) | Detect swerving or sudden lane changes |
| 220709    | ABS Fault Light Status | `binary_sensor` | Alert on critical braking system faults |
| 22070A    | Stability Control Disabled (Manual) | `binary_sensor` | Track if user disabled ESC system |

#### Audio Control Module

| PID (Hex) | Description                              | Type             | Home Assistant Use |
|-----------|------------------------------------------|------------------|---------------------|
| 220101    | Volume Level                              | `sensor` (0–100) | Display and log volume |
| 220102    | Mute Status                               | `binary_sensor`  | Detect mute state |
| 220103    | Audio Source                              | `sensor` (enum)  | Identify BT/FM/USB etc. |
| 220104    | Playback Status                           | `sensor` (enum)  | Playing, Paused, Stopped |
| 220105    | Track Title                               | `sensor` (string)| Surface current track |
| 220106    | Artist Name                               | `sensor` (string)| Display artist info |
| 220107    | Radio Frequency                           | `sensor`         | Show current AM/FM station |

#### Instrument Panel Cluster

Some of these are redundant and may be removed.

| PID (Hex) | Description | Suggested Type | Home Assistant Use |
|-----------|-------------|----------------|---------------------|
| 220101    | Vehicle Speed (IPC-reported) | `sensor` | Redundant or high-precision speed readout |
| 220102    | Engine RPM (IPC Mirror) | `sensor` | Sync with PCM or for backup |
| 220103    | Odometer Value | `sensor` | Show total mileage on dashboard |
| 220106    | Fuel Level % | `sensor` | Display current fuel percentage |
| 220107    | Average Fuel Economy | `sensor` | Display or log for trip analysis |
| 220108    | Instant Fuel Economy | `sensor` | Real-time mpg/l/100km estimation |
| 220109    | DTE (Distance to Empty) | `sensor` | Drive fuel stop reminders or alerts |
| 220104    | Trip Odometer A | Trip 1 | `sensor` (mi/km) | Track distance driven on current trip |
| 220105    | Trip Odometer B | Trip 2 | `sensor` (mi/km) | Second trip meter (e.g. since fuel-up) |
| 220107    | Average Fuel Economy A | Trip 1 | `sensor` (mpg or L/100km) | Efficiency over trip 1 |
| 22011A    | Average Fuel Economy B | Trip 2 | `sensor` (mpg or L/100km) | Efficiency over trip 2 |
| 22011D    | Average Speed A | Trip 1 | `sensor` (mph or km/h) | Track how fast you're driving on average |
| 22011E    | Average Speed B | Trip 2 | `sensor` (mph or km/h) | Trip 2 average speed |
| 22011F    | Elapsed Time A | Trip 1 | `sensor` (min or HH:MM) | Duration of trip 1 |
| 220120    | Elapsed Time B | Trip 2 | `sensor` (min or HH:MM) | Duration of trip 2 |
| 22010A    | Gear Indicator Display | `sensor` (enum) | Show current gear (P, R, N, D, M) |
| 22010C    | Seatbelt Warning Light | `binary_sensor` | Trigger alert or seat occupancy logic |
| 22010D    | ABS Warning Light | `binary_sensor` | Log for history |
| 22010E    | Traction Control Light | `binary_sensor` | Log for history |
| 220111    | Check Engine Light | `binary_sensor` | Log for history |
| 220112    | Turn Signal Status (L+R) | `sensor` (bitfield or enum) | Drive external signal mirrors/cameras |
| 220113    | High Beam Indicator | `binary_sensor` | Adjust cabin or screen lighting |
| 220114    | Cruise Control Active | `binary_sensor` | Indicate if cruise is currently engaged |
| 220115    | Cruise Control Set Speed | `sensor` (e.g., km/h or mph) | Display target cruise speed |
| 220116    | Cruise Control Enabled | `binary_sensor` | Indicates if cruise system is turned on but not necessarily engaged |

#### Accessory Protocol Interface Module

| PID (Hex) | Description | Suggested Type | Home Assistant Use |
|-----------|-------------|----------------|---------------------|
| 220101    | Media Playback Status | `sensor` (enum) | Display "playing", "paused", "stopped" status |
| 220102    | Current Track Title/Artist | `sensor` (string) | Show track title or streaming source |
| 220103    | Volume Level | `sensor` (0–100) | Display volume; mute triggers |
| 220104    | Source Selection | `sensor` (enum) | Detect if USB, Bluetooth, Radio, etc. is active |
| 22010F    | Bluetooth Connected Device | `sensor` (string) | Display connected device name |
| 220106    | Reverse Camera Active                | `binary_sensor`      | Trigger rear camera display |

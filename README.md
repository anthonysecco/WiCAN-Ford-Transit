> This repo is under development and is constantly changing.  I do not guarantee the accuracy of the information below.

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

| PID (Hex) | Description | Home Assistant Idea |
|-----------|-------------|----------------------|
| 22F40B    | Cylinder Head Temperature | Create Gauge |
| 221310    | Engine Oil Temperature | Create Gauge |
| 22134C    | Transmission Fluid Temp | Create Gauge |
| 221672    | Boost Pressure | Create Gauge |
| 22115E    | Engine Load | Create Gauge |
| 22162C    | Mass Air Flow | Estimate fuel economy and load |
| 221106    | Brake Pedal Position | Not sure, could be interesting |
| 22110E    | Barometric Pressure | Estimate elevation |
| 220407    | Gear Position (PRND) | Trigger cabinet locks and "moving state" |
| 221678    | Fuel Injection Quantity | Estimate real-time fuel usage |
| 22116B    | Fuel Pulse Width | Approximate injector duration per cycle |
| 221016    | Short Term Fuel Trim Bank 1 | Fuel system status & efficiency |
| 221017    | Long Term Fuel Trim Bank 1 | Trend engine adaptation and tune health |
| 22114E    | Fuel System Status | Detect open/closed loop (affects fuel use) |
| 22140D    | Intake Air Temperature Sensor | Detect ambient impact on combustion |
| 221131    | Accelerator Pedal Position | Analyze driver input or coasting detection |

### Transmission Control Module

### Transmission Control Module

| PID (Hex) | Description                          | Type             | Conversion Formula                                                           | Home Assistant Use                                   |
|-----------|--------------------------------------|------------------|-------------------------------------------------------------------------------|------------------------------------------------------|
| 220407    | Gear Position (PRND)                 | `sensor` (enum)  | `A` → Enum: 0=Park, 1=Reverse, 2=Neutral, 3=Drive, 4=Manual, etc.             | Trigger "driving mode" automations                   |
| 22134C    | Transmission Fluid Temperature       | `sensor` (°C/°F) | `A - 40` for °C; convert to °F using `(A - 40) * 9/5 + 32`                    | Alert for overheating or trip logging                |
| 220408    | Reverse Gear Status                  | `binary_sensor`  | `A == 1` (1=True, 0=False)                                                    | Auto-switch to rear camera or lights                 |
| 220409    | Transmission Overheat Warning        | `binary_sensor`  | `A == 1`                                                                      | Trigger warnings or disable towing                   |
| 22040A    | TCC (Torque Converter Clutch) Lock Status | `binary_sensor`  | `A == 1`                                                                      | Detect slippage or active locking                    |
| 22040B    | TCM Learning Mode Active             | `binary_sensor`  | `A == 1`                                                                      | Log transmission relearn events                      |


### All-Wheel Drive Module

| PID (Hex) | Description                          | Type             | Conversion Formula                                                           | Home Assistant Use                                   |
|-----------|--------------------------------------|------------------|-------------------------------------------------------------------------------|------------------------------------------------------|
| 221501    | AWD Mode Status (Auto/Lock/Dis)      | `sensor` (enum)  | `A` → Enum: 0=Auto, 1=Lock, 2=Disabled                                        | Display AWD mode and log changes                     |
| 221502    | AWD Clutch Duty Cycle (%)            | `sensor`         | `A * 100 / 255`                                                               | Estimate torque engagement                           |
| 221503    | Front Torque Output (Nm)             | `sensor`         | `(A << 8) + B`                                                                | Monitor power distribution to front wheels           |
| 221504    | Rear Torque Output (Nm)              | `sensor`         | `(A << 8) + B`                                                                | Monitor torque to rear wheels                        |
| 221505    | AWD Overheat Status                  | `binary_sensor`  | `A == 1` (1=True, 0=False)                                                    | Alert if AWD system overheats                        |
| 221506    | AWD Fault Status                     | `binary_sensor`  | `A == 1`                                                                      | Trigger service or diagnostics alerts                |
| 221507    | Wheel Slip Detection                 | `binary_sensor`  | `A == 1`                                                                      | Automate safety features on slip                     |
| 221508    | AWD Lock Active                      | `binary_sensor`  | `A == 1`                                                                      | Detect when AWD lock is engaged                      |
| 221509    | AWD Off-Road Mode Active             | `binary_sensor`  | `A == 1`                                                                      | Use for off-road automation or logging               |
| 22150A    | AWD Torque Request (Driver Input)    | `sensor`         | `(A << 8) + B`                                                                | For advanced logging / driver behavior               |
| 22150B    | AWD System Temperature               | `sensor` (°C)    | `A - 40`                                                                      | Monitor thermal state for safety                     |
| 22150C    | AWD Shaft Speed Front                | `sensor` (RPM)   | `(A << 8) + B`                                                                | Detect traction or wheel sync issues                 |
| 22150D    | AWD Shaft Speed Rear                 | `sensor` (RPM)   | `(A << 8) + B`                                                                | Cross-check drive ratios                             |
| 22150E    | AWD Clutch Temperature               | `sensor` (°C)    | `A - 40`                                                                      | Thermal monitoring of clutch pack                    |
| 22150F    | AWD Torque Gradient Rate             | `sensor`         | `(A << 8) + B` (unitless or proprietary scaling likely)                       | Observe torque transition behavior                   |
| 221510    | Drive Mode Requested (Surface,Tow)   | `sensor` (enum)  | `A` → Enum: 0=Normal, 1=Surface, 2=Tow, etc. (OEM-specific mapping expected)  | Automate mode-specific settings                      |


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

### Anti-Lock Brake System

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
| 22070B    | Brake Pedal Switch Status | `binary_sensor` | Detect driver brake input for lighting or automation |
| 22070C    | Hydraulic Brake Boost Active | `binary_sensor` | Alert when brake assist is active (e.g., emergency braking) |
| 22070D    | ABS Control Active | `binary_sensor` | More specific than ABS status – shows if module is modulating brakes |
| 22070E    | Road Surface Estimation | `sensor` (enum) | Dry, wet, icy – for automation or warnings |
| 22070F    | Traction Control Intervention Level | `sensor` (0–100%) | Show real-time traction intervention effort |

### Audio Control Module

| PID (Hex) | Description                              | Type             | Home Assistant Use |
|-----------|------------------------------------------|------------------|---------------------|
| 220101    | Volume Level                              | `sensor` (0–100) | Display and log volume |
| 220102    | Mute Status                               | `binary_sensor`  | Detect mute state |
| 220103    | Audio Source                              | `sensor` (enum)  | Identify BT/FM/USB/etc. |
| 220104    | Playback Status                           | `sensor` (enum)  | Playing, Paused, Stopped |
| 220105    | Track Title                               | `sensor` (string)| Show current track |
| 220106    | Artist Name                               | `sensor` (string)| Show current artist |
| 220107    | Radio Frequency                           | `sensor`         | Display current FM/AM station |
| 220116    | Bluetooth Status                          | `sensor` (enum)  | Show if paired, connected, streaming |
| 22011A    | Track Duration (Seconds)                  | `sensor`         | Display or log track length |
| 22011B    | Current Playback Position (Seconds)       | `sensor`         | Track progress in audio playback |

### Instrument Panel Cluster

| PID (Hex) | Description                          | Type             | Conversion Formula                                                           | Home Assistant Use                                   |
|-----------|--------------------------------------|------------------|-------------------------------------------------------------------------------|------------------------------------------------------|
| 220101    | Vehicle Speed (IPC-reported)         | `sensor`         | `(A << 8) + B` → scale may vary (commonly 0.01 or 0.1 km/h per bit)           | Redundant or high-precision speed readout            |
| 220102    | Engine RPM (IPC Mirror)              | `sensor`         | `((A << 8) + B) / 4`                                                           | Sync with PCM or for backup                          |
| 220103    | Odometer Value                       | `sensor`         | `(A << 16) + (B << 8) + C` → typically in km                                  | Show total mileage on dashboard                      |
| 220106    | Fuel Level %                         | `sensor`         | `A * 100 / 255`                                                               | Display current fuel percentage                      |
| 220107    | Average Fuel Economy                 | `sensor`         | `(A << 8) + B` → scaling may be 0.1 mpg or L/100km                            | Display or log for trip analysis                     |
| 220108    | Instant Fuel Economy                 | `sensor`         | `(A << 8) + B` → real-time mpg/L/100km                                        | Real-time mpg/l/100km estimation                     |
| 220109    | DTE (Distance to Empty)              | `sensor`         | `(A << 8) + B`                                                                | Drive fuel stop reminders or alerts                  |
| 220104    | Trip Odometer A (Trip 1)             | `sensor`         | `(A << 8) + B` → km or miles depending on unit                                | Track distance driven on current trip                |
| 220105    | Trip Odometer B (Trip 2)             | `sensor`         | `(A << 8) + B`                                                                | Second trip meter (e.g. since fuel-up)               |
| 220107    | Average Fuel Economy A (Trip 1)      | `sensor`         | `(A << 8) + B`                                                                | Efficiency over trip 1                               |
| 22011A    | Average Fuel Economy B (Trip 2)      | `sensor`         | `(A << 8) + B`                                                                | Efficiency over trip 2                               |
| 22011D    | Average Speed A (Trip 1)             | `sensor`         | `A` or `(A << 8) + B` depending on range                                       | Track how fast you're driving on average             |
| 22011E    | Average Speed B (Trip 2)             | `sensor`         | Same as above                                                                 | Trip 2 average speed                                 |
| 22011F    | Elapsed Time A (Trip 1)              | `sensor`         | `A * 1 min` or `(A << 8) + B` → minutes                                        | Duration of trip 1                                   |
| 220120    | Elapsed Time B (Trip 2)              | `sensor`         | Same as above                                                                 | Duration of trip 2                                   |
| 22010A    | Gear Indicator Display               | `sensor` (enum)  | `A` → Enum: 0=P, 1=R, 2=N, 3=D, 4=M, etc.                                      | Show current gear (P, R, N, D, M)                    |
| 22010C    | Seatbelt Warning Light               | `binary_sensor`  | `A == 1`                                                                      | Trigger alert or seat occupancy logic                |
| 22010D    | ABS Warning Light                    | `binary_sensor`  | `A == 1`                                                                      | Log for history                                      |
| 22010E    | Traction Control Light               | `binary_sensor`  | `A == 1`                                                                      | Log for history                                      |
| 220111    | Check Engine Light                   | `binary_sensor`  | `A == 1`                                                                      | Log for history                                      |
| 220112    | Turn Signal Status (L+R)             | `sensor` (bitfield or enum) | Bitfield: Bit 0=Left, Bit 1=Right                                    | Drive external signal mirrors/cameras                |
| 220113    | High Beam Indicator                  | `binary_sensor`  | `A == 1`                                                                      | Adjust cabin or screen lighting                      |
| 220114    | Cruise Control Active                | `binary_sensor`  | `A == 1`                                                                      | Indicate if cruise is currently engaged              |
| 220115    | Cruise Control Set Speed             | `sensor`         | `(A << 8) + B`                                                                | Display target cruise speed                          |
| 220116    | Cruise Control Enabled               | `binary_sensor`  | `A == 1`                                                                      | Indicates if cruise system is turned on              |
| 220117    | Cruise Control Cancel Pressed        | `binary_sensor`  | `A == 1`                                                                      | Trigger automation or log driver input               |
| 220118    | Cruise Control Resume Pressed        | `binary_sensor`  | `A == 1`                                                                      | Log resume interaction or re-enable profiles         |
| 220119    | Cruise Accelerate/Set Pressed        | `binary_sensor`  | `A == 1`                                                                      | Detect when + button is used                         |
| 22011B    | Cruise Coast/Decelerate Pressed      | `binary_sensor`  | `A == 1`                                                                      | Detect when – button is used                         |
| 220121    | Engine Coolant Temp (IPC Mirror)     | `sensor` (°C/°F) | `A - 40` (°C); to °F: `(A - 40) * 9/5 + 32`                                   | Redundant to PCM, useful for gauge sync              |
| 220122    | Oil Pressure Indicator               | `binary_sensor`  | `A == 1`                                                                      | Alert if engine oil pressure drops                   |
| 220123    | Battery Warning Indicator            | `binary_sensor`  | `A == 1`                                                                      | Alert if charging system fails                       |
| 220124    | Fuel Warning Light                   | `binary_sensor`  | `A == 1`                                                                      | Trigger low fuel alert automations                   |
| 220125    | Washer Fluid Low Warning             | `binary_sensor`  | `A == 1`                                                                      | Alert when washer fluid is low                       |
| 220126    | Door Ajar Warning (IPC Mirror)       | `binary_sensor`  | `A == 1`                                                                      | Cross-check with BCM for redundancy                  |
| 220127    | Key In Ignition Reminder             | `binary_sensor`  | `A == 1`                                                                      | Notify if key left in ignition                       |
| 220128    | Driver Attention Alert Active        | `binary_sensor`  | `A == 1`                                                                      | Trigger break reminders or driving logs              |
| 220129    | Lane Departure Warning Status        | `binary_sensor`  | `A == 1`                                                                      | Automate lighting or haptic alert logic              |
| 22012A    | Drive Mode Display (Eco, Sport, etc) | `sensor` (enum)  | `A` → Enum: 0=Normal, 1=Eco, 2=Sport, etc. (OEM-defined)                      | Adjust vehicle behavior or dashboard styling         |
| 22012B    | Warning Chime Active                 | `binary_sensor`  | `A == 1`                                                                      | Track alerts for safety or comfort tuning            |
| 22012C    | TPMS Warning Light                   | `binary_sensor`  | `A == 1`                                                                      | Alert on tire pressure issues                        |
| 22012D    | Brake System Warning Light           | `binary_sensor`  | `A == 1`                                                                      | Catch braking faults (redundant to ABS)              |
| 22012E    | IPC Backlight Level                  | `sensor`         | `A` (0–255)                                                                   | Use to match cabin lighting with IPC brightness      |

### Accessory Protocol Interface Module

| PID (Hex) | Description | Suggested Type | Home Assistant Use |
|-----------|-------------|----------------|---------------------|
| 220101    | Media Playback Status | `sensor` (enum) | Display "playing", "paused", "stopped" status |
| 220102    | Current Track Title/Artist | `sensor` (string) | Show track title or streaming source |
| 220103    | Volume Level | `sensor` (0–100) | Display volume; mute triggers |
| 220104    | Source Selection | `sensor` (enum) | Detect if USB, Bluetooth, Radio, etc. is active |
| 22010F    | Bluetooth Connected Device | `sensor` (string) | Display connected device name |
| 220106    | Reverse Camera Active                | `binary_sensor`      | Trigger rear camera display |
| 220105    | Mute Status                         | `binary_sensor`  | Detect mute state to pause HVAC or dim lighting |
| 220107    | Navigation Active                   | `binary_sensor`  | Trigger nav-focused dashboards, mute media on turn-by-turn |
| 220108    | Map Display Mode (Night/Day)        | `sensor` (enum)  | Sync UI lighting to map mode |
| 220109    | Phone Call Active                   | `binary_sensor`  | Mute media and adjust climate while on call |
| 22010A    | Voice Assistant Activated           | `binary_sensor`  | Start voice-control automations |
| 22010B    | Wi‑Fi Hotspot Status                | `binary_sensor`  | Automate connectivity-dependent features |
| 22010C    | GPS Signal Strength                 | `sensor`         | Alert if GPS signal is weak |
| 22010D    | CarPlay/Android Auto State          | `binary_sensor`  | Adjust UI or disable alerts during car connectivity |
| 220110    | System Brightness Level             | `sensor` (0–255) | Match cabin lighting or screen dimming |
| 220111    | Touchscreen Interaction             | `binary_sensor`  | Log driver interaction or wake dashboards |
| 220112    | Rear-seat Entertainment Active      | `binary_sensor`  | Mute front speakers or sync media |
| 220113    | Audio Language Setting              | `sensor` (string)| Display or adjust based on UI language |
| 220114    | Voice Prompt Volume Setting         | `sensor`         | Adjust alert volume thresholds |
| 220115    | EQ (Equalizer) Preset               | `sensor` (enum)  | Automate between sound profiles |
| 220116    | Station Preset Buttons              | `sensor`         | Log radio button use or presets |
| 220117    | Satellite Radio Status              | `binary_sensor`  | Indicate Sirius/XM activity |
| 220118    | Traffic Service Data Active         | `binary_sensor`  | Display TMC alerts or reroute logic |
| 220119    | Climate Bar Display Enabled         | `binary_sensor`  | Customize HVAC UI behavior |
| 22011A    | DSP (Digital Sound Processing) Mode | `sensor` (enum)  | Trigger cabin audio profiles |
| 22011B    | Rear-Seat Climate Control Active    | `binary_sensor`  | Sync rear climate logic |
| 22011C    | Steering Wheel Control Input        | `sensor`         | Detect control interactions |
| 22011D    | Update Notification Active          | `binary_sensor`  | Alert user of APIM updates or errors |

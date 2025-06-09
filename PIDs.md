> This repo is under development and is constantly changing.  I do not guarantee the accuracy of the information below.

# Parameter IDs

OBD-II PIDs (Parameter IDs) are standardized codes used to request data from a vehicle’s electronic control units (ECUs) via the On-Board Diagnostics (OBD) port. They’re used by diagnostic tools, scan gauges, and systems like Home Assistant (via CAN integration) to read real-time sensor data.

There's two "Modes" of interest

### Modes

**Mode 1** shows "standard" PIDs as specified by SAE.  This includes common things like speed, RPM etc.

**Mode 22** shows manufacture specific data.  This is where we can get some detailed information about the vehicle.  Manufactures usually standardize around set of code across vehicles.  This means we can take things found on the F-150 or Explorer and apply it to the Transit given simialries in powertrain and modules.

### CAN Bus

The Ford Transit (especially 2020 and newer models) typically includes three main CAN buses, each serving different types of modules based on speed and priority. These buses are part of the vehicle’s network architecture that allows electronic modules to communicate.

| Bus Name    | Type         | Speed    | Purpose / Modules on Bus                                              |
| ----------- | ------------ | -------- | --------------------------------------------------------------------- |
| **HS-CAN1** | High-Speed   | 500 kbps | **Powertrain & chassis**: PCM, TCM, ABS, PSCM, RCM                    |
| **HS-CAN2** | High-Speed   | 500 kbps | **Body & lighting**: BCM, IPC, SJB, HVAC, TPMS, doors                 |
| **MS-CAN**  | Medium-Speed | 125 kbps | **Convenience & infotainment**: APIM, ACM, FCIM, audio, some lighting |

## List of Modules

Modules track sensor data and communication on the bus.  The WiCAN Pro module is needed to communicate beyond just HS-CAN1.

| Bus       | Abbreviation | CAN ID (Hex) | Module Name                  | Description                               |
|-----------|--------------|--------------|------------------------------|-------------------------------------------|
| HS-CAN1   | PCM          | 7E0          | Powertrain Control Module    | Engine control, fuel, emissions           |
| HS-CAN1   | TCM          | 7E1          | Transmission Control Module  | Transmission shifting and temp            |
| HS-CAN1   | ABS          | 760          | Anti-lock Brake System       | Wheel speeds, brake pressure              |
| HS-CAN1   | PSCM         | 730          | Power Steering Control Module| Electric power steering data              |
| HS-CAN1   | RCM          | 737          | Restraint Control Module     | Airbags, crash sensors                    |
| HS-CAN1   | AWDM         | 7E2 (varies) | All-Wheel Drive Module       | Torque split, clutch duty, AWD lock       |
| HS-CAN2   | BCM          | 726          | Body Control Module          | Doors, lighting, TPMS, HVAC               |
| HS-CAN2   | IPC          | 720          | Instrument Panel Cluster     | Gauges, trip data, warnings               |
| HS-CAN2   | BMS          | 726 / 7E2    | Battery Monitoring System     | Battery state, current, voltage          |
| HS-CAN2   | HVAC         | 726          | Heating, Ventilation, A/C    | Fan speed, A/C request, cabin temp        |
| HS-CAN2   | TBCM         | 745          | Trailer Brake Control Module | Electric trailer brake interface          |
| HS-CAN2   | DDM / PDM    | 742 / 743    | Door Control Modules (LF/RF) | Mirror and window controls                |
| HS-CAN2   | TCU          | 7C0          | Telematics Control Unit      | Remote start, modem, OTA updates          |
| HS-CAN2   | GEM          | 726          | Generic Electronic Module    | Older naming for parts of BCM             |
| HS-CAN2   | SJB          | 726          | Smart Junction Box           | Relay control, fuses, lighting            |
| HS-CAN2   | TPMS         | 726 / 3B3+   | Tire Pressure Monitoring Sys.| Tire data, often broadcast                |
| MS-CAN    | APIM         | 7D0          | Accessory Protocol Interface | SYNC 3/4 infotainment system              |
| MS-CAN    | ACM          | 7D1          | Audio Control Module         | Audio system control (if separate)        |


## PIDs of Interest

The following is not exhaustive, but an indication of PIDs that may be interesting to log in WiCAN.  This little will be consolidated.  

Subnmit an issue if you have a request.  Provide the PID (Hex).

### Powertrain / Engine Sensors

| PID (Hex) | Description                          | Type             | Conversion Formula                                                           | Home Assistant Use                                   |
|-----------|--------------------------------------|------------------|-------------------------------------------------------------------------------|------------------------------------------------------|
| 22F40B    | Cylinder Head Temperature            | `sensor` (°C)    | `A - 40`                                                                      | Create Gauge                                         |
| 221310    | Engine Oil Temperature               | `sensor` (°C)    | `A - 40`                                                                      | Create Gauge                                         |
| 22134C    | Transmission Fluid Temp              | `sensor` (°C)    | `A - 40`                                                                      | Create Gauge                                         |
| 221672    | Boost Pressure                       | `sensor` (kPa)   | `(A << 8) + B`                                                                | Create Gauge                                         |
| 22115E    | Engine Load                          | `sensor` (%)     | `A * 100 / 255`                                                               | Create Gauge                                         |
| 22162C    | Mass Air Flow                        | `sensor` (g/s)   | `(A << 8) + B` / 100                                                          | Estimate fuel economy and load                      |
| 221106    | Brake Pedal Position                 | `sensor` (%)     | `A * 100 / 255`                                                               | Could be interesting for deceleration logic          |
| 22110E    | Barometric Pressure                  | `sensor` (kPa)   | `A` or `(A << 8) + B` depending on scaling (commonly 1 kPa per bit)          | Estimate elevation                                   |
| 220407    | Gear Position (PRND)                 | `sensor` (enum)  | `A` → Enum: 0=P, 1=R, 2=N, 3=D, 4=M, etc. (OEM-defined)                      | Trigger cabinet locks and "moving state"            |
| 221678    | Fuel Injection Quantity              | `sensor` (mg/st) | `(A << 8) + B` → scaling may apply (e.g., * 0.1 mg/stroke)                   | Estimate real-time fuel usage                       |
| 22116B    | Fuel Pulse Width                     | `sensor` (ms)    | `(A << 8) + B` / 1000                                                         | Approximate injector duration per cycle             |
| 221016    | Short Term Fuel Trim Bank 1          | `sensor` (%)     | `A - 128` * 100 / 128                                                         | Fuel system status & efficiency                     |
| 221017    | Long Term Fuel Trim Bank 1           | `sensor` (%)     | `A - 128` * 100 / 128                                                         | Trend engine adaptation and tune health             |
| 22114E    | Fuel System Status                   | `sensor` (enum)  | `A` → Enum: 1=Open Loop, 2=Closed Loop, 4=Fault, etc.                        | Detect open/closed loop (affects fuel use)          |
| 22140D    | Intake Air Temperature Sensor        | `sensor` (°C)    | `A - 40`                                                                      | Detect ambient impact on combustion                 |
| 221131    | Accelerator Pedal Position           | `sensor` (%)     | `A * 100 / 255`                                                               | Analyze driver input or coasting detection          |


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

| PID (Hex) | Description                          | Type              | Conversion Formula                                                           | Home Assistant Use                                   |
|-----------|--------------------------------------|-------------------|-------------------------------------------------------------------------------|------------------------------------------------------|
| 22149C    | Tire Pressure FL (Front Left)        | `sensor`          | `A * 0.25` → psi or kPa depending on vehicle                                 | Usually in psi or kPa (x0.25)                        |
| 22149D    | Tire Pressure FR (Front Right)       | `sensor`          | `A * 0.25`                                                                    |                                                      |
| 22149E    | Tire Pressure RL (Rear Left)         | `sensor`          | `A * 0.25`                                                                    |                                                      |
| 22149F    | Tire Pressure RR (Rear Right)        | `sensor`          | `A * 0.25`                                                                    |                                                      |
| 220203    | Ignition State                       | `binary_sensor`   | `A == 1`                                                                      | Drive start/stop-based automations                   |
| 22020F    | Parking Brake Applied                | `binary_sensor`   | `A == 1`                                                                      | Alert when vehicle is parked                         |
| 220204    | Key In Ignition                      | `binary_sensor`   | `A == 1`                                                                      | Alert if key left in ignition while parked           |
| 220205    | Driver Seatbelt Buckled              | `binary_sensor`   | `A == 1`                                                                      | Alert or safety condition                            |
| 22020D    | Reverse Lights Status                | `binary_sensor`   | `A == 1`                                                                      | Auto-switch rear camera or light when reversing      |
| 2211D2    | Door Ajar Status                     | `binary_sensor`   | Bitfield: bits 0–4 for each door (FL/FR/RL/RR/Hatch)                          | Trigger door-open alerts or lighting automations     |
| 220232    | Left Turn Signal Status              | `binary_sensor`   | `A == 1`                                                                      | Signal awareness or camera logic                     |
| 220233    | Right Turn Signal Status             | `binary_sensor`   | `A == 1`                                                                      | Signal awareness or camera logic                     |
| 220501    | Headlamp Status                      | `binary_sensor`   | `A == 1`                                                                      | Trigger night mode for screen/lighting               |
| 220502    | High Beam Status                     | `binary_sensor`   | `A == 1`                                                                      | Trigger other aftermarket headlamps                  |
| 220210    | Fog Lamp Status                      | `binary_sensor`   | `A == 1`                                                                      | Drive lighting logic or display                      |
| 220240    | Interior Light Status                | `binary_sensor`   | `A == 1`                                                                      | Useful for interior lighting automation              |
| 220206    | Power Mode (Run/Acc/Off)             | `sensor` (enum)   | `A` → Enum: 0=Off, 1=ACC, 2=Run, 3=Crank (OEM-defined)                        | Determine accessory vs. drive mode                   |
| 220201    | Battery Voltage                      | `sensor`          | `(A << 8) + B` → typically divide by 100 for volts (e.g., 1265 = 12.65 V)     | Alert on battery drain or alternator failure         |
| 22144B    | Ambient Air Temperature              | `sensor`          | `A - 40` (°C); optional: `(A - 40) * 9/5 + 32` for °F                          | Optimize HVAC or fan automation                      |
| 220431    | Cabin Temperature                    | `sensor`          | `A - 40`                                                                      | Drive climate fan/vent control logic                 |
| 220425    | HVAC Blower Speed                    | `sensor`          | `A` (0–7 or 0–100 depending on scaling)                                       | Fan speed level (typically 0–7 or 0–100%)            |
| 220426    | HVAC A/C Request                     | `binary_sensor`   | `A == 1`                                                                      | Monitor compressor state for fuel economy            |
| 220427    | HVAC Recirculation Status            | `binary_sensor`   | `A == 1`                                                                      | Shows recirc door position (fresh/recirc)            |
| 220428    | HVAC Mode Control                    | `sensor`          | `A` → Enum: 0=Panel, 1=Floor, 2=Defrost, etc.                                 | Airflow direction: panel/floor/defrost               |
| 220429    | HVAC Temperature Setpoint            | `sensor`          | `A` or `(A << 8) + B` → °C or °F depending on configuration                   | Target temp for HVAC                                 |
| 22042A    | HVAC Compressor Status               | `binary_sensor`   | `A == 1`                                                                      | Whether A/C compressor is active                     |


### Anti-Lock Brake System

| PID (Hex) | Description                              | Type             | Conversion Formula                                                           | Home Assistant Use                                   |
|-----------|------------------------------------------|------------------|-------------------------------------------------------------------------------|------------------------------------------------------|
| 220701    | ABS Active Status                        | `binary_sensor`  | `A == 1`                                                                      | Detect active braking interventions (e.g., icy roads)|
| 220702    | Traction Control Active                  | `binary_sensor`  | `A == 1`                                                                      | Alert when slipping/skidding occurs                  |
| 220703    | Brake Pressure Applied                   | `sensor` (bar/psi)| `(A << 8) + B` → Typically scaled (e.g., * 0.1 psi or * 0.01 bar)             | Estimate braking force, trigger alerts or logging    |
| 220704    | Wheel Speed FL                           | `sensor`         | `(A << 8) + B` → km/h or mph depending on config (e.g., * 0.01)               | Per-wheel speed monitoring (front left)              |
| 220705    | Wheel Speed FR                           | `sensor`         | Same as above                                                                 | For traction/skid detection                          |
| 220706    | Wheel Speed RL                           | `sensor`         | Same as above                                                                 | Rear left speed                                      |
| 220707    | Wheel Speed RR                           | `sensor`         | Same as above                                                                 | Rear right speed                                     |
| 220708    | Yaw Rate                                 | `sensor` (°/s)   | `(A << 8) + B` → Typically scaled (e.g., * 0.1 °/s)                           | Detect swerving or sudden lane changes               |
| 220709    | ABS Fault Light Status                   | `binary_sensor`  | `A == 1`                                                                      | Alert on critical braking system faults              |
| 22070A    | Stability Control Disabled (Manual)      | `binary_sensor`  | `A == 1`                                                                      | Track if user disabled ESC system                    |
| 22070B    | Brake Pedal Switch Status                | `binary_sensor`  | `A == 1`                                                                      | Detect driver brake input for lighting or automation |
| 22070C    | Hydraulic Brake Boost Active             | `binary_sensor`  | `A == 1`                                                                      | Alert when brake assist is active                    |
| 22070D    | ABS Control Active                       | `binary_sensor`  | `A == 1`                                                                      | Shows if ABS module is actively modulating brakes    |
| 22070E    | Road Surface Estimation                  | `sensor` (enum)  | `A` → Enum: 0=Dry, 1=Wet, 2=Snow/Ice, etc. (OEM-defined)                     | For automation or warnings                           |
| 22070F    | Traction Control Intervention Level      | `sensor` (0–100%)| `A * 100 / 255`                                                               | Show real-time traction intervention effort          |


### Audio Control Module

| PID (Hex) | Description                              | Type             | Conversion Formula                                                           | Home Assistant Use                                   |
|-----------|------------------------------------------|------------------|-------------------------------------------------------------------------------|------------------------------------------------------|
| 220101    | Volume Level                             | `sensor` (0–100) | `A * 100 / 255`                                                               | Display and log volume                               |
| 220102    | Mute Status                              | `binary_sensor`  | `A == 1`                                                                      | Detect mute state                                    |
| 220103    | Audio Source                             | `sensor` (enum)  | `A` → Enum: 0=FM, 1=AM, 2=Bluetooth, 3=USB, etc. (OEM-defined)                | Identify BT/FM/USB/etc.                              |
| 220104    | Playback Status                          | `sensor` (enum)  | `A` → Enum: 0=Stopped, 1=Playing, 2=Paused                                    | Playing, Paused, Stopped                             |
| 220105    | Track Title                              | `sensor` (string)| ASCII string from bytes A…N                                                   | Show current track                                   |
| 220106    | Artist Name                              | `sensor` (string)| ASCII string from bytes A…N                                                   | Show current artist                                  |
| 220107    | Radio Frequency                          | `sensor`         | `(A << 8) + B` → kHz (e.g. 10170 = 101.7 MHz)                                 | Display current FM/AM station                        |
| 220116    | Bluetooth Status                         | `sensor` (enum)  | `A` → Enum: 0=Disconnected, 1=Paired, 2=Connected, 3=Streaming (OEM-defined)  | Show if paired, connected, streaming                 |
| 22011A    | Track Duration (Seconds)                 | `sensor`         | `(A << 8) + B`                                                                | Display or log track length                          |
| 22011B    | Current Playback Position (Seconds)      | `sensor`         | `(A << 8) + B`                                                                | Track progress in audio playback                     |


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

| PID (Hex) | Description                          | Type               | Conversion Formula                                                           | Home Assistant Use                                   |
|-----------|--------------------------------------|--------------------|-------------------------------------------------------------------------------|------------------------------------------------------|
| 220101    | Media Playback Status                | `sensor` (enum)    | `A` → Enum: 0=Stopped, 1=Playing, 2=Paused                                    | Display "playing", "paused", "stopped" status        |
| 220102    | Current Track Title/Artist           | `sensor` (string)  | ASCII string from bytes A…N                                                   | Show track title or streaming source                 |
| 220103    | Volume Level                         | `sensor` (0–100)   | `A * 100 / 255`                                                               | Display volume; mute triggers                        |
| 220104    | Source Selection                     | `sensor` (enum)    | `A` → Enum: 0=Radio, 1=USB, 2=Bluetooth, 3=CarPlay, etc. (OEM-defined)        | Detect if USB, Bluetooth, Radio, etc. is active      |
| 22010F    | Bluetooth Connected Device           | `sensor` (string)  | ASCII string from bytes A…N                                                   | Display connected device name                        |
| 220106    | Reverse Camera Active                | `binary_sensor`    | `A == 1`                                                                      | Trigger rear camera display                          |
| 220105    | Mute Status                          | `binary_sensor`    | `A == 1`                                                                      | Detect mute state to pause HVAC or dim lighting      |
| 220107    | Navigation Active                    | `binary_sensor`    | `A == 1`                                                                      | Trigger nav-focused dashboards, mute media on nav    |
| 220108    | Map Display Mode (Night/Day)         | `sensor` (enum)    | `A` → Enum: 0=Day, 1=Night, 2=Auto                                            | Sync UI lighting to map mode                         |
| 220109    | Phone Call Active                    | `binary_sensor`    | `A == 1`                                                                      | Mute media and adjust climate while on call          |
| 22010A    | Voice Assistant Activated            | `binary_sensor`    | `A == 1`                                                                      | Start voice-control automations                      |
| 22010B    | Wi‑Fi Hotspot Status                 | `binary_sensor`    | `A == 1`                                                                      | Automate connectivity-dependent features             |
| 22010C    | GPS Signal Strength                  | `sensor`           | `A` (0–255 scale); optional: `A * 100 / 255` for percentage                   | Alert if GPS signal is weak                          |
| 22010D    | CarPlay/Android Auto State           | `binary_sensor`    | `A == 1`                                                                      | Adjust UI or disable alerts during car connectivity  |
| 220110    | System Brightness Level              | `sensor` (0–255)   | `A`                                                                           | Match cabin lighting or screen dimming               |
| 220111    | Touchscreen Interaction              | `binary_sensor`    | `A == 1`                                                                      | Log driver interaction or wake dashboards            |
| 220112    | Rear-seat Entertainment Active       | `binary_sensor`    | `A == 1`                                                                      | Mute front speakers or sync media                    |
| 220113    | Audio Language Setting               | `sensor` (string)  | ASCII string from bytes A…N                                                   | Display or adjust based on UI language               |
| 220114    | Voice Prompt Volume Setting          | `sensor`           | `A` (0–255)                                                                   | Adjust alert volume thresholds                       |
| 220115    | EQ (Equalizer) Preset                | `sensor` (enum)    | `A` → Enum: 0=Flat, 1=Bass Boost, 2=Treble, etc. (OEM-specific)              | Automate between sound profiles                      |
| 220116    | Station Preset Buttons               | `sensor`           | Bitfield or index code for pressed preset                                     | Log radio button use or presets                      |
| 220117    | Satellite Radio Status               | `binary_sensor`    | `A == 1`                                                                      | Indicate Sirius/XM activity                          |
| 220118    | Traffic Service Data Active          | `binary_sensor`    | `A == 1`                                                                      | Display TMC alerts or reroute logic                  |
| 220119    | Climate Bar Display Enabled          | `binary_sensor`    | `A == 1`                                                                      | Customize HVAC UI behavior                           |
| 22011A    | DSP (Digital Sound Processing) Mode  | `sensor` (enum)    | `A` → Enum: 0=Normal, 1=Concert, 2=Studio, etc. (OEM-defined)                | Trigger cabin audio profiles                         |
| 22011B    | Rear-Seat Climate Control Active     | `binary_sensor`    | `A == 1`                                                                      | Sync rear climate logic                              |
| 22011C    | Steering Wheel Control Input         | `sensor`           | Bitfield or input code; map per OEM spec                                     | Detect control interactions                          |
| 22011D    | Update Notification Active           | `binary_sensor`    | `A == 1`                                                                      | Alert user of APIM updates or errors                 |

### Battery Monitoring System

| PID (Hex) | Description                   | Type     | Home Assistant Use |
|-----------|-------------------------------|----------|---------------------|
| 221601    | Battery Voltage (12 V)        | `sensor` | Monitor health, alert on under/over-voltage |
| 221602    | Battery Current (A)           | `sensor` (±) | Show charging/discharging; power draw logic |
| 221603    | Battery State-of-Charge (%)   | `sensor` | Estimate runtime & battery health |
| 221604    | Battery State-of-Health (%)   | `sensor` | Detect degradation over time |
| 221605    | BMS Temperature (module)      | `sensor` (°C/°F) | Prevent inductive heating or faults |
| 221606    | BMS Ambient Temperature       | `sensor` | Safety cut-offs in extreme temps |
| 221607    | BMS Fault Code                | `sensor` (enum/bitfield) | Aggregate battery-related faults |
| 221608    | BMS Load Disconnect Status    | `binary_sensor` | Detect high current disconnects |
| 221609    | Alternator Status             | `binary_sensor` | Automate smart charging or generator control |
| 22160A    | Charging Cycle Count          | `sensor` | Track battery usage cycles |

### Trailer Brake Control Module

| PID (Hex) | Description                    | Type             | Home Assistant Use |
|-----------|--------------------------------|------------------|---------------------|
| 220900    | TBC Mode (Electric / EOH)      | `sensor` (enum)  | Detect mode to adjust control logic |
| 220901    | Trailer Brake Effort Level     | `sensor` (enum)  | Track current gain setting |
| 220902    | Trailer Sway Control Status    | `binary_sensor`  | Alert when sway control is active |
| 220903    | Trailer Connected              | `binary_sensor`  | Trigger trailer-dependent flows |
| 220904    | Manual Slider Active           | `binary_sensor`  | Detect manual override usage |
| 220907    | TBC Fault Status               | `binary_sensor`  | Alert on internal module faults |
| 220908    | Output Circuit Overload       | `binary_sensor`  | Detect short/overload (e.g., DTC B148A:11) |
| 220909    | Output Circuit Short to Batt   | `binary_sensor`  | Detect wiring faults (e.g., DTC B148A:12) |
| 22090A    | Output Circuit Short to Ground | `binary_sensor`  | Backup wiring fault indicator |

### Door Control Module

| PID (Hex) | Description                          | Type             | Home Assistant Use |
|-----------|--------------------------------------|------------------|---------------------|
| 221A01    | Driver Window Position (%)           | `sensor` (0–100) | Automate vent/window opening logic |
| 221A02    | Passenger Window Position (%)        | `sensor` (0–100) | Monitor auto-up/down status |
| 221A03    | Mirror Folded Status (Driver)        | `binary_sensor`  | Detect if mirror is stowed; prevent damage |
| 221A04    | Mirror Folded Status (Passenger)     | `binary_sensor`  | As above for passenger side |
| 221A05    | Window One-Touch Down Enabled        | `binary_sensor`  | Indicate auto-down feature is active |
| 221A06    | Window One-Touch Up Enabled          | `binary_sensor`  | Similar for auto-up |
| 221A07    | Door Lock Status (Driver)           | `binary_sensor`  | Smart locking/unlocking via scenes |
| 221A08    | Door Lock Status (Passenger)        | `binary_sensor`  | Sync passenger door lock status |
| 221A09    | Child Lock Active (Rear)            | `binary_sensor`  | Avoid rolling windows with kids onboard |
| 221A0A    | Mirror Adjust Left/Right Input      | `sensor` (enum)  | Log driver mirror adjustments |
| 221A0B    | Mirror Adjust Up/Down Input         | `sensor` (enum)  | As above |
| 221A0C    | Puddle Lamp Active (Driver)         | `binary_sensor`  | Activate ground lights on approach |
| 221A0D    | Puddle Lamp Active (Passenger)      | `binary_sensor`  | Same on passenger side |
| 221A0E    | Mirror Heating Status (Driver)      | `binary_sensor`  | Integrate with defrost logic |
| 221A0F    | Mirror Heating Status (Passenger)   | `binary_sensor`  | As above |
| 221A10    | Window Jam Detect (Driver)          | `binary_sensor`  | Safety shut-off / alert |
| 221A11    | Window Jam Detect (Passenger)       | `binary_sensor`  | As above |
| 221A12    | Window Auto-Reverse Active          | `binary_sensor`  | Detect pinch-reversal |
| 221A13    | Door Open Status (LF/RF)           | `binary_sensor`  | Sync with lighting or alert logic |

### Smart Junction Box

| PID (Hex) | Description            | Type            | Notes / Use |
|-----------|------------------------|-----------------|--------------|
| 22024A    | Aux Switch 1 State     | `binary_sensor` | ON = circuit energized |
| 22024B    | Aux Switch 2 State     | `binary_sensor` | As above |
| 22024C    | Aux Switch 3 State     | `binary_sensor` | As above |
| 22024D    | Aux Switch 4 State     | `binary_sensor` | As above |


### Telematrics Control Unit

| PID (Hex) | Description                         | Type             | Home Assistant Use                                |
|-----------|-------------------------------------|------------------|---------------------------------------------------|
| 7540101   | TCU Authorization State             | `sensor` (enum)  | Track FordPass / modem activation status          |
| 7540102   | TCU Firmware Version                | `sensor` (string)| Diagnostic or update automation                   |
| 7540103   | Vehicle Location GPS Status         | `binary_sensor`  | Trigger GPS-based logic or alerts                 |
| 7540104   | Cellular Signal Strength            | `sensor` (dBm)   | Alert on low signal / connectivity loss           |
| 7540105   | Network Provider Name               | `sensor` (string)| Show active cellular carrier                      |
| 7540106   | SIM Card Status                     | `binary_sensor`  | Determine whether modem is online                 |
| 7540107   | Remote Start Commanded              | `binary_sensor`  | Trigger vehicle climate automations               |
| 7540108   | TCU Connection Active               | `binary_sensor`  | Detect if vehicle is online for remote control    |
| 7540109   | Emergency Call Enabled              | `binary_sensor`  | Surface emergency system readiness                |
| 754010A   | Over-the-Air Update Status          | `sensor` (enum)  | Notify if an update is downloading or pending     |
| 754010B   | Vehicle Wake via Remote             | `binary_sensor`  | Trigger “wake-up” automations (lighting, heating) |
| 754010C   | Privacy Mode Status                 | `binary_sensor`  | Display if vehicle location sharing is blocked    |
| 754010D   | Last Known Vehicle Location (Lat)   | `sensor` (float) | Surface location info (if exposed)                |
| 754010E   | Last Known Vehicle Location (Long)  | `sensor` (float) | Same for longitude                                |


# Future Ideas

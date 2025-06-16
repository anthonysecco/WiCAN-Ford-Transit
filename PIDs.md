> 🚧 This document is under development and is constantly changing.  I do not guarantee the accuracy of the information below.

# PID List

OBD-II PIDs (Parameter IDs) are standardized codes used to request data from a vehicle’s electronic control units (ECUs) via the On-Board Diagnostics (OBD) port. They’re used by diagnostic tools, scan gauges, and systems like Home Assistant (via CAN integration) to read real-time sensor data.

_Almost_ all PID data is provided in metric.  The expressions below maintain metric measurements of all PIDs.  They may be converted to your unit of preference in your application.  In the case of home assistant, I convert these units to US Imperial in the MQTT YAML configuration.

### Modes

There's two "Modes" of interest:

- **Mode 1** shows "standard" PIDs as specified by SAE.  This includes common things like speed, RPM etc.

- **Mode 22** shows manufacture specific data.  This is where we can get some detailed information about the vehicle.  Manufactures usually standardize around set of code across vehicles.  This means we can take things found on the F-150 or Explorer and apply it to the Transit given simialries in powertrain and modules.

### CAN Bus

The Ford Transit (especially 2020 and newer models) typically includes three main CAN buses, each serving different types of modules based on speed and priority. These buses are part of the vehicle’s network architecture that allows electronic modules to communicate.

## Modules

| Bus       | Abbreviation | CAN ID (Hex) | Module Name                  |
|-----------|--------------|--------------|------------------------------|
| HS-CAN1   | PCM          | 0x7E0          | Powertrain Control Module    |
| HS-CAN1   | AWDM         | 0x703          | All-Wheel Drive Module       |
| HS-CAN1   | BCM          | 0x726          | Body Control Module          |

Each module will be broken out by the following:
- PID = Hex Value of Parameter ID
- Name = Short name
- Description = Human understand description
- Units = metric unit for PID
- Expression = Translate value to decimal form
- Status = Status as it relates to WiCAN in this project.

### SAE Standard (OBD)
Full definition of J1979 standard [here](https://en.wikipedia.org/wiki/OBD-II_PIDs).

> ℹ️ Not all of SAE PIDs are accessible or functional in WiCAN.

| **PID** | **Name**      | **Description**                                 | **Units** | **Status** |
| ---- | ---------------- | ----------------------------------------------- | ----- | ------ |
| 0x04 | LOAD             | Calculated Engine Load                          | %     | ✅     |
| 0x0B | MAP              | Manifold Absolute Pressure                      | kPa   | ✅     |
| 0x0C | EngineRPM        | Engine RPM                                      | rpm   | ✅     |
| 0x0D | VSS              | Vehicle Speed Sensor                            | km/h  | ✅     |
| 0x11 | TP               | Throttle Position                               | %     | ✅     |
| 0x2F | FL               | Fuel Level                                      | %     | ✅     |
| 0x34 | OxySensor1\_FAER | Oxygen Sensor Bank 1 Fuel-Air Equivalence Ratio | Ratio | ✅     |
| 0x38 | OxySensor5\_FAER | Oxygen Sensor Bank 2 Fuel-Air Equivalence Ratio | Ratio | ✅     |
| 0x44 | FuelAirCmdEquiv  | Commanded Equivalence Ratio                     | Ratio | ✅     |
| 0x46 | AMB\_TEMP        | Ambient Air Temperature                         | °C    | ✅     |
| 0x62 | ActualEngTorqPct | Actual Engine Torque Percent                    | %     | ✅     |
| 0x63 | EngRefTorq       | Engine Reference Torque                         | Nm    | ✅     |
| 0xA6 | Odometer         | Odometer                                        | km    | ✅     |

### Powertrain Control Module (PCM)

> Module initalization: ATSH7E0

| **PID**  | **Name**               | **Description**                               | **Units** | **Expression**     | **Status** |
| -------- | ---------------------- | --------------------------------------------- | --------- | ------------------ | ---------- |
| 0x22F405 | ECT                    | Engine coolant temperature                    | °C        | B4-40              |            |
| 0x22F40F | IAT                    | Intake Air Temperature                        | °C        | B4-40              |            |
| 0x2203CA | IAT2                   | Intake Air Temperature 2                      | °C        | B4-40              |            |
| 0x22057D | AAT                    | Ambient Air Temperature                       | °C        | B4-40              |            |
| 0x220334 | CHT                    | Cylinder Head Temperature                     | °C        | B4-40              |            |
| 0x221E1C | TFT                    | Transmission Fluid Temperature                | °C        | \[B4\:B5]/16     | ✅          |
| 0x220651 | PWNTRN_DRVMODE         | Drive Mode                                    | enum      | B4                 |            |
| 0x221E12 | GEAR\_GGDS\_MZ         | Gear commanded by module                      | enum      | B4                 | ✅          |
| 0x22099B | AC\_SW\_MZ             | A/C Compressor (ON/OFF)                       | binary    | B4                 |            |
| 0x222B00 | BOO                    | Brake (ON/OFF)                                | binary    | B4                 |            |
| 0x220462 | WGC\_MZ                | Wastegate Control Solenoid Valve              | %         | B4\*100/128        | ✅          |
| 0x22054B | OIL\_LIFE              | Oil Life                                      | %         | B4                 | ✅          |
| 0x220598 | GENCMD                 | Alternator Duty Cycle                         | %         | B4                 |            |
| 0x2203E8 | LRND\_OCT\_RAT         | Learned Octane Ratio                          | %         | \[B4\:B5]/16384  |            |
| 0x220307 | FP                     | Fuel pump duty cycle                          | %         | B4\*100/255        |            |
| 0x22F49D | FUEL\_RATE             | Fuel Rate                                     | g/s       | \[B4\:B5]\*2/100 |            |
| 0x22F403 | FUEL\_SYS              | Fuel System Status (Open/Closed Loop)         | binary    | B4                 |            |
| 0x2203DC | FUEL\_P\_DSD\_MZ       | Fuel Pressure Desired                         | kPa       | \[B4\:B5]        |            |
| 0x22F423 | FUEL\_PRES\_MZ         | Fuel Pressure Sensor                          | kPa       | \[B4\:B5]        |            |

Extra details below.

#### Drive Mode
Selectable modes on the dashboard.  Adjusts programing of PCM, AWDM, and ABS for different driving modes.  This will report current mode.
- 00 → Normal
- 06 → Eco
- 05 → Slippery
- 08 → Mud & Ruts
- 03 → Tow / Haul

#### Gear Commanded
- Park
- Reverse
- Neutral
- Drive (1 to 10)

#### A/C Compressor Switch
Indicates of A/C compressor clutch is being called to engage.
- 01 → ON
- 00 → OFF

#### Brake On/Off
Indicates if brakes are being applied
- 06 → ON Pedal Pressed
- 00 → OFF

#### Wastegate Solenoid
Indicates duty cycle % sent to wastegate to **OPEN** and release excess boost pressure.

#### Oil Life %
0-100%, same as shown on the instrument panel.

#### Alternator Duty Cycle
Represents the PCM’s PWM‐duty command to the alternator’s internal regulator, not a direct measure of alternator load. The PCM continuously reads system voltage (via its voltage PIDs) and, when voltage sags under electrical demand (lights, HVAC, winch, etc.), ramps up the duty cycle to boost field current and raise alternator output; when voltage is high and load light, it dials the duty back down to prevent overcharging.

Low percentages (10–30 %) at cruising indicate minimal charge maintenance, while high percentages (50–100 %) under heavy electrical load or low RPM signal the PCM driving the alternator hard. Because GENCMD is a control signal rather than a sensor of current or torque, you’ll want to pair it with the Mode 22 Battery Current PID (0x2142) and system‐voltage PIDs to see the actual amps flowing and get a true picture of charging‐system load.

#### Learned Octane Ratio 
The Learned Octane Ratio (LOR) is a closed-loop **multiplier** the PCM uses to dynamically adjust its load and spark-advance tables based on fuel knock feedback. As the engine runs, the PCM incrementally “learns” the octane quality by nudging spark timing forward (seeking maximum efficiency) and watching for knock. If no knock occurs, it continues advancing toward its high-octane target; if knock is detected, it retreats toward a conservative, lower-octane calibration. This system lets the EcoBoost engine safely exploit whatever octane you’ve filled it with, optimizing power and efficiency without manual tuning.

Learned Octane Ratio is a relative tuning factor, not an absolute octane meter. Ford calibrates LOR so that zero corresponds to the engine’s nominal (recommended) fuel rating.  For the Transit, that's 87 AKI. When you run on 87-octane, LOR will hover around 0.0, meaning the PCM is using its baseline spark‐advance tables.

- LOR ≈ 0.0 → you’re at the recommended 87 AKI
- LOR < 0.0 → fuel is “better” (higher octane) than 87 → PCM advances spark
- LOR > 0.0 → fuel is “weaker” (lower octane) than 87 → PCM retards spark

#### Fuel pump duty cycle 
The PCM’s PWM command to the low-pressure (lift) fuel pump in the tank. Rather than simply switching the pump fully on or off, the PCM modulates the pump’s duty between 0–100 % to precisely control the flow and maintain the target feed pressure for the high-pressure direct-injection system. This can be useful for how how hard the fuel pump is working drawing fuel from the tank.

#### Fuel Rate  
#### Fuel System Status
**Open Loop** - Fuel Ratio determined based on static table.  Used on cold start and wide-open throttle situations
**Closed Loop** - Fuel ratio is determined using measurements from narrowband oxygen sensors to maintain stochmetic fuel ratio of 14.67:1

#### Fuel Pressure Desired
PCM Desired fuel pressure based on calculated engine load.

#### Fuel Pressure Sensor
Actual fuel pressure measured.  Difference between pressure sensor and desired pressure determines pump duty cycle.

#### Other PIDs of Interest
These may be developed in the future.

- Ford FAN1
- Ford FAN2
- Ford FAN3
- Bank 1/2 Desired Cat Temp
- Bank 1/2 Actual Cat temp

####🚫 Unavailable Data
- Engine oil temperature (No valid PID available)

### All-Wheel Drive Module (AWDM)

On the 2021 Transit AWD has a RWD-biased system that can divert up to 50% of the torque to the front wheels by activating a electronic-hydraulic clutch pack.  This is called a Front Axle Disconnect (FAD) system.  

In its mechanically default position, the front drive shaft is disconnected.  When the AWDM activates the electronic-hydraulic clutch pack, it connects the front drive shaft.  Up to 50% of engine torque can be diverted to the front wheels if the clutch is fully engaged.

While in technical terrain, it may be useful to display the torque split between front/rear wheels. I've consolidated the available sensors to the following relevant sensors:

> Module initalization: ATSH000703;STCAFCP703,70B

| PID      | Name                | Description                            | Unit | Expression  | Status |
| -------- | ------------------- | -------------------------------------- | ---- | ----------- | ------ |
| 0x220722 | FAD\_ACT\_STATUS    | Front Axle Disconnect Actuator Status  | enum | B4          | 🚧     |
| 0x220728 | FAD\_STRG\_CMD      | Front-Axle Disconnect Strategy Command | enum | B4          | 🚧     |
| 0x220726 | FAD\_DISCON\_IN\_DC | Front Axle Disconnect Input Duty Cycle | %    | B4\*100/255 | 🚧     |
| 0x220725 | TC\_MTR\_OUT\_DC    | Torque Converter Clutch Duty-Cycle     | %    | B4\*100/255 | 🚧     |

#### Front-Axle Disconnect Actuator Status  
Shows the real-time state of the Front-Axle Disconnect actuator.  
- **1 = “FAD in 4WD – CONNECTED”** means the front driveshaft is actively engaged, supplying torque to the front & rear wheels.  
- **0 = “FAD in 2WD – DISCONNECTED”** would indicate the front axle is released and supplying torque to only rear-wheel drive only.

> All states above have yet to be confirmed.

#### Front-Axle Disconnect Strategy Command  
The high-level strategy request from the PCM governing AWD mode.  
- **01 = Connect Request** signals “go AWD”—the system wants front-axle engagement.  
- **00 = Disconnect Request** signals “back to RWD”—the system wants the front axle released.  
- **Modulate** (if supported) requests smooth, partial engagement to meter torque split.

> All states above have yet to be confirmed.

#### Front Axle Disconnect Input Duty Cycle  
The PWM duty-cycle (0–100 %) applied to the disconnect control valve.  
- **0 %** means no disengage signal (clutch remains engaged).
- Higher values ramp open the clutch pack proportionally, allowing controlled slip or full disconnect.
- **100 %** means full disengage signal (clutch disengaged) 

> Engage/disengage spectrum yet to be confirmed

#### Torque Converter Clutch Duty-Cycle  
The PWM duty-cycle (0–100 %) applied to the torque-converter clutch solenoid to control lock-up pressure.  
- **Low duty-cycle** = minimal lock-up (more fluid coupling >> more slip, more heat, ).  
- **High duty-cycle** = stronger lock-up (more mechanical coupling >> more efficiency, less heat).

> Engage/disengage spectrum yet to be confirmed

####🚫 Unavailable Data
- FAD Clutch Temperature😭

## Body Control Module (BCM)
The Body Control Module (BCM) is the central controller for all non-powertrain electrical functions—monitoring and managing door-ajar, hood and luggage-lid switches; key-in/ignition and PATS security; lighting (headlamps, turn signals, courtesy lights); horn and crash detection; tire-pressure monitoring; and battery state (voltage, current, temperature, age and cumulative charge/discharge).

> Module initalization: ATSH000726;STCAFCP726,72E

### Doors

| PID      | Name                | Description              | Units | Expression     | Status |
| -------- | ------------------- | ------------------------ | ----- | -------------- | ------ |
| 0x225B1D | DOOR\_SW\_DRVR\_BCM | Driver’s Door Ajar       | —     | ((A >> 0) & 1) | 🚧     |
| 0x225B1D | DOOR\_SW\_PSGR\_BCM | Passenger Door Ajar      | —     | ((A >> 1) & 1) | 🚧     |
| 0x225B1D | DOOR\_SW\_LR\_BCM   | Left Rear Door Ajar      | —     | ((A >> 3) & 1) | 🚧     |
| 0x225B1D | DOOR\_SW\_RR\_BCM   | Right Rear Door Ajar     | —     | ((A >> 4) & 1) | 🚧     |
| 0x225B1D | DOOR\_SW\_LUGG\_BCM | Luggage Compartment Ajar | —     | ((A >> 5) & 1) | 🚧     |
| 0x225B1D | HOOD\_SW\_BCM       | Hood Ajar                | —     | ((A >> 2) & 1) | 🚧     |

> 🚧 Door states are show by bit, not byte.  Some work needed to track individual bits yet. Naming convention needs to be mapped to actual doors.

### Tire Pressure

| PID      | Name                | Description                    | Units | Expression   | Status |
| -------- | ------------------- | ------------------------------ | ----- | ------------ | ------ |
| 0x222827 | PLCRD\_TP\_FRT\_BCM | Front Tire Placard Pressure    | kPa   | \[B4\:B5]/10 | 🚧     |
| 0x222813 | TPM\_PRES\_LF\_BCM  | Left Front Tire Pressure       | kPa   | \[B4\:B5]/10 | 🚧     |
| 0x222814 | TPM\_PRES\_RF\_BCM  | Right Front Tire Pressure      | kPa   | \[B4\:B5]/10 | 🚧     |
| 0x222828 | PLCRD\_TP\_BCK\_BCM | Rear Tire Placard Pressure     | kPa   | \[B4\:B5]/10 | 🚧     |
| 0x222816 | TPM\_PRES\_LRO\_BCM | Left Rear Outer Tire Pressure  | kPa   | \[B4\:B5]/10 | 🚧     |
| 0x222815 | TPM\_PRES\_RRO\_BCM | Right Rear Outer Tire Pressure | kPa   | \[B4\:B5]/10 | 🚧     |
| 0x222818 | TPM\_PRES\_LRI\_BCM | Left Rear Inner Tire Pressure  | kPa   | \[B4\:B5]/10 | 🚧     |
| 0x222817 | TPM\_PRES\_RRI\_BCM | Right Rear Inner Tire Pressure | kPa   | \[B4\:B5]/10 | 🚧     |

### Battery

| PID      | Name         | Description                       | Units | Expression | Status |
| -------- | ------------ | --------------------------------- | ----- | ---------- | ------ |
| 0x224028 | BAT\_SOC     | Vehicle Battery – State of Charge | %     | B4         | 🚧     |
| 0x22402B | BAT\_CURRENT | Vehicle Battery – Current         | A     | \[B4\:B5]  | 🚧     |
| 0x22402A | BAT\_VOLTAGE | Vehicle Battery – Voltage         | V     | \[B4\:B5]  | 🚧     |

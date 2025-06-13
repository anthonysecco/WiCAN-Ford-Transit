> 🚧 This document is under development and is constantly changing.  I do not guarantee the accuracy of the information below.

# Parameter IDs

OBD-II PIDs (Parameter IDs) are standardized codes used to request data from a vehicle’s electronic control units (ECUs) via the On-Board Diagnostics (OBD) port. They’re used by diagnostic tools, scan gauges, and systems like Home Assistant (via CAN integration) to read real-time sensor data.

There's two "Modes" of interest

### Modes

**Mode 1** shows "standard" PIDs as specified by SAE.  This includes common things like speed, RPM etc.

**Mode 22** shows manufacture specific data.  This is where we can get some detailed information about the vehicle.  Manufactures usually standardize around set of code across vehicles.  This means we can take things found on the F-150 or Explorer and apply it to the Transit given simialries in powertrain and modules.

### CAN Bus

The Ford Transit (especially 2020 and newer models) typically includes three main CAN buses, each serving different types of modules based on speed and priority. These buses are part of the vehicle’s network architecture that allows electronic modules to communicate.

## Modules

| Bus       | Abbreviation | CAN ID (Hex) | Module Name                  |
|-----------|--------------|--------------|------------------------------|
| HS-CAN1   | PCM          | 0x7E0          | Powertrain Control Module    |
| HS-CAN1   | AWDM         | 0x703          | All-Wheel Drive Module       |
| HS-CAN1   | BCM          | 0x726          | Body Control Module          |

### SAE Standard (OBD)

| PID  | PID Label        | Description                                     | Units | Status |
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

Full definition of J1979 standard [here](https://en.wikipedia.org/wiki/OBD-II_PIDs).

> ℹ️ Not all of SAE PIDs are accessible or functional in WiCAN.

### Powertrain Control Module (PCM)

| **PID**  | **Name**               | **Description**                               | **Units** | **Expression**     | **Status** |
| -------- | ---------------------- | --------------------------------------------- | --------- | ------------------ | ---------- |
| —        | ECT                    | Engine coolant temperature                    | °C        | B4-40              |            |
| 0x221E1C | TFT                    | Transmission Fluid Temperature                | °C        | ((\[B4\:B5])/10)   | ✅          |
| —        | IAT\_T                 | Intake Air Temperature                        | °C        | B4-40              |            |
| —        | IAT2\_TEMP\_MZ         | Intake Air Temperature 2                      | °C        | B4-40              |            |
| —        | AAT\_TEMP\_MZ          | Ambient Air Temperature                       | °C        | B4-40              |            |
| —        | AAT\_MZ                | Ambient Air Temperature                       | °C        | B4-40              |            |
| —        | BAT\_MZ                | Boost air temperature sensor                  | °C        | B4-40              |            |
| —        | CHT                    | Cylinder Head Temperature                     | °C        | B4-40              |            |
| —        | CATT21\_DSD            | Desired Catalyst Temperature Bank 2, Sensor 1 | °C        | ((\[B4\:B5])/10)   |            |
| —        | EXHTEMP2\_MZ           | Exhaust Gas Temperature Sensor (Middle)       | °C        | ((\[B4\:B5])/10)   |            |
| —        | CATT11\_DSD            | Desired Catalyst Temperature Bank 1, Sensor 1 | °C        | ((\[B4\:B5])/10)   |            |
| —        | EXHTEMP1\_MZ           | Exhaust Gas Temperature Sensor (Upper)        | °C        | ((\[B4\:B5])/10)   |            |
| —        | GEAR\_ENG\_PCM\_MZ     | Transmission Gear Engaged                     | —         | B4                 |            |
| 0x221E12 | GEAR\_GGDS\_MZ         | Gear commanded by module                      | enum      | B4                 | ✅          |
| —        | INGEAR                 | In gear                                       | —         | B4                 |            |
| —        | FLI                    | Fuel Level                                    | %         | B4\*100/255        |            |
| —        | IG\_SW\_MZ             | Ignition switch status                        | —         | B4                 |            |
| —        | AC\_SW\_MZ             | Air conditioning switch                       | —         | B4                 |            |
| —        | BOO                    | Brake ON/OFF                                  | —         | B4                 |            |
| 0x220462 | WGC\_MZ                | Wastegate Control Solenoid Valve              | %         | B4\*100/128        | ✅          |
| —        | MAP                    | Manifold absolute pressure sensor             | kPa       | (\[B4\:B5])/100    |            |
| —        | FUEL\_SYS              | Fuel System Status (Open/Closed Loop)         | —         | B4                 |            |
| —        | FP                     | Fuel pump duty cycle                          | %         | B4\*100/255        |            |
| —        | FUEL\_P\_DSD\_MZ       | Fuel Pressure Desired                         | kPa       | (\[B4\:B5])        |            |
| —        | FUEL\_PRES\_MZ         | Fuel Pressure Sensor                          | kPa       | (\[B4\:B5])        |            |
| 0x22054B | OIL\_LIFE              | Oil Life                                      | %         | B4                 | ✅          |
| 0x22F49D | FUEL\_RATE             | Fuel Rate                                     | g/s       | (\[B4\:B5])\*2/100 |            |
| 0x2203E8 | LEARNED\_OCTANE\_RATIO | Learned Octane Ratio                          | %         | (\[B4\:B5])/16384  |            |
> Module initalization: ATSH0007E0;STCAFCP7E0,7E8
####🚫 Unavailable Data
- Engine oil temperature (No valid PID available)

### All-Wheel Drive Module (AWDM)

On the 2021 Transit AWD has a RWD-biased system that can divert up to 50% of the torque to the front wheels by activating a electronic-hydraulic clutch pack.  This is called a Front Axle Disconnect (FAD) system.  

In its mechanically default position, the front drive shaft is disconnected.  When the AWDM activates the electronic-hydraulic clutch pack, it connects the front drive shaft.  Up to 50% of engine torque can be diverted to the front wheels if the clutch is fully engaged.

| **Wheels** | **Total Torque** |
| ------------------- | ------- |
| Front Wheels | 0-50% |
| Rear Wheels | 0-100% |

While in technical terrain, it may be useful to display the torque split between front/rear wheels.

I've consolidated the available sensors to the following as most relevant:

| PID Codename        | PID Hex | Description                            | Value                  | Unit | Formula                                                      |
| ------------------- | ------- | -------------------------------------- | ---------------------- | ---- | ------------------------------------------------------------ |
| FAD\_ACT\_STATUS    | 0x220722 | Front Axle Disconnect Actuator Status  | FAD in 4WD - CONNECTED | enum | B4 (Enum: 0=Disconnected, 1=Connected, 2=Transition, 3=Error) |
| FAD\_STRG\_CMD      | 0x220728 | Front-Axle Disconnect Strategy Command | Connect Request        | enum | B4 (Enum: 0=Disconnect Request, 1=Connect Request)            |
| FAD\_DISCON\_IN\_DC | 0x220726 | Front Axle Disconnect Input Duty Cycle | 0                      | %    | B4 \* 100 / 255                                               |
| TC\_MTR\_OUT\_DC    | 0x220725 | Torque Converter Clutch Duty-Cycle     | 5                      | %    | B4 \* 100 / 255                                               |
> Module initalization: ATSH000703;STCAFCP703,70B

#### Front-Axle Disconnect Actuator Status  
Shows the real-time state of the Front-Axle Disconnect actuator.  
- **“FAD in 4WD – CONNECTED”** means the front driveshaft is actively engaged, supplying torque to the front & rear wheels.  
- **“FAD in 2WD – DISCONNECTED”** would indicate the front axle is released and supplying torque to only rear-wheel drive only.

> All states above have yet to be confirmed.

#### Front-Axle Disconnect Strategy Command  
The high-level strategy request from the PCM governing AWD mode.  
- **Connect Request** signals “go AWD”—the system wants front-axle engagement.  
- **Disconnect Request** signals “back to RWD”—the system wants the front axle released.  
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

### Doors

> 🚧 Formulas under construction

| PID      | Name                | Description              | Units | Expression     |
| -------- | ------------------- | ------------------------ | ----- | -------------- |
| 0x225B1D | DOOR\_SW\_DRVR\_BCM | Driver’s Door Ajar       | —     | ((A >> 0) & 1) |
| 0x225B1D | DOOR\_SW\_PSGR\_BCM | Passenger Door Ajar      | —     | ((A >> 1) & 1) |
| 0x225B1D | DOOR\_SW\_LR\_BCM   | Left Rear Door Ajar      | —     | ((A >> 3) & 1) |
| 0x225B1D | DOOR\_SW\_RR\_BCM   | Right Rear Door Ajar     | —     | ((A >> 4) & 1) |
| 0x225B1D | DOOR\_SW\_LUGG\_BCM | Luggage Compartment Ajar | —     | ((A >> 5) & 1) |
| 0x225B1D | HOOD\_SW\_BCM       | Hood Ajar                | —     | ((A >> 2) & 1) |

### Tire Pressure

| PID      | Name                | Description                    | Units | Expression                          |
| -------- | ------------------- | ------------------------------ | ----- | ----------------------------------- |
| —        | PLCRD\_TP\_FRT\_BCM | Front Tire Placard Pressure    | psi   | ([B4:B5] / 10) × 0.145038 |
| 0x222813 | TPM\_PRES\_LF\_BCM  | Left Front Tire Pressure       | psi   | ([B4:B5] / 10) × 0.145038 |
| 0x222814 | TPM\_PRES\_RF\_BCM  | Right Front Tire Pressure      | psi   | ([B4:B5] / 10) × 0.145038 |
| —        | PLCRD\_TP\_BCK\_BCM | Rear Tire Placard Pressure     | psi   | ([B4:B5] / 10) × 0.145038 |
| 0x222816 | TPM\_PRES\_LRO\_BCM | Left Rear Outer Tire Pressure  | psi   | ([B4:B5] / 10) × 0.145038 |
| 0x222815 | TPM\_PRES\_RRO\_BCM | Right Rear Outer Tire Pressure | psi   | ([B4:B5] / 10) × 0.145038 |
| 0x222818 | TPM\_PRES\_LRI\_BCM | Left Rear Inner Tire Pressure  | psi   | ([B4:B5]) / 10) × 0.145038 |
| 0x222817 | TPM\_PRES\_RRI\_BCM | Right Rear Inner Tire Pressure | psi   | ([B4:B5]} / 10) × 0.145038 |

### Battery

| PID      | Name                  | Description                       | Units | Expression                        |
| -------- | --------------------- | --------------------------------- | ----- | ------------ |
| 0x224028 | BAT\_ST\_CHRG\_BCM    | Vehicle Battery – State of Charge | %     | B4            |
| 0x22402B | BAT\_CURRENT\_BCM     | Vehicle Battery – Current         | A     | ([B4:B5]) |
| 0x22402A | BATTERY\_VOLTAGE\_BCM | Vehicle Battery – Voltage         | V     | ([B4:B5])      |

### Accessories

| PID | Name          | Description          | Units       | Expression       |
| --- | ------------- | -------------------- | ----------- | ---------------- |
| —   | DOOR\_DRV     | Driver Door Ajar     | Closed/Open | (Byte2 >> 0) & 1 |
| —   | DOOR\_PASS    | Passenger Door Ajar  | Closed/Open | (Byte2 >> 1) & 1 |
| —   | DOOR\_SLIDING | Sliding Door Ajar    | Closed/Open | (Byte2 >> 2) & 1 |
| —   | DOOR\_REAR    | Rear Cargo Door Ajar | Closed/Open | (Byte2 >> 3) & 1 |
| —   | HOOD\_AJAR    | Hood Ajar            | Closed/Open | (Byte2 >> 4) & 1 |

> Module initalization: ATSH000726;STCAFCP726,72E

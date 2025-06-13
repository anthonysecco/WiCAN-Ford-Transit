> This repo is under development and is constantly changing.  I do not guarantee the accuracy of the information below.

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
| HS-CAN1   | PCM          | 7E0          | Powertrain Control Module    |
| HS-CAN1   | AWDM         | TBD          | All-Wheel Drive Module  |
| HS-CAN1   | BCM        | TBD          | Body Control Module  |

### Powertrain Control Module (PCM)

| PID Label          | PID | Description                                   | Example Value | Units | Formula                    |
| ------------------ | --- | --------------------------------------------- | ------------- | ----- | -------------------------- |
| ECT                |     | Engine coolant temperature                    | 181.4         | °F    | (A-40)\*9/5+32             |
| TFT                |     | Transmission Fluid Temperature                | 137.42        | °F    | (A-40)\*9/5+32             |
| IAT\_T             |     | Intake Air Temperature                        | 73.4          | °F    | (A-40)\*9/5+32             |
| IAT\_T             |     | Intake Air Temperature                        | 82.4          | °F    | (A-40)\*9/5+32             |
| IAT2\_TEMP\_MZ     |     | Intake Air Temperature 2                      | 93.2          | °F    | (A-40)\*9/5+32             |
| AAT\_TEMP\_MZ      |     | Ambient Air Temperature                       | 73.4          | °F    | (A-40)\*9/5+32             |
| AAT\_MZ            |     | Ambient Air Temperature                       | 73.4          | °F    | (A-40)\*9/5+32             |
| BAT\_MZ            |     | Boost air temperature sensor                  | 93.2          | °F    | (A-40)\*9/5+32             |
| BAT\_MZ            |     | Boost air temperature sensor                  | 82.4          | °F    | (A-40)\*9/5+32             |
| CHT                |     | Cylinder Head Temperature                     | 201.29        | °F    | (A-40)\*9/5+32             |
| CATT21\_DSD        |     | Desired Catalyst Temperature Bank 2, Sensor 1 | 808.34        | °F    | ((A\*256+B)/10)\*9/5+32    |
| EXHTEMP2\_MZ       |     | Exhaust Gas Temperature Sensor (Middle)       | 808.34        | °F    | ((A\*256+B)/10)\*9/5+32    |
| CATT11\_DSD        |     | Desired Catalyst Temperature Bank 1, Sensor 1 | 808.34        | °F    | ((A\*256+B)/10)\*9/5+32    |
| EXHTEMP1\_MZ       |     | Exhaust Gas Temperature Sensor (Upper)        | 808.34        | °F    | ((A\*256+B)/10)\*9/5+32    |
| GEAR\_ENG\_PCM\_MZ |     | Transmission Gear Engaged                     | Park          |       | A                          |
| GEAR\_GGDS\_MZ     |     | Gear commanded by module                      | P             |       | A                          |
| INGEAR             |     | In gear                                       | Off           |       | A (0=Off, 1=On)            |
| FLI                |     | Fuel Level                                    | 75.78         | %     | A\*100/255                 |
| IG\_SW\_MZ         |     | Ignition switch status                        | On            |       | A                          |
| AC\_SW\_MZ         |     | Air conditioning switch                       | On            |       | A                          |
| BOO                |     | Brake ON/OFF                                  | Off           |       | A                          |
| WGC\_MZ            |     | Wastegate Control Solenoid Valve              | 0             | %     | A\*100/255                 |
| BARO\_MZ           |     | Barometric pressure                           | 29.83         | inHg  | (A*256+B)/10*0.02953       |
| MAP                |     | Manifold absolute pressure sensor             | 11.81         | inHg  | (A*256+B)/10*0.02953       |
| FUEL\_SYS          |     | Fuel System Status (Open/Closed Loop)         | CL            |       | A                          |
| FP                 |     | Fuel pump                                     | 30.3          | %     | A\*100/255                 |
| FUEL\_P\_DSD\_MZ   |     | Fuel Pressure Desired                         | 738.25        | inHg  | (A\*256+B)\*0.145038       |
| FRP\_DSD\_MZ       |     | Fuel Rail Pressure Desired                    | 738.25        | inHg  | (A\*256+B)\*0.145038       |
| FUEL\_PRES\_MZ     |     | Fuel Pressure Sensor                          | 741.21        | inHg  | (A\*256+B)\*0.145038       |
| FRP\_DCM           |     | Fuel Rail Pressure                            | 741.21        | inHg  | (A\*256+B)\*0.145038       |
| EQ\_RAT\_DSD       |     | Desired Equivalence Ratio (Lambda)            | 0.9832285     |       | (A\*256+B)/32768           |
| EQ\_RAT11          |     | Equivalence Ratio (Lambda) (Bank 1, Sensor 1) | 0.9907315     |       | (A\*256+B)/32768           |
| EQ\_RAT21          |     | Equivalence Ratio (Lambda) (Bank 2, Sensor 1) | 1.006317      |       | (A\*256+B)/32768           |



####🚫 Unavailable Data
- Engine oil temperature

### All-Wheel Drive Module (AWDM)

On the 2021 Transit AWD the “FAD” prefix refers to the Front Axle Disconnect system (sometimes also called the Front‐Axle Drive clutch). It’s the electro-hydraulic clutch pack that connects or disconnects the front driveshaft when called by the AWDM.

I've consolidated the available sensors to the following as most relevant:

| PID Codename        | PID Hex | Description                            | Value                  | Unit | Formula                                                      |
| ------------------- | ------- | -------------------------------------- | ---------------------- | ---- | ------------------------------------------------------------ |
| FAD\_ACT\_STATUS    |   | Front Axle Disconnect Actuator Status  | FAD in 4WD - CONNECTED |      | A (Enum: 0=Disconnected, 1=Connected, 2=Transition, 3=Error) |
| FAD\_STRG\_CMD      |   | Front-Axle Disconnect Strategy Command | Connect Request        |      | A (Enum: 0=Disconnect Request, 1=Connect Request)            |
| FAD\_DISCON\_IN\_DC |   | Front Axle Disconnect Input Duty Cycle | 0                      | %    | A \* 100 / 255                                               |
| TC\_MTR\_OUT\_DC    |   | Torque Converter Clutch Duty-Cycle     | 5                      | %    | A \* 100 / 255                                               |


#### Front-Axle Disconnect Actuator Status  
Shows the real-time state of the Front-Axle Disconnect actuator.  
- **“FAD in 4WD – CONNECTED”** means the front driveshaft is actively engaged, supplying torque to the front wheels.  
- **“FAD in 2WD – DISCONNECTED”** would indicate the front axle is released and you’re in rear-wheel drive only.

#### Front-Axle Disconnect Strategy Command  
The high-level strategy request from the PCM governing AWD mode.  
- **Connect Request** signals “go AWD”—the system wants front-axle engagement.  
- **Disconnect Request** signals “back to RWD”—the system wants the front axle released.  
- **Modulate** (if supported) requests smooth, partial engagement to meter torque split.
> All states are to be confirmed.

#### Front Axle Disconnect Input Duty Cycle  
The PWM duty-cycle (0–100 %) applied to the disconnect control valve.  
- **0 %** means no disengage signal (clutch remains engaged).
- Higher values ramp open the clutch pack proportionally, allowing controlled slip or full disconnect.
- **100 %** means full disengage signal (clutch disengaged) 

#### Torque Converter Clutch Duty-Cycle  
The PWM duty-cycle (0–100 %) applied to the torque-converter clutch solenoid to control lock-up pressure.  
- **Low duty-cycle** = minimal lock-up (more fluid coupling >> more slip, more heat, ).  
- **High duty-cycle** = stronger lock-up (more mechanical coupling >> more efficiency, less heat).

####🚫 Unavailable Data
- FAD Clutch Temperature

## Body Control Module (BCM)

The Body Control Module (BCM) is the central controller for all non-powertrain electrical functions—monitoring and managing door-ajar, hood and luggage-lid switches; key-in/ignition and PATS security; lighting (headlamps, turn signals, courtesy lights); horn and crash detection; tire-pressure monitoring; and battery state (voltage, current, temperature, age and cumulative charge/discharge).

### Doors

| PID                 | PID Hex | Description                         | Value  | Units | Formula              |
| ------------------- | ------- | ----------------------------------- | ------ | ----- | -------------------- |
| DOOR\_SW\_DRVR\_BCM |         | Driver’s Door Ajar Switch Status    | Closed |       | A (0=Closed, 1=Open) |
| DOOR\_SW\_PSGR\_BCM |         | Passenger Door Ajar Switch Status   | Closed |       | A (0=Closed, 1=Open) |
| HOOD\_SW\_BCM       |         | Hood Ajar Switch                    | Closed |       | A (0=Closed, 1=Open) |
| DOOR\_SW\_LR\_BCM   |         | Left Rear Door Ajar Switch          | Closed |       | A (0=Closed, 1=Open) |
| DOOR\_SW\_RR\_BCM   |         | Right Rear Door Ajar Switch         | Closed |       | A (0=Closed, 1=Open) |
| DOOR\_SW\_LUGG\_BCM |         | Luggage Compartment Lid Ajar Switch | Closed |       | A (0=Closed, 1=Open) |

### Tire Pressure

| PID                    | PID Hex | Description                               | Value         | Units | Formula                 |
| ---------------------- | ------- | ----------------------------------------- | ------------- | ----- | ----------------------- |
| TPM\_WRN\_LMP\_BCM     |         | Tire Pressure Monitoring System Indicator | OFF           |       | A (0=Off, 1=On)         |
| TPMS\_STATUS\_BCM      |         | Tire Pressure Monitoring System Status    | System Active |       | A (Enum)                |
| TPM\_MOTION\_STAT\_BCM |         | TPMS Vehicle Motion Status                | Parked        |       | A (Enum)                |
| PLCRD\_TP\_FRT\_BCM    |         | Front Tire Placard Pressure               | 16.83         | psi   | ((A×256+B)/10)×0.145038 |
| TPM\_PRES\_LF\_BCM     |         | Left Front Tire Pressure                  | 17.02         | psi   | ((A×256+B)/10)×0.145038 |
| TPM\_PRES\_RF\_BCM     |         | Right Front Tire Pressure                 | 16.42         | psi   | ((A×256+B)/10)×0.145038 |
| PLCRD\_TP\_BCK\_BCM    |         | Rear Tire Placard Pressure                | 22.18         | psi   | ((A×256+B)/10)×0.145038 |
| TPM\_PRES\_LRO\_BCM    |         | Left Rear Outer Tire Pressure             | 22.75         | psi   | ((A×256+B)/10)×0.145038 |
| TPM\_PRES\_RRO\_BCM    |         | Right Rear Outer Tire Pressure            | 22.07         | psi   | ((A×256+B)/10)×0.145038 |
| TPM\_PRES\_LRI\_BCM    |         | Left Rear Inner Tire Pressure             | 44.28         | psi   | ((A×256+B)/10)×0.145038 |
| TPM\_PRES\_RRI\_BCM    |         | Right Rear Inner Tire Pressure            | 44.28         | psi   | ((A×256+B)/10)×0.145038 |

### Battery
| PID                | PID Hex | Description                       | Value | Units | Formula         |
| ------------------ | ------- | --------------------------------- | ----- | ----- | --------------- |
| BAT\_ST\_CHRG\_BCM |         | Vehicle Battery – State of Charge | 66    | %     | A               |
| BAT\_CURRENT\_BCM  |         | Vehicle Battery – Current         | 14    | A     | ((A\*256+B)/10) |
| BATTERY\_AGE\_BCM  |         | Vehicle Battery – Days in Service | 1373  |       | A               |

### Accessories
| PID                  | PID Hex | Description                           | Value    | Units | Formula                  |
| -------------------- | ------- | ------------------------------------- | -------- | ----- | ------------------------ |
| LOW\_BEAM\_LT\_BCM   |         | Left Headlamp Low Beam                | Inactive |       | A (0=Inactive, 1=Active) |
| LOW\_BEAM\_RT\_BCM   |         | Right Headlamp Low Beam               | Inactive |       | A (0=Inactive, 1=Active) |
| TRN\_SIG\_SW\_L\_BCM |         | Turn Signal Left Switch Input Status  | Off      |       | A (0=Off, 1=On)          |
| TRN\_SIG\_SW\_R\_BCM |         | Turn Signal Right Switch Input Status | Off      |       | A (0=Off, 1=On)          |
| HORN\_SW\_BCM        |         | Horn Switch                           | OFF      |       | A (0=Off, 1=On)          |
| IGN\_SW\_STATE\_BCM  |         | Ignition Switch State                 | Run      |       | A (Enum)                 |



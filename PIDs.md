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

| PID Codename         | Description                                           | Value                        | Units  |
|----------------------|-------------------------------------------------------|------------------------------|--------|
| FAD_ACT_STATUS       | Front Axle Disconnect Actuator Status                 | FAD in 4WD - CONNECTED       |        |
| FAD_STRG_CMD         | Front-Axle Disconnect Strategy Command                | Connect Request              |        |
| FAD_DISCON_IN_DC     | Front Axle Disconnect Input Duty Cycle                | 0                            | %      |
| TC_MTR_OUT_DC        | Torque Converter Clutch Duty-Cycle                    | 5                            | %      |

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

| PID                  | Description                                     | Value         | Units |
|----------------------|-------------------------------------------------|---------------|-------|
| DOOR_SW_DRVR_BCM     | Driver’s Door Ajar Switch Status                | Closed        |       |
| DOOR_SW_PSGR_BCM     | Passenger Door Ajar Switch Status               | Closed        |       |
| HOOD_SW_BCM          | Hood Ajar Switch                                | Closed        |       |
| DOOR_SW_LR_BCM       | Left Rear Door Ajar Switch                      | Closed        |       |
| DOOR_SW_RR_BCM       | Right Rear Door Ajar Switch                     | Closed        |       |
| DOOR_SW_LUGG_BCM     | Luggage Compartment Lid Ajar Switch             | Closed        |       |

### Tire Pressure

| PID                  | Description                                     | Value         | Units |
|----------------------|-------------------------------------------------|---------------|-------|
| TPM_WRN_LMP_BCM      | Tire Pressure Monitoring System Indicator       | OFF           |       |
| TPMS_STATUS_BCM      | Tire Pressure Monitoring System Status          | System Active |       |
| TPM_MOTION_STAT_BCM  | TPMS Vehicle Motion Status                      | Parked        |       |
| PLCRD_TP_FRT_BCM     | Front Tire Placard Pressure                     | 116.06        | inHg  |
| TPM_PRES_LF_BCM      | Left Front Tire Pressure                        | 117.18        | inHg  |
| TPM_PRES_RF_BCM      | Right Front Tire Pressure                       | 113.11        | inHg  |
| PLCRD_TP_BCK_BCM     | Rear Tire Placard Pressure                      | 152.71        | inHg  |
| TPM_PRES_LRO_BCM     | Left Rear Outer Tire Pressure                   | 156.88        | inHg  |
| TPM_PRES_RRO_BCM     | Right Rear Outer Tire Pressure                  | 151.79        | inHg  |
| TPM_PRES_LRI_BCM     | Left Rear Inner Tire Pressure                   | 305.42        | inHg  |
| TPM_PRES_RRI_BCM     | Right Rear Inner Tire Pressure                  | 305.42        | inHg  |

### Battery
| PID                  | Description                                     | Value         | Units |
|----------------------|-------------------------------------------------|---------------|-------|
| BAT_ST_CHRG_BCM      | Vehicle Battery – State of Charge               | 66            | %     |
| BAT_CURRENT_BCM      | Vehicle Battery – Current                       | 14            | A     |
| BATTERY_AGE_BCM      | Vehicle Battery – Days in Service               | 1373          |       |

### Accessories
| PID                  | Description                                     | Value         | Units |
|----------------------|-------------------------------------------------|---------------|-------|
| LOW_BEAM_LT_BCM      | Left Headlamp Low Beam                          | Inactive      |       |
| LOW_BEAM_RT_BCM      | Right Headlamp Low Beam                         | Inactive      |       |
| TRN_SIG_SW_L_BCM     | Turn Signal Left Switch Input Status            | Off           |       |
| TRN_SIG_SW_R_BCM     | Turn Signal Right Switch Input Status           | Off           |       |
| HORN_SW_BCM          | Horn Switch                                     | OFF           |       |
| IGN_SW_STATE_BCM     | Ignition Switch State                           | Run           |       |


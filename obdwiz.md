# OBDwiz PIDs from Ford Transit

This an uneditted dump of all sensors from OBDwiz

## Powertrain Control Module (PCM)

| PID                   | Description                                                       | Value      | Units |
|-----------------------|-------------------------------------------------------------------|------------|-------|
| AC_PRES_V_GGDS        | A/C pressure sensor                                               | 1.18       | V     |
| ACP_SW_MZ             | A/C pressure switch                                               | Off        |       |
| AC_REQ_MZ             | A/C Request Signal                                                | Off        |       |
| ACCS                  | Air conditioning compressor cycling switch                        | Off        |       |
| FAN1                  | FAN1 Control Signal                                               | Off        |       |
| FAN2                  | FAN2 Control Signal                                               | Off        |       |
| FAN3                  | FAN3 Control Signal                                               | Off        |       |
| IASV                  | Intake air shutter valve                                          | Off        |       |
| COLP                  | Refrigerant Pressure Switch (Middle Pressure)                     | Off        |       |
| APP                   | Accelerator Pedal Position                                       | 0          | %     |
| APP1_MZ               | Accelerator pedal position sensor 1                               | 15.69      | %     |
| APP1                  | Accelerator pedal position sensor 1                               | 0.79       | V     |
| APP2                  | Accelerator pedal position sensor 2                               | 0.4        | V     |
| APP2_MZ               | Accelerator pedal position sensor 2                               | 7.84       | %     |
| VT_EX_ACT_MZ          | Actual Exhaust Variable Valve Timing Control – Retard Amount      | 0.31       | deg   |
| VT_IN_ACT_MZ          | Actual Intake Variable Valve Timing Control – Advance Amount      | –0.13      | deg   |
| VT_ACT                | Actual valve timing                                               | –0.13      | deg   |
| VT_ACT2               | Actual Valve Timing 2                                             | –0.25      | deg   |
| AC_SW_MZ              | Air conditioning switch                                           | On         |       |
| AAT_TEMP_MZ           | Ambient Air Temperature                                           | 73.4       | °F    |
| AAT_MZ                | Ambient Air Temperature                                           | 73.4       | °F    |
| IAT_T                 | Intake Air Temperature                                            | 73.4       | °F    |
| BARO                  | Barometric pressure                                               | 3.98       | V     |
| BARO_MZ               | Barometric pressure                                               | 29.83      | inHg  |
| BAT_MZ                | Boost air temperature sensor                                      | 93.2       | °F    |
| BAT_V_MZ              | Boost air temperature sensor                                      | 2.41       | V     |
| BAT_VOLT_MZ           | Boost air temperature sensor                                      | 2.41       | V     |
| IAT2_VOLT_MZ          | Intake Air Temperature 2                                          | 2.41       | V     |
| BAT_MZ                | Boost air temperature sensor                                      | 82.4       | °F    |
| IAT_T                 | Intake Air Temperature                                            | 82.4       | °F    |
| BOO                   | Brake ON/OFF                                                      | Off        |       |
| BPA                   | Brake Pressure Applied switch                                     | Off        |       |
| BOO_6G_MZ             | Brake Switch 1 Input Signal Status: Footbrake Is Applied (High)   | Low        |       |
| BPA_6G_MZ             | Brake Switch 2 Input Signal Status: Footbrake Is Applied (High)   | Low        |       |
| VT_DUTY1              | Camshaft Position Commanded Duty Cycle 1                          | 0          | %     |
| VT_DUTY2              | Camshaft Position Commanded Duty Cycle 2                          | 0          | %     |
| CPP                   | Clutch Pedal Position Switch                                      | Off        |       |
| INGEAR                | In gear                                                           | Off        |       |
| CHT_V                 | Cylinder Head Temperature                                         | 0.51       | V     |
| CHT                   | Cylinder Head Temperature                                         | 201.29     | °F    |
| CATT21_DSD            | Desired Catalyst Temperature Bank 2, Sensor 1                     | 808.34     | °F    |
| EXHTEMP2_MZ           | Exhaust Gas Temperature Sensor (Middle)                           | 808.34     | °F    |
| CATT11_DSD            | Desired Catalyst Temperature Bank 1, Sensor 1                     | 808.34     | °F    |
| EXHTEMP1_MZ           | Exhaust Gas Temperature Sensor (Upper)                            | 808.34     | °F    |
| EQ_RAT_DSD            | Desired Equivalence Ratio (Lambda)                                | 0.9832285  |       |
| VT_DSD                | Desired Intake Camshaft Position                                  | 0          | deg   |
| ARPMDES               | Desired RPM                                                       | 625        | RPM   |
| VT_DIFF               | Difference Between Target and Actual Valve Timing                  | 0.38       | deg   |
| VT_DIFF2              | Difference Between Target and Actual Valve Timing 2                | 0.38       | deg   |
| ETC_ACT               | Electronic Throttle Control Actual                                | 1.48       | deg   |
| ISV_ACT_MZ            | Intake Shutter Valve Control Actual                               | 1.48       | deg   |
| ETC_DSD               | Electronic Throttle Control Desired                               | 1.47       | deg   |
| ISV_DSD_MZ            | Intake Shutter Valve Control Desired                              | 1.47       | deg   |
| ETC_D_MZ              | Electronic Throttle Control Desired                               | 1.57       |       |
| ISV_DSD_PER_MZ        | Intake Shutter Valve Control Desired                              | 1.57       | %     |
| ECT                   | Engine coolant temperature                                        | 181.4      | °F    |
| LOAD_PER              | Engine load                                                       | 33.33      | %     |
| LOAD                  | Engine load                                                       | 18.04      | %     |
| Rpm                   | Engine Revolutions Per Minute                                     | 625        | RPM   |
| EQ_RAT11              | Equivalence Ratio (Lambda) (Bank 1, Sensor 1)                     | 0.9907315  |       |
| O2S11                 | Heated Exhaust Gas Oxygen Sensor (Bank 1, Sensor 1)               | –27.34     | μA    |
| EQ_RAT21              | Equivalence Ratio (Lambda) (Bank 2, Sensor 1)                     | 1.006317   |       |
| O2S21                 | Heated Exhaust Gas Oxygen Sensor (Bank 2, Sensor 1)               | 7.81       | μA    |
| EVAPCP                | Evaporative Emission Canister Purge Valve duty cycle              | 41.99      | %     |
| EVAPCV                | Evaporative Emission Canister Vent Valve                          | Off        |       |
| VT_EX_DUTY_MZ         | Exhaust Camshaft Position Duty Cycle 1                            | 0          | %     |
| FCL_MZ                | Fuel Cap Warning Light                                            | Off        |       |
| FLI                   | Fuel Level                                                        | 75.78      | %     |
| FUEL_P_DSD_MZ         | Fuel Pressure Desired                                             | 738.25     | inHg  |
| FRP_DSD_MZ            | Fuel Rail Pressure Desired                                        | 738.25     | inHg  |
| FUEL_PRES_VOLT_MZ     | Fuel Pressure Sensor                                              | 0.92       | V     |
| FRP                   | Fuel Rail Pressure                                                | 0.92       | V     |
| FUEL_PRES_MZ          | Fuel Pressure Sensor                                              | 741.21     | inHg  |
| FRP_DCM               | Fuel Rail Pressure                                                | 741.21     | inHg  |
| FP_PER_MZ             | Fuel pump                                                         | 30.3       | %     |
| FP                    | Fuel pump                                                         | 30.3       | %     |
| FP_PER_RdWt_MZ        | Fuel pump                                                         | 9930       |       |
| FP_PER_DUTY_MZ        | Fuel Pump Duty Cycle                                              | 30.3       | %     |
| FPM                   | Fuel pump monitor                                                 | 40.02      | %     |
| FUEL_SYS              | Fuel System Status (Open/Closed Loop)                             | CL         |       |
| FTP_V                 | Fuel Tank Pressure Transducer                                     | 2.02       | V     |
| FLT_V_MZ              | Fuel Temperature Signal Voltage                                   | 5          | V     |
| GEAR_GGDS_MZ          | Gear commanded by module                                          | P          |       |
| CHRGLP                | Generator Warning Light                                           | Off        |       |
| O2S12                 | Heated Exhaust Gas Oxygen Sensor (Bank 1, Sensor 2)               | 0.76       | V     |
| SHRTFT12_CA_MZ        | Short Term Fuel Trim (Bank 1, Sensor 2)                           | 99.22      | %     |
| O2S22                 | Heated Exhaust Gas Oxygen Sensor (Bank 2, Sensor 2)               | 0.76       | V     |
| SHRTFT22              | Short term fuel trim bank 2 sensor 2                              | 99.22      | %     |
| HTR11                 | Heated Exhaust Gas Oxygen Sensor Heater (Bank 1, Sensor 1)        | On         |       |
| HTR12                 | Heated Exhaust Gas Oxygen Sensor Heater (Bank 1, Sensor 2)        | On         |       |
| HTR21                 | Heated Exhaust Gas Oxygen Sensor Heater (Bank 2, Sensor 1)        | On         |       |
| HTR22                 | Heated Exhaust Gas Oxygen Sensor Heater (Bank 2, Sensor 2)        | On         |       |
| HTR11_PER             | Heated Exhaust Gas Oxygen Sensor Heater (Bank 1, Sensor 1)        | 44.71      | %     |
| HTR21_PER             | Heated Exhaust Gas Oxygen Sensor Heater (Bank 2, Sensor 1)        | 44.31      | %     |
| IVS                   | Idle Validation Switch                                            | 1          |       |
| IG_SW_MZ              | Ignition switch status                                            | On         |       |
| INJ_PWR               | Injector Power Monitor                                            | 14.49      | V     |
| IAT                   | Intake Air Temperature (sensor 1)                                 | 2.27       | V     |
| IAT                   | Intake Air Temperature (sensor 2)                                 | 2.83       | V     |
| IAT2_TEMP_MZ          | Intake Air Temperature 2                                          | 93.2       | °F    |
| IMRC                  | Intake Manifold Runner Control                                    | Off        |       |
| IMTV                  | Intake Manifold Tuning Valve                                      | Off        |       |
| ISV_POS_MZ            | Intake Shutter Valve Position                                     | 11.37      | %     |
| TP1_MZ                | Throttle Position Sensor 1                                        | 11.37      | %     |
| KNOCKR                | Knocking Retard                                                   | 0          | deg   |
| LONGFT12              | Long Term Fuel Trim (Bank 1, Sensor 2)                            | –0.78      | %     |
| LONGFT1               | Long term fuel trim 1                                             | 6.25       | %     |
| LONGFT2               | Long term fuel trim 2                                             | 6.25       | %     |
| LOW_OIL_DV6C_P_MZ     | Low Oil Pressure (Switch)                                         | Never Detected |    |
| PN_SW_MZ              | Parking/Neutral Switch                                            | Open       |       |
| SED_SW_MZ             | Sedimentor Switch                                                 | Off        |       |
| MAP_V                 | Manifold absolute pressure sensor                                 | 0.93       | V     |
| MAP                   | Manifold absolute pressure sensor                                 | 11.81      | inHg  |
| MAP_V                 | Manifold absolute pressure sensor                                 | 1.53       | V     |
| VPWR                  | Module supply voltage                                             | 14.49      | V     |
| RO2FT1_GGDS           | Rear O2 Fuel Trim – Bank 1                                        | 0.01       | %     |
| RO2FT2_GGDS           | Rear O2 Fuel Trim – Bank 2                                        | 0.01       | %     |
| TP_REL                | Relative Throttle Position                                        | 1.18       | %     |
| SHRTFT1               | Short term fuel trim 1                                            | –0.78      | %     |
| SHRTFT2               | Short term fuel trim 2                                            | –2.34      | %     |
| SparkAdv              | Spark Advance                                                     | 10         | deg   |
| LINEDES               | Target Modifier Pressure/Target Pressure Control Solenoid Pr...   | 121.07     | inHg  |
| MIL_DIS               | The distance travelled since the (MIL) was activated              | 0          | miles |
| EG_RUN_TIME_SS-P_MZ   | Times Since Engine Start                                          | 1040       | sec   |
| TFTV                  | Transmission Fluid Temperature                                    | 1.9        | V     |
| TFT                   | Transmission Fluid Temperature                                    | 137.42     | °F    |
| GEAR_ENG_PCM_MZ       | Transmission Gear Engaged                                         | Park       |       |
| VSS                   | Vehicle Speed                                                     | 0          | MPH   |
| WGC_MZ                | WGC Solenoid Valve                                                | 0          | %     |


## All-Wheel Drive Module (AWDM)

| PID Codename         | Description                                           | Value                        | Units  |
|----------------------|-------------------------------------------------------|------------------------------|--------|
| CLRDIST_AWD          | Distance Since Diagnostic Trouble Codes Cleared       | 4483.2                       | miles  |
| RPM_AWD              | Engine RPM                                            | 626                          | RPM    |
| FAD_ACT_STATUS       | FAD_ACT_STATUS                                        | FAD in 4WD - CONNECTED       |        |
| FAD_CLTCH_CMD        | FAD_CLTCH_CMD                                         | Command Connect              |        |
| FAD_DISCON_IN_DC     | FAD_DISCON_IN_DC                                      | 0                            | %      |
| FAD_STRG_CMD         | FAD_STRG_CMD                                          | Connect Request              |        |
| FAD_SUPPLY_V         | FAD_SUPPLY_V                                          | 0                            | V      |
| FOOTBRK_AWD          | Foot Brake - Foot brake state used by strategy        | Off                          |        |
| VPWR_AWD             | Module supply voltage                                 | 14.63                        | V      |
| DTC_CNT_AWD          | Number of (DTC) Stored in Module                      | 0                            |        |
| PROG_FLOWT1_AWD      | Program Flow Trace Information - 1                    | 0                            |        |
| PROG_FLOWT2_AWD      | Program Flow Trace Information - 2                    | 34429                        |        |
| TC_A_CUR_MES         | TC_A_CUR_MES                                          | 0                            | A      |
| TC_MTR_OUT_DC        | TC_MTR_OUT_DC                                         | 5                            | %      |
| TC_MTR_POS_CORR      | TC_MTR_POS_CORR                                       | 46                           | deg    |
| TC_MTR_POS_REQ       | TC_MTR_POS_REQ                                        | 46                           | deg    |
| TC_MTRPOS_KISS       | TC_MTRPOS_KISS                                        | 46                           | deg    |
| TC_SECD_OSS          | TC_SECD_OSS                                           | 0                            | RPM    |
| TC_TRQ_REQ           | TC_TRQ_REQ                                            | 0                            | lb·ft  |
| TC_TRQCAP_INF        | TC_TRQCAP_INF                                         | 0                            | lb·ft  |
| RUNTIME_AWD          | Time since start (s)                                  | 955                          | sec    |
| VSS_AWD              | Vehicle Speed                                         | 0                            | MPH    |


## Body Control Module (BCM)

| PID                              | Description                                                   | Value                           | Units |
|----------------------------------|---------------------------------------------------------------|---------------------------------|-------|
| V_BATT_BCM                       | Battery Voltage                                               | 14.4                            |       |
| B_FLUID_LEV_BCM                  | Brake Fluid Level                                             | OK                              |       |
| BRK_SHIFT_BCM                    | Brake/Shift Interlock                                         | Inactive                        |       |
| CRASH_BCM                        | Crash Sensed Status                                           | Normal – No Crash Detected      |       |
| CUM_BAT_CHARGE_ON_BCM            | Cumulative Battery Charge When Ignition Is On                 | 19                              |       |
| CUM_BAT_DISCHRG_SLP_BCM          | Cumulative Discharge From Battery in Sleep Mode               | 14.62                           |       |
| CUM_BAT_DISCHRG_OFF_BCM          | Cumulative Discharge From Battery When Engine Is Off          | 7.6                             |       |
| CUM_BAT_DISCHRG_RUN_BCM          | Cumulative Discharge From Battery When Engine Is On           | 6                               |       |
| DOOR_SW_DRVR_BCM                 | Driver’s Door Ajar Switch Status                              | Closed                          |       |
| HOOD_SW_BCM                      | Hood Ajar Switch                                              | Closed                          |       |
| DOOR_SW_LR_BCM                   | Left Rear Door Ajar Switch                                    | Closed                          |       |
| DOOR_SW_LUGG_BCM                 | Luggage Compartment Lid Ajar Switch                           | Closed                          |       |
| DOOR_SW_PSGR_BCM                 | Passenger Door Ajar Switch Status                             | Closed                          |       |
| DOOR_SW_RR_BCM                   | Right Rear Door Ajar Switch                                   | Closed                          |       |
| BCM_STATE                        | ECU Operating State                                           | Default                         |       |
| PLCRD_TP_FRT_BCM                 | Front Tire Placard Pressure                                   | 116.06                          |       |
| HORN_SW_BCM                      | Horn Switch                                                   | OFF                             |       |
| KEY_IN_SW_BCM                    | Ignition Key In / Out                                         | KEY – IN                        |       |
| IGN_SW_STATE_BCM                 | Ignition Switch State                                         | Run                             |       |
| KEY_IN_INFRD_BCM                 | Inferred Key-In-Ignition Status                               | Key In                          |       |
| KEY_REMOVE_INHIBIT_BCM           | Key Removal Inhibit                                           | Active                          |       |
| KEY_IN_INPT_BCM                  | Key-In-Ignition Input Circuit                                 | Active                          |       |
| LAST_REMOTE_CTRL_ST              | Last Received Request From Remote Key                         | Unlock All Doors                |       |
| TPMS_HIT_RATE_LF_BCM             | Left Front TPMS Sensor Hit Rate                               | 18                              |       |
| TPMS_HIT_RATE_LRO_BCM            | Left Rear Outer TPMS Sensor Hit Rate                          | 36                              |       |
| TPMS_HIT_RATE_RF_BCM             | Right Front TPMS Sensor Hit Rate                              | 13                              |       |
| TPMS_HIT_RATE_RRO_BCM            | Right Rear Outer TPMS Sensor Hit Rate                         | 39                              |       |
| TPMS_MESSAGE_COUNT_LF_BCM        | Left Front TPMS Sensor Message Count                          | 15                              |       |
| TPMS_MESSAGE_COUNT_LRO_BCM       | Left Rear Outer TPMS Sensor Message Count                     | 29                              |       |
| TPMS_MESSAGE_COUNT_RF_BCM        | Right Front TPMS Sensor Message Count                         | 11                              |       |
| TPMS_MESSAGE_COUNT_RRO_BCM       | Right Rear Outer TPMS Sensor Message Count                    | 28                              |       |
| TPM_PRES_LF_BCM       | Left Front Tire Pressure                                           | 117.18    | inHg  |
| LOW_BEAM_LT_BCM       | Left Headlamp Low Beam                                             | Inactive  |       |
| TPM_PRES_LRI_BCM      | Left Rear Inner Tire Pressure                                      | 305.42    | inHg  |
| TPM_PRES_LRO_BCM      | Left Rear Outer Tire Pressure                                      | 156.88    | inHg  |
| ODDTC_BCM             | Number of Trouble Codes Set Due to Diagnostic Test                  | 0         |       |
| KEY_LRN_MODE_BCM      | PATS Delivery Mode                                                 | SERVICE   |       |
| KEYS_PROGMD_BCM       | PATS Number of Ignition Key Codes Supported                        | 4         |       |
| PLCRD_TP_BCK_BCM      | Rear Tire Placard Pressure                                         | 152.71    | inHg  |
| TPM_PRES_RF_BCM       | Right Front Tire Pressure                                          | 113.11    | inHg  |
| LOW_BEAM_RT_BCM       | Right Headlamp Low Beam                                            | Inactive  |       |
| TPM_PRES_RRI_BCM      | Right Rear Inner Tire Pressure                                     | 305.42    | inHg  |
| TPM_PRES_RRO_BCM      | Right Rear Outer Tire Pressure                                     | 151.79    | inHg  |
| TPM_WRN_LMP_BCM       | Tire Pressure Monitoring System Indicator                          | OFF       |       |
| TPMS_STATUS_BCM       | Tire Pressure Monitoring System Status                             | System Active |    |
| TPM_MOTION_STAT_BCM   | TPMS Vehicle Motion Status                                         | Parked    |       |
| TPM_L_PRESS_BCM       | TPMS Last Received Measured Pressure                               | 156.78    | inHg  |
| TPM_L_SR_CS_BCM       | TPMS Last Received Sensor Check Sum                                | 101       |       |
| TPM_L_SR_ID_BCM       | TPMS Last Received Sensor ID                                       | 1800208616|       |
| TPM_L_STAT_BCM        | TPMS Last Received Sensor Status                                   | 38        |       |
| TPM_L_TEMP_BCM        | TPMS Last Received Temperature                                     | 77        | °F    |
| EVT1_AGE_IGN_BCM      | TPMS Last Warning Event #1 – Age In Ignition Cycles Since Thresh.  | 255       |       |
| EVT1_TR_LOC_BCM       | TPMS Last Warning Event #1 – Last Learned Transmitter Location      | 6         |       |
| EVT1_PRESS_BCM        | TPMS Last Warning Event #1 – Measured Sensor Pressure              | 27.49     | inHg  |
| EVT1_ODOMTR_BCM       | TPMS Last Warning Event #1 – Odometer Reading                      | 0         | miles |
| EVT1_PRES_BP_BCM      | TPMS Last Warning Event #1 – Sensor Pressure Barometrically Adjusted| 27.49     | inHg  |
| EVT1_SNSR_ST_BCM      | TPMS Last Warning Event #1 – Sensor Status                         | 0         |       |
| EVT1_TEMP_BCM         | TPMS Last Warning Event #1 – Sensor Temperature                    | 419       | °F    |
| EVT1_WRN_ST_BCM       | TPMS Last Warning Event #1 – Sensor Warning Status                 | Unknown   |       |
| EVT1_SNSR_ID_BCM      | TPMS Last Warning Event #1 – Transmitter ID                        | 0         |       |
| EVT2_AGE_IGN_BCM      | TPMS Last Warning Event #2 – Age In Ignition Cycles Since Thresh.  | 255       |       |
| EVT2_TR_LOC_BCM       | TPMS Last Warning Event #2 – Last Learned Transmitter Location      | 6         |       |
| EVT2_PRESS_BCM        | TPMS Last Warning Event #2 – Measured Sensor Pressure              | 27.49     | inHg  |
| EVT2_ODOMTR_BCM       | TPMS Last Warning Event #2 – Odometer Reading                      | 0         | miles |
| EVT2_PRES_BP_BCM      | TPMS Last Warning Event #2 – Sensor Pressure Barometrically Adjusted| 27.49     | inHg  |
| EVT2_SNSR_ST_BCM      | TPMS Last Warning Event #2 – Sensor Status                         | 0         |       |
| EVT2_TEMP_BCM         | TPMS Last Warning Event #2 – Sensor Temperature                    | 419       | °F    |
| EVT2_WRN_ST_BCM       | TPMS Last Warning Event #2 – Sensor Warning Status                 | Unknown   |       |
| EVT2_SNSR_ID_BCM      | TPMS Last Warning Event #2 – Transmitter ID                        | 0         |       |
| EVT3_AGE_IGN_BCM      | TPMS Last Warning Event #3 – Age In Ignition Cycles Since Thresh.  | 255       |       |
| EVT3_TR_LOC_BCM       | TPMS Last Warning Event #3 – Last Learned Transmitter Location      | 6         |       |
| EVT3_PRESS_BCM        | TPMS Last Warning Event #3 – Measured Sensor Pressure              | 27.49     | inHg  |
| EVT3_ODOMTR_BCM       | TPMS Last Warning Event #3 – Odometer Reading                      | 0         | miles |
| EVT3_PRES_BP_BCM      | TPMS Last Warning Event #3 – Sensor Pressure Barometrically Adjusted| 27.49     | inHg  |
| EVT3_SNSR_ST_BCM      | TPMS Last Warning Event #3 – Sensor Status                         | 0         |       |
| EVT3_TEMP_BCM         | TPMS Last Warning Event #3 – Sensor Temperature                    | 419       | °F    |
| EVT3_WRN_ST_BCM       | TPMS Last Warning Event #3 – Sensor Warning Status                 | Unknown   |       |
| EVT3_SNSR_ID_BCM      | TPMS Last Warning Event #3 – Transmitter ID                        | 0         |       |
| EVT4_AGE_IGN_BCM      | TPMS Last Warning Event #4 – Age In Ignition Cycles Since Thresh.  | 255       |       |
| EVT4_TR_LOC_BCM       | TPMS Last Warning Event #4 – Last Learned Transmitter Location      | 6         |       |
| EVT4_PRESS_BCM        | TPMS Last Warning Event #4 – Measured Sensor Pressure              | 27.49     | inHg  |
| EVT4_ODOMTR_BCM       | TPMS Last Warning Event #4 – Odometer Reading                      | 0         | miles |
| EVT4_PRES_BP_BCM      | TPMS Last Warning Event #4 – Sensor Pressure Barometrically Adjusted| 27.49     | inHg  |
| EVT4_SNSR_ST_BCM      | TPMS Last Warning Event #4 – Sensor Status                         | 0         |       |
| EVT4_TEMP_BCM         | TPMS Last Warning Event #4 – Sensor Temperature                    | 419       | °F    |
| EVT4_WRN_ST_BCM       | TPMS Last Warning Event #4 – Sensor Warning Status                 | Unknown   |       |
| EVT4_SNSR_ID_BCM      | TPMS Last Warning Event #4 – Transmitter ID                        | 0         |       |
| EVT5_AGE_IGN_BCM      | TPMS Last Warning Event #5 – Age In Ignition Cycles Since Thresh.  | 255       |       |
| EVT5_TR_LOC_BCM       | TPMS Last Warning Event #5 – Last Learned Transmitter Location      | 6         |       |
| EVT5_PRESS_BCM        | TPMS Last Warning Event #5 – Measured Sensor Pressure              | 27.49     | inHg  |
| EVT5_ODOMTR_BCM       | TPMS Last Warning Event #5 – Odometer Reading                      | 0         | miles |
| EVT5_PRES_BP_BCM      | TPMS Last Warning Event #5 – Sensor Pressure Barometrically Adjusted| 27.49     | inHg  |
| EVT5_SNSR_ST_BCM      | TPMS Last Warning Event #5 – Sensor Status                         | 0         |       |
| EVT5_TEMP_BCM         | TPMS Last Warning Event #5 – Sensor Temperature                    | 419       | °F    |
| EVT5_WRN_ST_BCM       | TPMS Last Warning Event #5 – Sensor Warning Status                 | Unknown   |       |
| EVT5_SNSR_ID_BCM      | TPMS Last Warning Event #5 – Transmitter ID                        | 0         |       |
| TPM_S_ID_LF_BCM       | TPMS Tire Sensor ID Left Front                                    | 1800208739|       |
| TPM_S_ID_LRI_BCM      | TPMS Tire Sensor ID Left Rear Inner                              | 0         |       |
| TPM_S_ID_LRO_BCM      | TPMS Tire Sensor ID Left Rear Outer                              | 1800208616|       |
| TPM_S_ID_RF_BCM       | TPMS Tire Sensor ID Right Front                                 | 1800207464|       |
| TPM_S_ID_RRI_BCM      | TPMS Tire Sensor ID Right Rear Inner                            | 0         |       |
| TPM_S_ID_RRO_BCM      | TPMS Tire Sensor ID Right Rear Outer                            | 1800209031|       |
| TRN_SIG_SW_L_BCM      | Turn Signal Left Switch Input Status                            | Off        |       |
| TRN_SIG_SW_R_BCM      | Turn Signal Right Switch Input Status                           | Off        |       |
| BAT_CURRENT_BCM       | Vehicle Battery – Current                                       | 14         | A     |
| BATTERY_AGE_BCM       | Vehicle Battery – Days in Service                               | 1373       |       |
| BAT_TEMP_BCM          | Vehicle Battery – Estimated Temperature                         | 73.4       | °F    |
| BAT_ST_CHRG_BCM       | Vehicle Battery – State of Charge                              | 66         | %     |

## Accessory Protocol Interface Module (APIM)

| PID                    | Description                                                                  | Value       | Units |
|------------------------|------------------------------------------------------------------------------|-------------|-------|
| APIM_ASC_F111_PID      | APIM_ASC_F111_PID                                                            | 0           |       |
| APIM_ASC_F113_PID      | APIM_ASC_F113_PID                                                            | 1280652628  |       |
| AUDIO_SRC_FD52         | AUDIO_SRC_FD52                                                               | FM1         |       |
| BAT_MOD_APIM           | Battery Module Voltage                                                       | 14.4        | V     |
| BT_CONN                | Bluetooth Device Connected                                                   | Yes         |       |
| BT_PAIR                | Bluetooth Device Paired                                                      | Yes         |       |
| APIM_M_P               | ECU Mono Primary Source                                                      | Inactive    |       |
| APIM_P_C               | ECU Phone Call                                                               | Inactive    |       |
| APIM_S_P               | ECU Stereo Primary Source                                                    | Active      |       |
| APIM_S_S               | ECU Stereo Secondary Source                                                  | Inactive    |       |
| USBDEVICE1             | USBDEVICE1                                                                   | Yes         |       |
| USBDEVICE2             | USBDEVICE2                                                                   | No          |       |
| APIM_State             | ECU Operating States                                                         | Default     |       |
| APIM_SED_8033_PID      | ECU Status                                                                   | 0           |       |
| GEAR_DISPLAY_APIM      | Gear Display                                                                 | Park Position |     |
| GPS_LATITUDE_APIM      | Global position latitude                                                     | 2239        |       |
| GPS_LONGITUDE_APIM     | Global position longitude                                                    | –7316       |       |
| GPS_ALTITUDE_APIM      | GPS Altitude                                                                 | 78.74       | ft    |
| GPS_FIX_APIM           | GPS Fix                                                                      | 3D Fix      |       |
| GPS_HEADING_APIM       | GPS Heading                                                                  | 11          | deg   |
| GPS_SPEED_APIM         | GPS Speed                                                                    | 0           | MPH   |
| KEYPOS_APIM            | Ignition key input                                                           | Ignition    |       |
| APIM_NUM_0202_PID      | Number of diagnostic trouble codes set due to diagnostic test                | 0           |       |
| SCS_END_APIM           | SCS_END_APIM                                                                 | RELEASED    |       |
| SCS_MEDIA_APIM         | SCS_MEDIA_APIM                                                               | RELEASED    |       |
| SCS_MENUMINUS_APIM     | SCS_MENUMINUS_APIM                                                           | RELEASED    |       |
| SCS_MENUPLUS_APIM      | SCS_MENUPLUS_APIM                                                            | RELEASED    |       |
| SCS_MODE_APIM          | SCS_MODE_APIM                                                                | RELEASED    |       |
| SCS_MUTE_APIM          | SCS_MUTE_APIM                                                                | RELEASED    |       |
| SCS_OK_APIM            | SCS_OK_APIM                                                                  | RELEASED    |       |
| SCS_PHONE_APIM         | SCS_PHONE_APIM                                                               | RELEASED    |       |
| SCS_SEEKMINUS_APIM     | SCS_SEEKMINUS_APIM                                                           | RELEASED    |       |
| SCS_SEEKPLUS_APIM      | SCS_SEEKPLUS_APIM                                                            | RELEASED    |       |
| SCS_SEND_APIM          | SCS_SEND_APIM                                                                | RELEASED    |       |
| SCS_VOLDOWN_APIM       | SCS_VOLDOWN_APIM                                                             | RELEASED    |       |
| SCS_VOLUP_APIM         | SCS_VOLUP_APIM                                                               | RELEASED    |       |
| SCS_VOICE_APIM         | Steering Wheel Voice Button                                                  | RELEASED    |       |
| APIM_ASC_F141_PID      | Serial Number                                                                | 0           |       |
| APIM_ASC_F188_PID      | Software version number                                                      | 0           |       |

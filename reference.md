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








# AI Generaged Information

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

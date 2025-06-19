# FORScan

Forscan is probably the most extensive tool outside of official Ford software that provides access to PIDs for reading and to make changes.

Here's an example dump of my 2021 Ford Transit Sitting off, but key on in the driveway.

Keep in mind many of these PIDs may provide no data or non-functional data.  This is simply to be used as a reference.

## ABS

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| time(ms)                   | 12051                                             |    |    |    |    |
| ABSEVE_ABS( )              | 0                                                 |    |    |    |    |
| ABSTCVFLIV                 | Off                                               |    |    |    |    |
| ABSTCVPMS                  | Off                                               |    |    |    |    |
| ABSTCVRLIV                 | Off                                               |    |    |    |    |
| ABSTCVRRD                  | Off                                               |    |    |    |    |
| ABSTCVRRIV                 | Off                                               |    |    |    |    |
| ABSTCVVS                   | Off                                               |    |    |    |    |
| ABS_DIAGSTATE              | Unknown                                           |    |    |    |    |
| BD_TEMP_RL(°C)             | 1                                                 |    |    |    |    |
| BD_TEMP_RR(°C)             | 0                                                 |    |    |    |    |
| BFLHP(kPa)                 | 0.0                                               |    |    |    |    |
| BOO1                       | Off                                               |    |    |    |    |
| BOO2                       | Off                                               |    |    |    |    |
| BOO_1                      | Off                                               |    |    |    |    |
| BPAS_AVB                   | Activated                                         |    |    |    |    |
| BPAS_HP                    | Inactive                                          |    |    |    |    |
| BPAS_RLS_SW                | Inactive                                          |    |    |    |    |
| BRAKE_SW                   | Off                                               |    |    |    |    |
| BRAKLGHT_RQST              | Off                                               |    |    |    |    |
| BRK_FLUID                  | NORMAL                                            |    |    |    |    |
| BSS_ABS_FA                 | No                                                |    |    |    |    |
| BSS_ABS_LMP                | OFF                                               |    |    |    |    |
| BSS_ABS_MD                 | Inactive                                          |    |    |    |    |
| BSS_ABS_RA                 | No                                                |    |    |    |    |
| BSS_AYC                    | Inactive                                          |    |    |    |    |
| BSS_BRK_LMP                | OFF                                               |    |    |    |    |
| BSS_DSC                    | Inactive                                          |    |    |    |    |
| BSS_DSC_LMP                | OFF                                               |    |    |    |    |
| BSS_DSC_SWL                | OFF                                               |    |    |    |    |
| BSS_EBD                    | Inactive                                          |    |    |    |    |
| BSS_HLA                    | Inactive                                          |    |    |    |    |
| BSS_SW                     | Not Pressed                                       |    |    |    |    |
| BSS_TC_BIM                 | Inactive                                          |    |    |    |    |
| DYNOMODE                   | NO                                                |    |    |    |    |
| ECU_F_ABS                  | Inactive                                          |    |    |    |    |
| ECU_F_AYC                  | Inactive                                          |    |    |    |    |
| ECU_F_BTCS                 | Inactive                                          |    |    |    |    |
| ECU_F_ESC                  | Inactive                                          |    |    |    |    |
| ECU_F_HDC                  | Enabled                                           |    |    |    |    |
| ECU_F_TCS                  | Inactive                                          |    |    |    |    |
| EFPS                       | No Fill                                           |    |    |    |    |
| ELEC_STAB_PROG             | ABS Only                                          |    |    |    |    |
| ESPEVE_ABS( )              | 0                                                 |    |    |    |    |
| FLT_LMP                    | Off                                               |    |    |    |    |
| GLOBTIM(s)                 | 0                                                 |    |    |    |    |
| HILL_SW_CIL_F              | No Fault                                          |    |    |    |    |
| HILL_SW_CMD                | Inactive                                          |    |    |    |    |
| HILL_SW_RAW                | Inactive                                          |    |    |    |    |
| HLA_MODE                   | Inactive                                          |    |    |    |    |
| HSA_ACT_THR(m/s²)          | 0.08                                              |    |    |    |    |
| IFC_D703( )                | 5E9                                               |    |    |    |    |
| LF_DUMP                    | Off                                               |    |    |    |    |
| LF_P_BR_A_ST               | Clamping                                          |    |    |    |    |
| LF_RR_TC_ISO2              | Off                                               |    |    |    |    |
| LF_RR_TC_SUP2              | Off                                               |    |    |    |    |
| LF_WSPD(km/h)              | 110.0                                             |    |    |    |    |
| LNGACC(G)                  | 0.00                                              |    |    |    |    |
| LONGACC_ABS(G)             | 0.00                                              |    |    |    |    |
| LON_ACC_VAL2(m/s²)         | 0.00                                              |    |    |    |    |
| LRWSSI(km/h)               | 0.0                                               |    |    |    |    |
| LR_DUMP                    | Off                                               |    |    |    |    |
| LTRLACC_ABS(G)             | 0.00                                              |    |    |    |    |
| MAINECUV(V)                | 0.00                                              |    |    |    |    |
| NUM_BRK_ASST_EVNT( )       | 0                                                 |    |    |    |    |
| OUTTMP(°C)                 | -40                                               |    |    |    |    |
| PARKBRAK                   | OFF                                               |    |    |    |    |
| PARK_B_RQ_S                | FSF - Failsafe                                    |    |    |    |    |
| PARK_B_RQ_T                | Idle                                              |    |    |    |    |
| PARK_B_ST                  | Both Actuators Clamped                            |    |    |    |    |
| PBM_CUR_L(A)               | 0.00                                              |    |    |    |    |
| PBM_CUR_R(A)               | 0.00                                              |    |    |    |    |
| PBRK_SW                    | Neutral                                           |    |    |    |    |
| PB_SA_CNT( )               | 0                                                 |    |    |    |    |
| PK_BRK_ST                  | Off                                               |    |    |    |    |
| PRK_BRAKE                  | Off                                               |    |    |    |    |
| PRK_BRK_SW                 | error                                             |    |    |    |    |
| REGEN_BRAKING              | Off                                               |    |    |    |    |
| REV_GEAR_SW                | Off                                               |    |    |    |    |
| RFWSSI(km/h)               | 0.0                                               |    |    |    |    |
| RF_DUMP                    | Off                                               |    |    |    |    |
| RF_ISO                     | Off                                               |    |    |    |    |
| RF_LR_TC_ISO2              | Off                                               |    |    |    |    |
| RF_LR_TC_SUP2              | Off                                               |    |    |    |    |
| ROLL_RATE(1/min)           | -0                                                |    |    |    |    |
| RR_WSPD(km/h)              | 24.0                                              |    |    |    |    |
| RSC                        | Inactive                                          |    |    |    |    |
| RT_P_BR_A_ST               | Clamping                                          |    |    |    |    |
| SELTESTDTC( )              | 1                                                 |    |    |    |    |
| SEL_DRIV_M_C_A             | Normal Mode                                       |    |    |    |    |
| STR_ANG_ABS(°)             | -749.40                                           |    |    |    |    |
| TCEVE_ABS( )               | 0                                                 |    |    |    |    |
| TC_ACTIVE                  | Off                                               |    |    |    |    |
| TC_ACT_CIL                 | Off                                               |    |    |    |    |
| TC_F_IL                    | Off                                               |    |    |    |    |
| TC_OFFLMP                  | Off                                               |    |    |    |    |
| TC_SW_STAT                 | On                                                |    |    |    |    |
| TC_SYS_STAT                | On                                                |    |    |    |    |
| TOTAL_DIST(km)             | 330.0                                             |    |    |    |    |
| TSCntrl                    | INACTIVE                                          |    |    |    |    |
| VAC_PRS_S1(kPa)            | 0.0                                               |    |    |    |    |
| VPWR_ABS(V)                | 5.00                                              |    |    |    |    |
| VSS(km/h)                  | 4.0                                               |    |    |    |    |
| YAWR(1/min)                | 0                                                 |    |    |    |    |
| YAW_CORR(1/min)            | 0                                                 |    |    |    |    |

##APIM

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| 3R_LT_SPKR                 | ENABLE                                            |    |    |    |    |
| 3R_RT_SPKR                 | ENABLE                                            |    |    |    |    |
| ACM_State                  | error                                             |    |    |    |    |
| ADJ_INTR_NOIS( )           | 0                                                 |    |    |    |    |
| ANT_CURR1(mA)              | 0.00                                              |    |    |    |    |
| ANT_SIG_STR(dBµV)          | 132.00                                            |    |    |    |    |
| CENTER_SPKR                | ENABLE                                            |    |    |    |    |
| CENTR2_SPKR                | ENABLE                                            |    |    |    |    |
| CENTR_TWEET                | ENABLE                                            |    |    |    |    |
| CHN_FREQ(MHz)              | 87.80                                             |    |    |    |    |
| ECU_STATUS                 | Unknown                                           |    |    |    |    |
| EON_TA_ID                  | OFF                                               |    |    |    |    |
| EON_TP_ID                  | OFF                                               |    |    |    |    |
| IO_CDDJ                    | Inactive                                          |    |    |    |    |
| IO_CLOCK_SW                | Inactive                                          |    |    |    |    |
| IO_CTD                     | Inactive                                          |    |    |    |    |
| IO_DAB                     | Inactive                                          |    |    |    |    |
| IO_LOAD_SW                 | Inactive                                          |    |    |    |    |
| IO_PLUS_SW                 | Inactive                                          |    |    |    |    |
| IO_PTA                     | Inactive                                          |    |    |    |    |
| IO_REAR_SC                 | Active                                            |    |    |    |    |
| IO_RPA                     | Inactive                                          |    |    |    |    |
| IO_SCDP                    | Inactive                                          |    |    |    |    |
| IO_SWC                     | Inactive                                          |    |    |    |    |
| IO_TAPE                    | Inactive                                          |    |    |    |    |
| KEYPOS                     | Ignition                                          |    |    |    |    |
| LF_MR_SPKR                 | ENABLE                                            |    |    |    |    |
| LF_SPKR                    | DISABLE                                           |    |    |    |    |
| LF_TWEETER                 | ENABLE                                            |    |    |    |    |
| LR_SPKR                    | ENABLE                                            |    |    |    |    |
| LR_TWEETER                 | ENABLE                                            |    |    |    |    |
| MAX_RD_VOLUME(%)           | 0.01                                              |    |    |    |    |
| NOTCSDTDT( )               | 58                                                |    |    |    |    |
| RADO_MULT_INT( )           | 32                                                |    |    |    |    |
| RCENTR_SPKR                | ENABLE                                            |    |    |    |    |
| RDS_QUALT_VAL( )           | 0                                                 |    |    |    |    |
| RDS_STATN_ID( )            | 129                                               |    |    |    |    |
| RF_MR_SPKR                 | ENABLE                                            |    |    |    |    |
| RF_SPKR                    | ENABLE                                            |    |    |    |    |
| RF_TWEETER                 | ENABLE                                            |    |    |    |    |
| RR_SPKR                    | ENABLE                                            |    |    |    |    |
| RR_TWEETER                 | ENABLE                                            |    |    |    |    |
| SIG_STR2(dBµV)             | 0.00                                              |    |    |    |    |
| SPKR_TST_TONE(Hz)          | No Tone (off)                                     |    |    |    |    |
| SUBWOOFER                  | ENABLE                                            |    |    |    |    |
| SUBWOOFER2                 | ENABLE                                            |    |    |    |    |
| TA_ID                      | OFF                                               |    |    |    |    |
| TRAFC_PGM_ID               | OFF                                               |    |    |    |    |
| VOLUME( )                  | 82                                                |    |    |    |    |
| VPWR_ACM(V)                | 10.30                                             |    |    |    |    |
| VSS(km/h)                  | 0.2                                               |    |    |    |    |
| APIM_M_P                   | Inactive                                          |    |    |    |    |
| APIM_P_C                   | Inactive                                          |    |    |    |    |
| APIM_S_P                   | Inactive                                          |    |    |    |    |
| APIM_S_S                   | Inactive                                          |    |    |    |    |
| APIM_State                 | Unknown                                           |    |    |    |    |
| AUD_SRC                    | AM                                                |    |    |    |    |
| BATMOD(V)                  | 5.70                                              |    |    |    |    |
| BT_CONN                    | No                                                |    |    |    |    |
| BT_PAIR                    | Yes                                               |    |    |    |    |
| CORRUPT_CNT( )             | 0                                                 |    |    |    |    |
| GEAR_DISPLAY               | Park Position                                     |    |    |    |    |
| GPS_ALTITUDE(m)            | 0                                                 |    |    |    |    |
| GPS_FIX                    | error                                             |    |    |    |    |
| GPS_HEADING(°)             | -                                          |    |    |    |    |
| GPS_LATITUDE(°)            | -                                          |    |    |    |    |
| GPS_LONGITUDE(°)           | -                                          |    |    |    |    |
| GPS_SPEED(km/h)            | -                                           |    |    |    |    |
| ILL_OP_CNT( )              | 0                                                 |    |    |    |    |
| KEYPOS                     | Key Out                                           |    |    |    |    |
| LOOP_OF_CNT( )             | 0                                                 |    |    |    |    |
| MIN_IDLE( )                | 0                                                 |    |    |    |    |
| NOTCSDTDT( )               | 0                                                 |    |    |    |    |
| POWER_CNT( )               | 0                                                 |    |    |    |    |
| SERIAL#1( )                | 196608                                            |    |    |    |    |
| STACK_OF_CNT( )            | 0                                                 |    |    |    |    |
| SW_END                     | RELEASED                                          |    |    |    |    |
| SW_MEDIA                   | RELEASED                                          |    |    |    |    |
| SW_MENUMINUS               | RELEASED                                          |    |    |    |    |
| SW_MENUPLUS                | RELEASED                                          |    |    |    |    |
| SW_MODE                    | RELEASED                                          |    |    |    |    |
| SW_MUTE                    | RELEASED                                          |    |    |    |    |
| SW_OK                      | RELEASED                                          |    |    |    |    |
| SW_PHONE                   | RELEASED                                          |    |    |    |    |
| SW_SEEKMINUS               | DEPRESSED                                         |    |    |    |    |
| SW_SEEKPLUS                | RELEASED                                          |    |    |    |    |
| SW_SEND                    | RELEASED                                          |    |    |    |    |
| SW_VOICE                   | RELEASED                                          |    |    |    |    |
| SW_VOLDOWN                 | RELEASED                                          |    |    |    |    |
| SW_VOLUP                   | RELEASED                                          |    |    |    |    |
| USBDEVICE1                 | No                                                |    |    |    |    |
| USBDEVICE2                 | No                                                |    |    |    |    |
| VSS(km/h)                  | 0.0                                               |    |    |    |    |
| WDG_RST_CNT( )             | 0                                                 |    |    |    |    |

## AWDM

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| CLRDIST(km)                | 0.0                                               |    |    |    |    |
| DTC_CNT_AWD( )             | 6                                                 |    |    |    |    |
| FAD_ACT_STA                | error                                             |    |    |    |    |
| FAD_CLT_CMD                | error                                             |    |    |    |    |
| FAD_DSC_IN_DC(%)           | 0.00                                              |    |    |    |    |
| FAD_STR_CMD                | Disconnect Request                                |    |    |    |    |
| FAD_SUP_V(V)               | 0.00                                              |    |    |    |    |
| FOOT_BRAKE                 | Off                                               |    |    |    |    |
| GLOBTIM(s)                 | 7                                                 |    |    |    |    |
| PROG_FLOWTRACE1( )         | 0                                                 |    |    |    |    |
| PROG_FLOWTRACE2( )         | 0                                                 |    |    |    |    |
| RPM(1/min)                 | 0                                                 |    |    |    |    |
| RUNTM(s)                   | 0                                                 |    |    |    |    |
| TC_A_CUR_MES(A)            | 0.05                                              |    |    |    |    |
| TC_M_OUT_DC(%)             | 0.00                                              |    |    |    |    |
| TC_M_POS_COR(°)            | 0.00                                              |    |    |    |    |
| TC_M_POS_KISS(°)           | 0.00                                              |    |    |    |    |
| TC_M_POS_REQ(°)            | 0.00                                              |    |    |    |    |
| TC_SEC_OSS(1/min)          | 558                                               |    |    |    |    |
| TC_TQ_CAP_INF(Nm)          | 43690.0                                           |    |    |    |    |
| TC_TRQ_REQ(Nm)             | 24796.0                                           |    |    |    |    |
| TOTDIST(km)                | 0.0                                               |    |    |    |    |
| VPWR(V)                    | 0.00                                              |    |    |    |    |
| VSS_AWD(km/h)              | 0.0                                               |    |    |    |    |

## BCM

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| ACC_DELAY                  | No Control                                        |    |    |    |    |
| AJR_DR_DRV                 | Closed                                            |    |    |    |    |
| AJR_DR_LR                  | Closed                                            |    |    |    |    |
| AJR_DR_PAS                 | Closed                                            |    |    |    |    |
| AJR_DR_RR                  | Closed                                            |    |    |    |    |
| AJR_HOOD                   | Closed                                            |    |    |    |    |
| AJR_TLGT                   | Closed                                            |    |    |    |    |
| AMB_LT_LVL                 | error                                             |    |    |    |    |
| AMB_WHT_LHT                | error                                             |    |    |    |    |
| AUT_RSTRT_CNT( )           | 0                                                 |    |    |    |    |
| AUT_STOP_CNT( )            | 0                                                 |    |    |    |    |
| BATTERY_AGE( )             | 1857                                              |    |    |    |    |
| BATT_STATE_DET             | Hardware Fault                                    |    |    |    |    |
| BAT_CHRG_MODE              | Conventional Charging                             |    |    |    |    |
| BAT_CURRENT(A)             | -106.00                                           |    |    |    |    |
| BAT_CURR_2(A)              | 0.00                                              |    |    |    |    |
| BAT_CUR_PRD(A)             | 2087999.23                                        |    |    |    |    |
| BAT_QST_CUR_LR(mA)         | -1000.00                                          |    |    |    |    |
| BAT_RELAY                  | error                                             |    |    |    |    |
| BAT_ST_CHRG(%)             | 131.00                                            |    |    |    |    |
| BAT_TEMP(°C)               | -22                                               |    |    |    |    |
| BAT_VOLTAGE(V)             | 8.00                                              |    |    |    |    |
| BCM_STATE                  | error                                             |    |    |    |    |
| BMS_PWR_OUT                | error                                             |    |    |    |    |
| BOO1                       | Off                                               |    |    |    |    |
| BOO2                       | Off                                               |    |    |    |    |
| BOO_1                      | Off                                               |    |    |    |    |
| BPHR(kPa)                  | 0.0                                               |    |    |    |    |
| BRK_FLD_LVL                | Normal                                            |    |    |    |    |
| BRK_FLUID                  | OK                                                |    |    |    |    |
| BRK_SHIFT                  | Active                                            |    |    |    |    |
| CCNT_BCM( )                | 5                                                 |    |    |    |    |
| CHD_LCK_LR                 | Inactive                                          |    |    |    |    |
| CHD_LCK_RR                 | Active                                            |    |    |    |    |
| CSPM_DR_FAIL_CT( )         | 0                                                 |    |    |    |    |
| CSPM_IL_OP_CT( )           | 0                                                 |    |    |    |    |
| CSPM_LT_OF_CT( )           | 0                                                 |    |    |    |    |
| CSPM_MIN_I_TM( )           | 0                                                 |    |    |    |    |
| CSPM_PWR_D_CT( )           | 0                                                 |    |    |    |    |
| CSPM_PWR_ON_CT( )          | 0                                                 |    |    |    |    |
| CSPM_STK_OF_CT( )          | 0                                                 |    |    |    |    |
| CSPM_WD_TMR_CT( )          | 0                                                 |    |    |    |    |
| CUM_CHG_ON( )              | 6                                                 |    |    |    |    |
| CUM_DIS_OFF( )             | 0                                                 |    |    |    |    |
| CUM_DIS_RUN( )             | 0                                                 |    |    |    |    |
| CUM_DIS_SLP( )             | 0                                                 |    |    |    |    |
| DIM_SW_IN_1                | Courtesy On                                       |    |    |    |    |
| DOME_SW_IN                 | error                                             |    |    |    |    |
| DRVR_DR_COUNT( )           | 70                                                |    |    |    |    |
| ECL_SW_IN                  | No Control                                        |    |    |    |    |
| ELSW_AUTO                  | OFF                                               |    |    |    |    |
| ELSW_AUXDL                 | OFF                                               |    |    |    |    |
| ELSW_BRAKE                 | OFF                                               |    |    |    |    |
| ELSW_FLASH                 | OFF                                               |    |    |    |    |
| ELSW_HIBEAM                | OFF                                               |    |    |    |    |
| ELSW_LOBEAM                | OFF                                               |    |    |    |    |
| ELSW_SIDE                  | OFF                                               |    |    |    |    |
| ELSW_SVF                   | OFF                                               |    |    |    |    |
| ELSW_TN_LA_L               | OFF                                               |    |    |    |    |
| ELSW_TN_LA_R               | OFF                                               |    |    |    |    |
| ENG_IMB_CKEY               | NO                                                |    |    |    |    |
| ENG_IMB_STAT               | Unlock                                            |    |    |    |    |
| ENG_STRT_DIS               | No                                                |    |    |    |    |
| ENG_STRT_IDL               | FALSE                                             |    |    |    |    |
| ENG_STRT_NRML              | No                                                |    |    |    |    |
| ENG_STRT_REM               | No                                                |    |    |    |    |
| EVT1_AGE_IGN( )            | 0                                                 |    |    |    |    |
| EVT1_ODOMTR(km)            | 0.0                                               |    |    |    |    |
| EVT1_PRESS(kPa)            | 0.0                                               |    |    |    |    |
| EVT1_PRES_BP(kPa)          | 0.0                                               |    |    |    |    |
| EVT1_SNSR_ID( )            | 0                                                 |    |    |    |    |
| EVT1_SNSR_ST( )            | 0                                                 |    |    |    |    |
| EVT1_TEMP(°C)              | -40                                               |    |    |    |    |
| EVT1_TR_LOC                | Left Front                                        |    |    |    |    |
| EVT1_WRN_ST                | Unknown                                           |    |    |    |    |
| EVT2_AGE_IGN( )            | 0                                                 |    |    |    |    |
| EVT2_ODOMTR(km)            | 0.0                                               |    |    |    |    |
| EVT2_PRESS(kPa)            | 0.0                                               |    |    |    |    |
| EVT2_PRES_BP(kPa)          | 0.0                                               |    |    |    |    |
| EVT2_SNSR_ID( )            | 0                                                 |    |    |    |    |
| EVT2_SNSR_ST( )            | 0                                                 |    |    |    |    |
| EVT2_TEMP(°C)              | -40                                               |    |    |    |    |
| EVT2_TR_LOC                | Left Front                                        |    |    |    |    |
| EVT2_WRN_ST                | error                                             |    |    |    |    |
| EVT3_AGE_IGN( )            | 233                                               |    |    |    |    |
| EVT3_ODOMTR(km)            | 0.0                                               |    |    |    |    |
| EVT3_PRESS(kPa)            | 0.0                                               |    |    |    |    |
| EVT3_PRES_BP(kPa)          | 0.0                                               |    |    |    |    |
| EVT3_SNSR_ID( )            | 325                                               |    |    |    |    |
| EVT3_SNSR_ST( )            | 6E                                                |    |    |    |    |
| EVT3_TEMP(°C)              | -40                                               |    |    |    |    |
| EVT3_TR_LOC                | Left Front                                        |    |    |    |    |
| EVT3_WRN_ST                | Unknown                                           |    |    |    |    |
| EVT4_AGE_IGN( )            | 0                                                 |    |    |    |    |
| EVT4_ODOMTR(km)            | 65.0                                              |    |    |    |    |
| EVT4_PRESS(kPa)            | 0.0                                               |    |    |    |    |
| EVT4_PRES_BP(kPa)          | 0.0                                               |    |    |    |    |
| EVT4_SNSR_ID( )            | 0                                                 |    |    |    |    |
| EVT4_SNSR_ST( )            | 0                                                 |    |    |    |    |
| EVT4_TEMP(°C)              | -40                                               |    |    |    |    |
| EVT4_TR_LOC                | Left Front                                        |    |    |    |    |
| EVT4_WRN_ST                | Unknown                                           |    |    |    |    |
| EVT5_AGE_IGN( )            | 0                                                 |    |    |    |    |
| EVT5_ODOMTR(km)            | 0.0                                               |    |    |    |    |
| EVT5_PRESS(kPa)            | 0.0                                               |    |    |    |    |
| EVT5_PRES_BP(kPa)          | 0.0                                               |    |    |    |    |
| EVT5_SNSR_ID( )            | 0                                                 |    |    |    |    |
| EVT5_SNSR_ST( )            | 0                                                 |    |    |    |    |
| EVT5_TEMP(°C)              | -40                                               |    |    |    |    |
| EVT5_TR_LOC                | Left Front                                        |    |    |    |    |
| EVT5_WRN_ST                | Unknown                                           |    |    |    |    |
| GEN_SW_1                   | Not Pressed                                       |    |    |    |    |
| GEN_SW_2                   | Not Pressed                                       |    |    |    |    |
| GEN_SW_3                   | Not Pressed                                       |    |    |    |    |
| HAZARD_LP_SW               | Not Pressed                                       |    |    |    |    |
| HI_BEAM_LT                 | error                                             |    |    |    |    |
| HI_BEAM_RT                 | error                                             |    |    |    |    |
| HORN_RELAY                 | error                                             |    |    |    |    |
| HORN_SW                    | error                                             |    |    |    |    |
| IGN_ACC/RUN                | No Control                                        |    |    |    |    |
| IGN_R/A_INPT               | Inactive                                          |    |    |    |    |
| IGN_R/S_INPT               | Inactive                                          |    |    |    |    |
| IGN_RUN/STRT               | No Control                                        |    |    |    |    |
| IGN_ST_DEB                 | error                                             |    |    |    |    |
| IGN_ST_INPT                | Inactive                                          |    |    |    |    |
| IGN_SW_STATE               | Unknown                                           |    |    |    |    |
| INSFFS                     | Off                                               |    |    |    |    |
| INSI                       | Off                                               |    |    |    |    |
| INSRFS                     | Off                                               |    |    |    |    |
| KCS_DRVR                   | No Request                                        |    |    |    |    |
| KEYS_PROGMD( )             | 0                                                 |    |    |    |    |
| KEY_INHIBIT                | error                                             |    |    |    |    |
| KEY_IN_INFRD               | error                                             |    |    |    |    |
| KEY_IN_INPT                | Inactive                                          |    |    |    |    |
| KEY_IN_SW                  | error                                             |    |    |    |    |
| KEY_LRN_MODE               | error                                             |    |    |    |    |
| LAST_REM_RQST              | Unused                                            |    |    |    |    |
| LCK_DR_CRG                 | Locked                                            |    |    |    |    |
| LCK_DR_LF                  | Locked                                            |    |    |    |    |
| LCK_DR_LR                  | Locked                                            |    |    |    |    |
| LCK_DR_RF                  | Locked                                            |    |    |    |    |
| LCK_DR_RR                  | Locked                                            |    |    |    |    |
| LED_BACKLTG                | error                                             |    |    |    |    |
| LFTGATE_R_SW               | error                                             |    |    |    |    |
| LK_DOOR_LK_O               | No Control Active                                 |    |    |    |    |
| LK_SW_DRVR                 | No Request                                        |    |    |    |    |
| LOAD_SHED_OC               | error                                             |    |    |    |    |
| LOW_BEAM_LT                | On - VREG                                         |    |    |    |    |
| LOW_BEAM_RT                | error                                             |    |    |    |    |
| LOW_VOLT_SYS               | error                                             |    |    |    |    |
| LST_RKE_xMTR               | error                                             |    |    |    |    |
| MIN_KEYS_RQD( )            | 129                                               |    |    |    |    |
| ODDTC_BCM( )               | 129                                               |    |    |    |    |
| OPSW                       | Off                                               |    |    |    |    |
| OUT_CAB_LMP                | error                                             |    |    |    |    |
| OUT_CRASH                  | error                                             |    |    |    |    |
| OUT_CRG_LMP                | error                                             |    |    |    |    |
| OUT_DMD_LMP                | No Control                                        |    |    |    |    |
| OUT_FOG_LF                 | No Control                                        |    |    |    |    |
| OUT_FOG_RF                 | error                                             |    |    |    |    |
| OUT_LIPL_LMP               | No Control                                        |    |    |    |    |
| OUT_POS_LF                 | Position On                                       |    |    |    |    |
| OUT_POS_RF                 | No Control                                        |    |    |    |    |
| OUT_PRK_F                  | error                                             |    |    |    |    |
| OUT_PRK_R                  | error                                             |    |    |    |    |
| OUT_RUN                    | No Control                                        |    |    |    |    |
| PARK_BRK_SW                | Off                                               |    |    |    |    |
| PB_EN_DUR_MOT(s)           | 1153                                              |    |    |    |    |
| PCM_WKUP_CTRL              | error                                             |    |    |    |    |
| PK_BRK_ST                  | Off                                               |    |    |    |    |
| PLCRD_TP_BCK(kPa)          | 399.9                                             |    |    |    |    |
| PLCRD_TP_FRT(kPa)          | 220.6                                             |    |    |    |    |
| PUDL_SW_IN                 | error                                             |    |    |    |    |
| PWR_PT_RLY                 | error                                             |    |    |    |    |
| PWR_SUPPLY_A               | error                                             |    |    |    |    |
| PWR_SUPPLY_B               | No Control                                        |    |    |    |    |
| REALTIME(s)                | 1                                                 |    |    |    |    |
| REV_GEAR_SW                | Off                                               |    |    |    |    |
| RKE_BATT_LOW               | Off                                               |    |    |    |    |
| RSF1_ALARM                 | No                                                |    |    |    |    |
| RSF1_DISABLE               | No                                                |    |    |    |    |
| RSF1_HOOD                  | No                                                |    |    |    |    |
| RSF1_IGN                   | No                                                |    |    |    |    |
| RSF1_MAX_ST                | Yes                                               |    |    |    |    |
| RSF1_MIL_On                | No                                                |    |    |    |    |
| RSF1_OTHER                 | No                                                |    |    |    |    |
| RSF1_PARK                  | No                                                |    |    |    |    |
| RSF2_ALARM                 | No                                                |    |    |    |    |
| RSF2_DISABLE               | No                                                |    |    |    |    |
| RSF2_HOOD                  | No                                                |    |    |    |    |
| RSF2_IGN                   | No                                                |    |    |    |    |
| RSF2_MAX_ST                | No                                                |    |    |    |    |
| RSF2_MIL_On                | No                                                |    |    |    |    |
| RSF2_OTHER                 | No                                                |    |    |    |    |
| RSF2_PARK                  | Yes                                               |    |    |    |    |
| RSF3_ALARM                 | No                                                |    |    |    |    |
| RSF3_DISABLE               | No                                                |    |    |    |    |
| RSF3_HOOD                  | No                                                |    |    |    |    |
| RSF3_IGN                   | No                                                |    |    |    |    |
| RSF3_MAX_ST                | No                                                |    |    |    |    |
| RSF3_MIL_On                | No                                                |    |    |    |    |
| RSF3_OTHER                 | No                                                |    |    |    |    |
| RSF3_PARK                  | Yes                                               |    |    |    |    |
| RSF4_ALARM                 | No                                                |    |    |    |    |
| RSF4_DISABLE               | No                                                |    |    |    |    |
| RSF4_HOOD                  | No                                                |    |    |    |    |
| RSF4_IGN                   | No                                                |    |    |    |    |
| RSF4_MAX_ST                | No                                                |    |    |    |    |
| RSF4_MIL_On                | Yes                                               |    |    |    |    |
| RSF4_OTHER                 | Yes                                               |    |    |    |    |
| RSF4_PARK                  | No                                                |    |    |    |    |
| RS_REQ_AMKT_K              | No                                                |    |    |    |    |
| RS_REQ_N_RQST              | No                                                |    |    |    |    |
| RS_REQ_OEM_K               | No                                                |    |    |    |    |
| RS_TO_EXTND                | No                                                |    |    |    |    |
| RS_TO_NRML                 | No                                                |    |    |    |    |
| RVRS_LMPS                  | error                                             |    |    |    |    |
| SPAREKEY                   | ENABLE                                            |    |    |    |    |
| SS_IHBT_R_01               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_02               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_03               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_04               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_05               | TRUE                                              |    |    |    |    |
| SS_IHBT_R_06               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_07               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_08               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_09               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_10               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_11               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_12               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_13               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_14               | FALSE                                             |    |    |    |    |
| SS_IHBT_R_15               | FALSE                                             |    |    |    |    |
| START_STOP_1               | Inactive                                          |    |    |    |    |
| START_STOP_2               | Inactive                                          |    |    |    |    |
| STOP_LMP_CHM               | error                                             |    |    |    |    |
| THS_BEC_L                  | No                                                |    |    |    |    |
| THS_BEC_U                  | No                                                |    |    |    |    |
| THS_DR_LF_L                | No                                                |    |    |    |    |
| THS_DR_LF_U                | No                                                |    |    |    |    |
| THS_DR_RF_L                | No                                                |    |    |    |    |
| THS_DR_RF_U                | No                                                |    |    |    |    |
| TIC-01_OOSYNC              | Off                                               |    |    |    |    |
| TIC-02_OOSYNC              | Off                                               |    |    |    |    |
| TIC-03_OOSYNC              | Off                                               |    |    |    |    |
| TIC-04_OOSYNC              | Off                                               |    |    |    |    |
| TIC-05_OOSYNC              | Off                                               |    |    |    |    |
| TIC-06_OOSYNC              | Off                                               |    |    |    |    |
| TIC-07_OOSYNC              | Off                                               |    |    |    |    |
| TIC-08_OOSYNC              | Off                                               |    |    |    |    |
| TIC-09_OOSYNC              | Off                                               |    |    |    |    |
| TIC-10_OOSYNC              | Off                                               |    |    |    |    |
| TIC-NONE_OOS               | Off                                               |    |    |    |    |
| TIC_01_BCM( )              | 0                                                 |    |    |    |    |
| TIC_03_BCM( )              | 0                                                 |    |    |    |    |
| TIC_04_BCM( )              | 0                                                 |    |    |    |    |
| TIC_07_BCM( )              | 0                                                 |    |    |    |    |
| TIC_08_BCM( )              | 0                                                 |    |    |    |    |
| TIC_09_BCM( )              | 0                                                 |    |    |    |    |
| TIC_10_BCM( )              | 0                                                 |    |    |    |    |
| TIC_LAST_BC( )             | 0                                                 |    |    |    |    |
| TIME_BAT_RFRSH(s)          | 0                                                 |    |    |    |    |
| TIME_CHG_EOR(s)            | 0                                                 |    |    |    |    |
| TPMS_STATUS                | Unknown Status                                    |    |    |    |    |
| TPM_HITS_LF( )             | 0                                                 |    |    |    |    |
| TPM_HITS_LRI( )            | 0                                                 |    |    |    |    |
| TPM_HITS_LRO( )            | 0                                                 |    |    |    |    |
| TPM_HITS_RF( )             | 1857                                              |    |    |    |    |
| TPM_HITS_RRI( )            | 0                                                 |    |    |    |    |
| TPM_HITS_RRO( )            | 0                                                 |    |    |    |    |
| TPM_L_PRESS(kPa)           | 1419.3                                            |    |    |    |    |
| TPM_L_SR_CS( )             | 0                                                 |    |    |    |    |
| TPM_L_SR_ID( )             | 7F70FCF0                                          |    |    |    |    |
| TPM_L_STAT( )              | 0                                                 |    |    |    |    |
| TPM_L_TEMP(°C)             | 132                                               |    |    |    |    |
| TPM_MOTION_S               | error                                             |    |    |    |    |
| TPM_MSG_LF( )              | 18                                                |    |    |    |    |
| TPM_MSG_LRI( )             | 40                                                |    |    |    |    |
| TPM_MSG_LRO( )             | 0                                                 |    |    |    |    |
| TPM_MSG_RF( )              | 1283                                              |    |    |    |    |
| TPM_MSG_RRI( )             | 791                                               |    |    |    |    |
| TPM_MSG_RRO( )             | 0                                                 |    |    |    |    |
| TPM_PRES_LF(kPa)           | 0.3                                               |    |    |    |    |
| TPM_PRES_LRI(kPa)          | 0.0                                               |    |    |    |    |
| TPM_PRES_LRO(kPa)          | 0.3                                               |    |    |    |    |
| TPM_PRES_RF(kPa)           | 0.3                                               |    |    |    |    |
| TPM_PRES_RRI(kPa)          | 0.3                                               |    |    |    |    |
| TPM_PRES_RRO(kPa)          | 1.7                                               |    |    |    |    |
| TPM_PWM_FL(kPa)            | 0.0                                               |    |    |    |    |
| TPM_PWM_FR(kPa)            | 0.3                                               |    |    |    |    |
| TPM_PWM_IRL(kPa)           | 0.0                                               |    |    |    |    |
| TPM_PWM_IRR(kPa)           | 0.0                                               |    |    |    |    |
| TPM_PWM_RL(kPa)            | 0.3                                               |    |    |    |    |
| TPM_PWM_RR(kPa)            | 0.0                                               |    |    |    |    |
| TPM_S_ID_LF( )             | A040000                                           |    |    |    |    |
| TPM_S_ID_LRI( )            | 3                                                 |    |    |    |    |
| TPM_S_ID_LRO( )            | 0                                                 |    |    |    |    |
| TPM_S_ID_RF( )             | 64                                                |    |    |    |    |
| TPM_S_ID_RRI( )            | 3F                                                |    |    |    |    |
| TPM_S_ID_RRO( )            | 0                                                 |    |    |    |    |
| TPM_WRN_LMP                | OFF                                               |    |    |    |    |
| TRN_LMP_LF                 | Active                                            |    |    |    |    |
| TRN_LMP_LR                 | error                                             |    |    |    |    |
| TRN_LMP_RF                 | error                                             |    |    |    |    |
| TRN_LMP_RR                 | error                                             |    |    |    |    |
| TRN_SIG_SW_L               | Off                                               |    |    |    |    |
| TRN_SIG_SW_R               | Off                                               |    |    |    |    |
| UNL_KEY_MODE               | Enable                                            |    |    |    |    |
| VBAT_B_V(V)                | 6.00                                              |    |    |    |    |
| VBAT_C_V(V)                | 6.00                                              |    |    |    |    |
| VBAT_D_V(V)                | 6.00                                              |    |    |    |    |
| VBAT_E_V(V)                | 6.00                                              |    |    |    |    |
| VEHICLE_MODE               | Normal                                            |    |    |    |    |
| VSS(km/h)                  | 0.0                                               |    |    |    |    |

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| ACC_FA_SW_LED              | OFF                                               |    |    |    |    |
| ACC_FA_SW_POS              | OFF                                               |    |    |    |    |
| ACC_FLC_HTR_DRV            | OFF                                               |    |    |    |    |
| ACC_HI_TONE                | OFF                                               |    |    |    |    |
| ACC_HUD_LED_R              | OFF                                               |    |    |    |    |
| ACC_LO_TONE                | OFF                                               |    |    |    |    |
| ACC_YAW_OVR                | OFF                                               |    |    |    |    |
| ALGN_CONV                  | notOK                                             |    |    |    |    |
| ALGN_OFF(°)                | 0.00                                              |    |    |    |    |
| ALGN_STATE                 | Off                                               |    |    |    |    |
| ALGN_STATUS                | OK                                                |    |    |    |    |
| C-CM_CALIB                 | Not Calibrating                                   |    |    |    |    |
| CCM_DIAGSTATE              | error                                             |    |    |    |    |
| FACT_HORIZONT(m)           | 0                                                 |    |    |    |    |
| FACT_MIR_TARG(m)           | 0                                                 |    |    |    |    |
| FACT_RADR_MIR(m)           | 0                                                 |    |    |    |    |
| FACT_VERTICAL(m)           | 0                                                 |    |    |    |    |
| FASC_ATTENUTN( )           | 0                                                 |    |    |    |    |
| FLR_HTR_RLY                | Off                                               |    |    |    |    |
| GLOBTIM(s)                 | 0                                                 |    |    |    |    |
| HUD_LED1                   | Off                                               |    |    |    |    |
| HUD_LED2                   | Off                                               |    |    |    |    |
| NUM_SRV_REQ( )             | 0                                                 |    |    |    |    |
| PRI_TGT_ANG(°)             | 0.00                                              |    |    |    |    |
| PRI_TGT_PWR( )             | 0                                                 |    |    |    |    |
| PRI_TGT_RANGE(m)           | 8                                                 |    |    |    |    |
| PRI_TGT_RATE(m)            | 151                                               |    |    |    |    |
| PRI_TGT_RATE(km/h)         | 0.0                                               |    |    |    |    |
| RSVA(°)                    | 0.00                                              |    |    |    |    |
| SRV_ALGN_UPD_RQ( )         | 0                                                 |    |    |    |    |
| TGT_MNT_OFF(mm)            | 8050.0                                            |    |    |    |    |
| VERTICAL_ALIGN(°)          | 36.60                                             |    |    |    |    |
| YAW_RATE(1/min)            | 0                                                 |    |    |    |    |


| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| CORRUPT_CNT( )             | 0                                                 |    |    |    |    |
| DIAG_SESSION               | error                                             |    |    |    |    |
| ILL_OP_CNT( )              | 0                                                 |    |    |    |    |
| LOOP_OF_CNT( )             | 0                                                 |    |    |    |    |
| MIN_IDLE( )                | 0                                                 |    |    |    |    |
| PWR_CNT( )                 | 0                                                 |    |    |    |    |
| SELFTEST_DTC( )            | 0                                                 |    |    |    |    |
| STACK_OF_CNT( )            | 0                                                 |    |    |    |    |
| WDG_RST_CNT( )             | 0                                                 |    |    |    |    |
| AC_STATUS                  | ON                                                |    |    |    |    |
| AIDP(%)                    | 0.00                                              |    |    |    |    |
| AIR_MODE_DPOS(%)           | 0.00                                              |    |    |    |    |
| AUXH_CL_DV                 | Disabled                                          |    |    |    |    |
| BLOWRSPD(%)                | 0.00                                              |    |    |    |    |
| BLOWRSPD(%)                | 0.00                                              |    |    |    |    |
| BLWR_RL_FRNT               | On                                                |    |    |    |    |
| CC_I2_MD                   | Off                                               |    |    |    |    |
| CC_SW_AC                   | Inactive                                          |    |    |    |    |
| CC_SW_OFF                  | Inactive                                          |    |    |    |    |
| CC_SW_RECIR                | Inactive                                          |    |    |    |    |
| CTS_FAN                    | OFF                                               |    |    |    |    |
| DIMSWIN                    | COURTESY                                          |    |    |    |    |
| ENG_CL_DV                  | Disabled                                          |    |    |    |    |
| EVAPORATOR_TEMPERATURE(°C) | -40                                               |    |    |    |    |
| ExtTemp(°C)                | -40                                               |    |    |    |    |
| FRONT_TEMP( )              | 0                                                 |    |    |    |    |
| GLOBTIM(s)                 | 429496699                                         |    |    |    |    |
| HEAT_CSM_SET               | Not equipped                                      |    |    |    |    |
| HEAT_FRONT_SCR             | OFF                                               |    |    |    |    |
| HEAT_WASHER                | OFF                                               |    |    |    |    |
| HEAT_WIPER                 | Disabled                                          |    |    |    |    |
| HEVAC_LIN                  | OFF                                               |    |    |    |    |
| HVAC_STATE                 | Undefined                                         |    |    |    |    |
| IAMT(°C)                   | -40                                               |    |    |    |    |
| INCARTMP(°C)               | -40                                               |    |    |    |    |
| IN_AIR_POLL                | Not Detected                                      |    |    |    |    |
| KEYST                      | Key Out                                           |    |    |    |    |
| LBLND_DR(%)                | 0.00                                              |    |    |    |    |
| LF_DIS_FLR_T(°C)           | -40                                               |    |    |    |    |
| LF_DIS_PAN_T(°C)           | -40                                               |    |    |    |    |
| LIN_PWR                    | OFF                                               |    |    |    |    |
| L_SEAT_HEAT                | OFF                                               |    |    |    |    |
| MAGNETIC_VALVE             | OFF                                               |    |    |    |    |
| MAINECUV(V)                | 12.50                                             |    |    |    |    |
| NOTCSDTDT( )               | 4                                                 |    |    |    |    |
| OUTTMP(°C)                 | -40                                               |    |    |    |    |
| POLL_SEN                   | OFF                                               |    |    |    |    |
| PTC_HEAT_RL#1              | OFF                                               |    |    |    |    |
| PTC_HEAT_RL#2              | OFF                                               |    |    |    |    |
| PTC_HEAT_RL#3              | OFF                                               |    |    |    |    |
| PTC_HTR_DC(%)              | 0.00                                              |    |    |    |    |
| REAR_DEFR                  | OFF                                               |    |    |    |    |
| REAR_LED#1                 | OFF                                               |    |    |    |    |
| REAR_LED#2                 | OFF                                               |    |    |    |    |
| REAR_LED#3                 | OFF                                               |    |    |    |    |
| REL_HUMI(%)                | -34.67                                            |    |    |    |    |
| RL_SEAT_HEAT               | OFF                                               |    |    |    |    |
| RR_SEAT_HEAT               | OFF                                               |    |    |    |    |
| R_BLR_RELAY                | OFF                                               |    |    |    |    |
| SW_AUTO                    | OFF                                               |    |    |    |    |
| SW_AUTO_HOLD               | OFF                                               |    |    |    |    |
| SW_AUTO_PARK               | OFF                                               |    |    |    |    |
| SW_CAMERA                  | OFF                                               |    |    |    |    |
| SW_DEFR                    | OFF                                               |    |    |    |    |
| SW_DR_CSEAT                | OFF                                               |    |    |    |    |
| SW_DR_HSEAT                | OFF                                               |    |    |    |    |
| SW_DR_TEMP+                | OFF                                               |    |    |    |    |
| SW_DR_TEMP-                | OFF                                               |    |    |    |    |
| SW_DZ_HVAC                 | OFF                                               |    |    |    |    |
| SW_ECO_MODE                | OFF                                               |    |    |    |    |
| SW_FAN+                    | OFF                                               |    |    |    |    |
| SW_FAN-                    | OFF                                               |    |    |    |    |
| SW_FLR                     | OFF                                               |    |    |    |    |
| SW_FLR_DEFR                | OFF                                               |    |    |    |    |
| SW_FRONT_PA                | OFF                                               |    |    |    |    |
| SW_HF_WIN                  | OFF                                               |    |    |    |    |
| SW_MAX_AC                  | OFF                                               |    |    |    |    |
| SW_MODE                    | OFF                                               |    |    |    |    |
| SW_PANE                    | OFF                                               |    |    |    |    |
| SW_PAN_FLR                 | OFF                                               |    |    |    |    |
| SW_PARK_AID                | OFF                                               |    |    |    |    |
| SW_PARK_ASSIT              | OFF                                               |    |    |    |    |
| SW_PN_FL_MIX               | OFF                                               |    |    |    |    |
| SW_PS_CSEAT                | OFF                                               |    |    |    |    |
| SW_PS_HSEAT                | OFF                                               |    |    |    |    |
| SW_PS_TEMP+                | OFF                                               |    |    |    |    |
| SW_PS_TEMP-                | OFF                                               |    |    |    |    |
| SW_RAUTOC                  | OFF                                               |    |    |    |    |
| SW_RFAN+                   | OFF                                               |    |    |    |    |
| SW_RFAN-                   | OFF                                               |    |    |    |    |
| SW_RHVAC                   | OFF                                               |    |    |    |    |
| SW_RPWR                    | OFF                                               |    |    |    |    |
| SW_RTEMP+                  | OFF                                               |    |    |    |    |
| SW_RTEMP-                  | OFF                                               |    |    |    |    |
| SW_R_DEFR                  | OFF                                               |    |    |    |    |
| SW_SNOW_PLOW               | OFF                                               |    |    |    |    |
| SW_STOP_START              | OFF                                               |    |    |    |    |
| S_HEAT_RT_CCO              | Off                                               |    |    |    |    |
| VPWR(V)                    | 0.30                                              |    |    |    |    |
| WATER_PUMP                 | OFF                                               |    |    |    |    |

## IPC

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| ABS_LAMP                   | Off                                               |    |    |    |    |
| AIRBAG_LAMP                | Off                                               |    |    |    |    |
| AVG_FUEL_C(L/100km)        | 61.4                                              |    |    |    |    |
| BRK_LAMP                   | Off                                               |    |    |    |    |
| CRUISE                     | Off                                               |    |    |    |    |
| DEF_LEVEL(%)               | 0.00                                              |    |    |    |    |
| DIAG_VER                   | error                                             |    |    |    |    |
| DTE_CALC(km)               | 409.6                                             |    |    |    |    |
| DTE_DISP(km)               | 0.0                                               |    |    |    |    |
| ENGCOOLNT(%)               | 0.00                                              |    |    |    |    |
| FUELLEVEL(%)               | 0.00                                              |    |    |    |    |
| FUELLVL1( )                | 56565                                             |    |    |    |    |
| FUELLVL2( )                | 47616                                             |    |    |    |    |
| HEBEV_HAZ_LMP              | On                                                |    |    |    |    |
| HILL_DESNT_SW              | RELEASED                                          |    |    |    |    |
| IC_STATE                   | error                                             |    |    |    |    |
| INT_TRIP_SW                | Off                                               |    |    |    |    |
| IS_AS_WUP                  | Inactive                                          |    |    |    |    |
| IS_AUX_KEYP                | Inactive                                          |    |    |    |    |
| IS_BATT                    | OFF                                               |    |    |    |    |
| IS_BLT_CHM                 | No                                                |    |    |    |    |
| IS_BLT_IND                 | No                                                |    |    |    |    |
| IS_BPW                     | OFF                                               |    |    |    |    |
| IS_CRANK                   | Inactive                                          |    |    |    |    |
| IS_EPB                     | OFF                                               |    |    |    |    |
| IS_FNC_CHK                 | OFF                                               |    |    |    |    |
| IS_FOG_F                   | OFF                                               |    |    |    |    |
| IS_FOG_R                   | OFF                                               |    |    |    |    |
| IS_FPA_CHM                 | Active                                            |    |    |    |    |
| IS_HSW                     | Not Pressed                                       |    |    |    |    |
| IS_IGN                     | OFF                                               |    |    |    |    |
| IS_IRQ                     | OFF                                               |    |    |    |    |
| IS_LO_BFL                  | OFF                                               |    |    |    |    |
| IS_LO_CLT                  | OFF                                               |    |    |    |    |
| IS_LO_OIL_L                | OFF                                               |    |    |    |    |
| IS_LO_OIL_P                | OFF                                               |    |    |    |    |
| IS_LO_WS                   | OFF                                               |    |    |    |    |
| IS_MUL_IN                  | OFF                                               |    |    |    |    |
| IS_OCCUP                   | OFF                                               |    |    |    |    |
| IS_PBA                     | Inactive                                          |    |    |    |    |
| IS_PS_PD                   | TRUE                                              |    |    |    |    |
| IS_SPARE1                  | OFF                                               |    |    |    |    |
| IS_SPARE2                  | OFF                                               |    |    |    |    |
| IS_SV1                     | OFF                                               |    |    |    |    |
| IS_SV2                     | OFF                                               |    |    |    |    |
| IS_TCH_PWR                 | Inactive                                          |    |    |    |    |
| IS_TR_EX                   | OFF                                               |    |    |    |    |
| IS_WRN_CHM                 | No                                                |    |    |    |    |
| LMP_4WD                    | OFF                                               |    |    |    |    |
| LMP_4WD_AU                 | OFF                                               |    |    |    |    |
| LMP_4WD_HI                 | OFF                                               |    |    |    |    |
| LMP_4WD_LO                 | OFF                                               |    |    |    |    |
| LMP_ABS                    | OFF                                               |    |    |    |    |
| LMP_ACC                    | OFF                                               |    |    |    |    |
| LMP_AFL_FLT                | OFF                                               |    |    |    |    |
| LMP_AF_T                   | OFF                                               |    |    |    |    |
| LMP_AHD                    | OFF                                               |    |    |    |    |
| LMP_ALARM                  | OFF                                               |    |    |    |    |
| LMP_ALL                    | OFF                                               |    |    |    |    |
| LMP_ARC                    | OFF                                               |    |    |    |    |
| LMP_ARC_R                  | OFF                                               |    |    |    |    |
| LMP_ASLD                   | OFF                                               |    |    |    |    |
| LMP_AUDIO                  | Inactive                                          |    |    |    |    |
| LMP_BELT                   | OFF                                               |    |    |    |    |
| LMP_BSDS                   | OFF                                               |    |    |    |    |
| LMP_BT_TR                  | OFF                                               |    |    |    |    |
| LMP_CHARGE                 | OFF                                               |    |    |    |    |
| LMP_CITY                   | OFF                                               |    |    |    |    |
| LMP_DIR_L                  | OFF                                               |    |    |    |    |
| LMP_DIR_R                  | OFF                                               |    |    |    |    |
| LMP_DIS_PH                 | OFF                                               |    |    |    |    |
| LMP_DIS_PH2                | OFF                                               |    |    |    |    |
| LMP_DOOR                   | OFF                                               |    |    |    |    |
| LMP_DPF                    | OFF                                               |    |    |    |    |
| LMP_DSC_OFF                | OFF                                               |    |    |    |    |
| LMP_DSC_TC                 | OFF                                               |    |    |    |    |
| LMP_EB_FLT                 | OFF                                               |    |    |    |    |
| LMP_ECO_SS                 | OFF                                               |    |    |    |    |
| LMP_ELOCK                  | OFF                                               |    |    |    |    |
| LMP_EMS_FL                 | OFF                                               |    |    |    |    |
| LMP_EPAS                   | OFF                                               |    |    |    |    |
| LMP_FBH                    | OFF                                               |    |    |    |    |
| LMP_FCO                    | OFF                                               |    |    |    |    |
| LMP_FOG_F                  | OFF                                               |    |    |    |    |
| LMP_FOG_R                  | OFF                                               |    |    |    |    |
| LMP_GEN_A                  | OFF                                               |    |    |    |    |
| LMP_GEN_R                  | OFF                                               |    |    |    |    |
| LMP_GPLG                   | OFF                                               |    |    |    |    |
| LMP_HDC                    | OFF                                               |    |    |    |    |
| LMP_HDC_FLT                | OFF                                               |    |    |    |    |
| LMP_HEV_HZL                | Inactive                                          |    |    |    |    |
| LMP_HEV_RDL                | Inactive                                          |    |    |    |    |
| LMP_HI_BM                  | OFF                                               |    |    |    |    |
| LMP_HI_ECT                 | OFF                                               |    |    |    |    |
| LMP_HLA                    | OFF                                               |    |    |    |    |
| LMP_LDW                    | OFF                                               |    |    |    |    |
| LMP_LIGHTS                 | OFF                                               |    |    |    |    |
| LMP_LO_AF                  | OFF                                               |    |    |    |    |
| LMP_LO_CLT                 | OFF                                               |    |    |    |    |
| LMP_LO_FUEL                | OFF                                               |    |    |    |    |
| LMP_LO_GEAR                | OFF                                               |    |    |    |    |
| LMP_LO_OIL_L               | OFF                                               |    |    |    |    |
| LMP_LO_OIL_P               | OFF                                               |    |    |    |    |
| LMP_LO_WASH                | OFF                                               |    |    |    |    |
| LMP_MC_A                   | OFF                                               |    |    |    |    |
| LMP_MC_R                   | OFF                                               |    |    |    |    |
| LMP_MIL                    | OFF                                               |    |    |    |    |
| LMP_OD_CCL                 | OFF                                               |    |    |    |    |
| LMP_OIL_SRV                | OFF                                               |    |    |    |    |
| LMP_PAD                    | OFF                                               |    |    |    |    |
| LMP_PAE                    | OFF                                               |    |    |    |    |
| LMP_PF_SH                  | OFF                                               |    |    |    |    |
| LMP_PRK_BRK                | OFF                                               |    |    |    |    |
| LMP_PW_BS_A                | OFF                                               |    |    |    |    |
| LMP_PW_BS_R                | OFF                                               |    |    |    |    |
| LMP_SAU_OS                 | OFF                                               |    |    |    |    |
| LMP_SCL_WRN                | OFF                                               |    |    |    |    |
| LMP_SD_TT                  | Inactive                                          |    |    |    |    |
| LMP_SL_WRN                 | OFF                                               |    |    |    |    |
| LMP_SO_WIF                 | OFF                                               |    |    |    |    |
| LMP_SPORT                  | OFF                                               |    |    |    |    |
| LMP_SRS                    | OFF                                               |    |    |    |    |
| LMP_SS_A                   | OFF                                               |    |    |    |    |
| LMP_SS_R                   | OFF                                               |    |    |    |    |
| LMP_SV1                    | OFF                                               |    |    |    |    |
| LMP_SV2                    | OFF                                               |    |    |    |    |
| LMP_TBS                    | OFF                                               |    |    |    |    |
| LMP_TC_OFF                 | OFF                                               |    |    |    |    |
| LMP_TPMS_A                 | OFF                                               |    |    |    |    |
| LMP_TPMS_R                 | OFF                                               |    |    |    |    |
| LMP_TRAIL                  | OFF                                               |    |    |    |    |
| LMP_TR_FL_A                | OFF                                               |    |    |    |    |
| LMP_TR_FL_R                | OFF                                               |    |    |    |    |
| LMP_TR_TEMP                | OFF                                               |    |    |    |    |
| LMP_UPSHFT                 | OFF                                               |    |    |    |    |
| MAINTLMP                   | Off                                               |    |    |    |    |
| MIL                        | Inactive                                          |    |    |    |    |
| MODULE_VOLT(V)             | 0.00                                              |    |    |    |    |
| ODOMETER(km)               | 0.0                                               |    |    |    |    |
| RIL                        | Inactive                                          |    |    |    |    |
| RUN_AFC_DTE(L/100km)       | 0.0                                               |    |    |    |    |
| SELFTEST_DTC( )            | 0                                                 |    |    |    |    |
| SERV_ENG_LMP               | Off                                               |    |    |    |    |
| SOFT_VER                   | error                                             |    |    |    |    |
| SPDOMETER(%)               | 0.00                                              |    |    |    |    |
| STAB_CTRL_SW               | RELEASED                                          |    |    |    |    |
| STC_ABS                    | OK                                                |    |    |    |    |
| STC_ACC                    | OK                                                |    |    |    |    |
| STC_ADHL                   | OK                                                |    |    |    |    |
| STC_ADHL2                  | OK                                                |    |    |    |    |
| STC_AHC                    | OK                                                |    |    |    |    |
| STC_AHD                    | OK                                                |    |    |    |    |
| STC_AHL                    | OK                                                |    |    |    |    |
| STC_AHR                    | OK                                                |    |    |    |    |
| STC_AL                     | OK                                                |    |    |    |    |
| STC_ALTTLD                 | OK                                                |    |    |    |    |
| STC_ARBG                   | OK                                                |    |    |    |    |
| STC_ASLD                   | OK                                                |    |    |    |    |
| STC_ASP                    | OK                                                |    |    |    |    |
| STC_AWS                    | OK                                                |    |    |    |    |
| STC_BWS                    | OK                                                |    |    |    |    |
| STC_CCD                    | OK                                                |    |    |    |    |
| STC_CMB                    | OK                                                |    |    |    |    |
| STC_DBL                    | OK                                                |    |    |    |    |
| STC_EBA                    | OK                                                |    |    |    |    |
| STC_ECALL                  | OK                                                |    |    |    |    |
| STC_EPAS                   | OK                                                |    |    |    |    |
| STC_EPB                    | OK                                                |    |    |    |    |
| STC_EPB2                   | OK                                                |    |    |    |    |
| STC_EPS                    | OK                                                |    |    |    |    |
| STC_ESP                    | OK                                                |    |    |    |    |
| STC_FCW                    | OK                                                |    |    |    |    |
| STC_FUEL                   | OK                                                |    |    |    |    |
| STC_HDC                    | OK                                                |    |    |    |    |
| STC_HEV                    | OK                                                |    |    |    |    |
| STC_HSA                    | OK                                                |    |    |    |    |
| STC_LDW                    | OK                                                |    |    |    |    |
| STC_LKA                    | OK                                                |    |    |    |    |
| STC_LKAB                   | OK                                                |    |    |    |    |
| STC_LKAS                   | OK                                                |    |    |    |    |
| STC_PRET                   | OK                                                |    |    |    |    |
| STC_RHCS                   | OK                                                |    |    |    |    |
| STC_ROP                    | Error                                             |    |    |    |    |
| STC_SAPP                   | OK                                                |    |    |    |    |
| STC_SBL                    | OK                                                |    |    |    |    |
| STC_SODAS                  | OK                                                |    |    |    |    |
| STC_SPS                    | OK                                                |    |    |    |    |
| STC_TC                     | OK                                                |    |    |    |    |
| STC_TPMS                   | OK                                                |    |    |    |    |
| TACH_IND(%)                | 0.00                                              |    |    |    |    |
| TBC_STAT                   | Inactive                                          |    |    |    |    |
| TC/IVD/RSC                 | Inactive                                          |    |    |    |    |
| TPMS                       | Inactive                                          |    |    |    |    |
| W_ABS                      | Inactive                                          |    |    |    |    |
| W_ABS_F                    | Inactive                                          |    |    |    |    |
| W_AIR_FILTR                | Inactive                                          |    |    |    |    |
| W_AWD_OFF                  | Active                                            |    |    |    |    |
| W_BLIND_SPOT               | Inactive                                          |    |    |    |    |
| W_BRAKE                    | Inactive                                          |    |    |    |    |
| W_BR_FL_LOW                | Inactive                                          |    |    |    |    |
| W_BR_PD_WR                 | Inactive                                          |    |    |    |    |
| W_BULB_FAIL                | Inactive                                          |    |    |    |    |
| W_CC                       | Inactive                                          |    |    |    |    |
| W_CHRG                     | Inactive                                          |    |    |    |    |
| W_CITY_SAFETY              | Inactive                                          |    |    |    |    |
| W_DEF_CONT                 | Inactive                                          |    |    |    |    |
| W_DEF_LOW                  | Inactive                                          |    |    |    |    |
| W_DIESL_EX                 | Inactive                                          |    |    |    |    |
| W_DIESL_F_CL               | Active                                            |    |    |    |    |
| W_DIESL_I_SD               | Inactive                                          |    |    |    |    |
| W_DIESL_PHT                | Inactive                                          |    |    |    |    |
| W_DIESL_WM                 | Inactive                                          |    |    |    |    |
| W_DIESL_WTR                | Inactive                                          |    |    |    |    |
| W_EPB                      | Inactive                                          |    |    |    |    |
| W_FUELFL_IN                | Inactive                                          |    |    |    |    |
| W_FUEL_CAP                 | Inactive                                          |    |    |    |    |
| W_FUEL_DR_AJ               | Inactive                                          |    |    |    |    |
| W_FWD_COLL                 | Active                                            |    |    |    |    |
| W_GPF                      | Inactive                                          |    |    |    |    |
| W_HILLDESC_IC              | Inactive                                          |    |    |    |    |
| W_HILL_STRT                | Inactive                                          |    |    |    |    |
| W_LANE_DEPART              | Inactive                                          |    |    |    |    |
| W_LOW_FUEL                 | Inactive                                          |    |    |    |    |
| W_LOW_WASH                 | Inactive                                          |    |    |    |    |
| W_LW_OL_PRS                | Inactive                                          |    |    |    |    |
| W_OVR_TMP                  | Inactive                                          |    |    |    |    |
| W_PARK_AID                 | Active                                            |    |    |    |    |
| W_PEPS                     | Inactive                                          |    |    |    |    |
| W_PWERTRAIN                | Inactive                                          |    |    |    |    |
| W_REDCTNT_L                | Inactive                                          |    |    |    |    |
| W_SBLT                     | Inactive                                          |    |    |    |    |
| W_SERV_STEER               | Inactive                                          |    |    |    |    |
| W_STPSTRT_IC               | Inactive                                          |    |    |    |    |
| W_STRT_STP                 | Inactive                                          |    |    |    |    |
| W_SUSP                     | Inactive                                          |    |    |    |    |
| W_TC/IVD/RSC               | Inactive                                          |    |    |    |    |
| W_THFT                     | Inactive                                          |    |    |    |    |

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| CORRUPT_CNT( )             | 129                                               |    |    |    |    |
| EVNT_TRIGER                | No Trigger                                        |    |    |    |    |
| FCAD_PITCH_A(°)            | 0.25                                              |    |    |    |    |
| FCAD_ROLL_A(°)             | 0.00                                              |    |    |    |    |
| FCAD_YAW_A(°)              | 0.00                                              |    |    |    |    |
| ILL_OP_CNT( )              | 0                                                 |    |    |    |    |
| IPMA_FD07( )               | 0                                                 |    |    |    |    |
| IPMA_STATE                 | Undefined                                         |    |    |    |    |
| LA_SW_STA                  | Not Pressed                                       |    |    |    |    |
| LOOP_OF_CNT( )             | 4                                                 |    |    |    |    |
| MIN_IDLE( )                | 0                                                 |    |    |    |    |
| POWER_CNT( )               | 10                                                |    |    |    |    |
| SPCPC(%)                   | 37.25                                             |    |    |    |    |
| STACK_OF_CNT( )            | 0                                                 |    |    |    |    |
| SW_NUM( )                  | 82                                                |    |    |    |    |
| TOTAL_DIST(km)             | 1383.0                                            |    |    |    |    |
| WDG_RST_CNT( )             | 0                                                 |    |    |    |    |
| WSH_HT_STA                 | Short to Ground Detected - Off                    |    |    |    |    |
| YAW_RATE(1/min)            | 0                                                 |    |    |    |    |
| AAT(°C)                    | -40                                               |    |    |    |    |
| BARO(kPa)                  | 0.0                                               |    |    |    |    |
| CATEMP11(°C)               | 21                                                |    |    |    |    |
| CATEMP21(°C)               | 370                                               |    |    |    |    |
| ECT(°C)                    | 17                                                |    |    |    |    |
| EQ_RAT(%)                  | 0.00                                              |    |    |    |    |
| EQ_RAT11( )                | 0                                                 |    |    |    |    |
| EQ_RAT21( )                | 0                                                 |    |    |    |    |
| EVAP_PCT(%)                | 0.00                                              |    |    |    |    |
| EVAP_VP(kPa)               | 0.0                                               |    |    |    |    |
| FLI(%)                     | 0.00                                              |    |    |    |    |
| FRP(kPa)                   | 565650.0                                          |    |    |    |    |
| FUELSYS1                   | error                                             |    |    |    |    |
| FUELSYS2                   | error                                             |    |    |    |    |
| GP_LMP_STAT                | Off                                               |    |    |    |    |
| IAT(°C)                    | -40                                               |    |    |    |    |
| LOAD_ABS(%)                | 0.00                                              |    |    |    |    |
| LOAD_PCT(%)                | 8.63                                              |    |    |    |    |
| LONGFT1(%)                 | 60.16                                             |    |    |    |    |
| LONGFT12(%)                | -100.00                                           |    |    |    |    |
| LONGFT2(%)                 | -21.88                                            |    |    |    |    |
| MAP(kPa)                   | 0.0                                               |    |    |    |    |
| MIL_DIST(km)               | 0.0                                               |    |    |    |    |
| O2S11(mA)                  | -128.00                                           |    |    |    |    |
| O2S12(V)                   | 0.00                                              |    |    |    |    |
| O2S21(mA)                  | -128.00                                           |    |    |    |    |
| O2S22(V)                   | 0.00                                              |    |    |    |    |
| O2S22.STFT(%)              | -100.00                                           |    |    |    |    |
| OBDSUP                     | error                                             |    |    |    |    |
| PTO_STAT                   | Off                                               |    |    |    |    |
| PTO_STAT                   | Off                                               |    |    |    |    |
| RPM(1/min)                 | 0                                                 |    |    |    |    |
| RUNTM(s)                   | 0                                                 |    |    |    |    |
| SHRTFT1(%)                 | -91.41                                            |    |    |    |    |
| SHRTFT2(%)                 | -90.63                                            |    |    |    |    |
| SPARKADV(°)                | 63.50                                             |    |    |    |    |
| TAC_PCT(%)                 | 0.00                                              |    |    |    |    |
| TP(%)                      | 0.00                                              |    |    |    |    |
| TP_D(%)                    | 26.27                                             |    |    |    |    |
| TP_E(%)                    | 0.00                                              |    |    |    |    |
| TP_R(%)                    | 13.73                                             |    |    |    |    |
| TQ_ENGREF(Nm)              | 0.0                                               |    |    |    |    |
| TQ_PCT_ACT(%)              | -119.00                                           |    |    |    |    |
| VPWR(V)                    | 0.08                                              |    |    |    |    |
| VSS(km/h)                  | 0.0                                               |    |    |    |    |

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| ABORT_2ndLATEST            | No Abort                                          |    |    |    |    |
| ABORT_3rdLATEST            | No Abort                                          |    |    |    |    |
| ABORT_4thLATEST            | No Abort                                          |    |    |    |    |
| ABORT_5thLATEST            | No Abort                                          |    |    |    |    |
| ABORT_LATEST               | error                                             |    |    |    |    |
| AUTO_OFF                   | Inactive                                          |    |    |    |    |
| CORRUPT_CNT( )             | 0                                                 |    |    |    |    |
| ECU_VPWR(V)                | 0.00                                              |    |    |    |    |
| FLT_COND                   | No                                                |    |    |    |    |
| FNT_SENS                   | Inactive                                          |    |    |    |    |
| FRT_CONFIG                 | No                                                |    |    |    |    |
| F_TONE_STAT                | Inactive                                          |    |    |    |    |
| ILL_OP_CNT( )              | 0                                                 |    |    |    |    |
| LFI_DIST(m)                | 0                                                 |    |    |    |    |
| LFO_DIST(m)                | 1                                                 |    |    |    |    |
| LOOP_OF_CNT( )             | 0                                                 |    |    |    |    |
| LRI_DIST(m)                | 2                                                 |    |    |    |    |
| LRO_DIST(m)                | 0                                                 |    |    |    |    |
| MIN_IDLE( )                | 0                                                 |    |    |    |    |
| MUTE_STAT                  | Inactive                                          |    |    |    |    |
| PAM_LED_HI                 | Inactive                                          |    |    |    |    |
| PAM_SW_ST                  | Off                                               |    |    |    |    |
| PAM_Status                 | error                                             |    |    |    |    |
| PARK_LED                   | Inactive                                          |    |    |    |    |
| PARK_SYS                   | Inactive                                          |    |    |    |    |
| POWER_CNT( )               | 0                                                 |    |    |    |    |
| REAR_SENS                  | Inactive                                          |    |    |    |    |
| RFI_DIST(m)                | 0                                                 |    |    |    |    |
| RFO_DIST(m)                | 0                                                 |    |    |    |    |
| RRI_DIST(m)                | 0                                                 |    |    |    |    |
| RRO_DIST(m)                | 0                                                 |    |    |    |    |
| R_TONE_STAT                | Inactive                                          |    |    |    |    |
| SELTESTDTC( )              | 0                                                 |    |    |    |    |
| SEN_DET_LFI                | Never Detected                                    |    |    |    |    |
| SEN_DET_LFO                | Never Detected                                    |    |    |    |    |
| SEN_DET_LRI                | Never Detected                                    |    |    |    |    |
| SEN_DET_LRO                | Detected                                          |    |    |    |    |
| SEN_DET_RFI                | Never Detected                                    |    |    |    |    |
| SEN_DET_RFO                | Never Detected                                    |    |    |    |    |
| SEN_DET_RRI                | Never Detected                                    |    |    |    |    |
| SEN_DET_RRO                | Never Detected                                    |    |    |    |    |
| SEN_DST_FL(cm)             | 40.00                                             |    |    |    |    |
| SEN_DST_FR(cm)             | 0.00                                              |    |    |    |    |
| SEN_RNG_FL(mm)             | 0.0                                               |    |    |    |    |
| SEN_RNG_FR(mm)             | 791.0                                             |    |    |    |    |
| SPEED_ACT                  | No                                                |    |    |    |    |
| SPEED_DEACT                | No                                                |    |    |    |    |
| STACK_OF_CNT( )            | 0                                                 |    |    |    |    |
| TRAILINS                   | No                                                |    |    |    |    |
| TRANSGR                    | Not Reverse                                       |    |    |    |    |
| VSS(km/h)                  | 0.0                                               |    |    |    |    |
| WDG_RST_CNT( )             | 0                                                 |    |    |    |    |

## PCM

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| 4X4L                       | Off                                               |    |    |    |    |
| AAT(°C)                    | -39                                               |    |    |    |    |
| AAT(°C)                    | -40                                               |    |    |    |    |
| AAT_UR                     | No Fault                                          |    |    |    |    |
| AAT_V(V)                   | 0.00                                              |    |    |    |    |
| ACCLT_ALW                  | No                                                |    |    |    |    |
| ACC_CMD                    | Off                                               |    |    |    |    |
| ACP_PRESS(kPa)             | 3.0                                               |    |    |    |    |
| ACP_V(V)                   | 0.00                                              |    |    |    |    |
| AC_CLTH_F                  | No Fault                                          |    |    |    |    |
| AC_DIS_TRQ                 | No                                                |    |    |    |    |
| AC_DMND                    | ON                                                |    |    |    |    |
| AC_INHIBIT_00              | No                                                |    |    |    |    |
| AC_INHIBIT_01              | No                                                |    |    |    |    |
| AC_INHIBIT_02              | No                                                |    |    |    |    |
| AC_INHIBIT_03              | No                                                |    |    |    |    |
| AC_INHIBIT_04              | No                                                |    |    |    |    |
| AC_INHIBIT_05              | No                                                |    |    |    |    |
| AC_INHIBIT_06              | No                                                |    |    |    |    |
| AC_INHIBIT_07              | No                                                |    |    |    |    |
| AC_INHIBIT_08              | No                                                |    |    |    |    |
| AC_INHIBIT_09              | No                                                |    |    |    |    |
| AC_INHIBIT_10              | No                                                |    |    |    |    |
| AC_INHIBIT_11              | Yes                                               |    |    |    |    |
| AC_INHIBIT_12              | No                                                |    |    |    |    |
| AC_INHIBIT_13              | No                                                |    |    |    |    |
| AC_INHIBIT_14              | No                                                |    |    |    |    |
| AC_INHIBIT_15              | No                                                |    |    |    |    |
| AC_INHIBIT_16              | No                                                |    |    |    |    |
| AC_INHIBIT_17              | No                                                |    |    |    |    |
| AC_INHIBIT_18              | No                                                |    |    |    |    |
| AC_INHIBIT_19              | No                                                |    |    |    |    |
| AC_INHIBIT_20              | No                                                |    |    |    |    |
| AC_INHIBIT_21              | No                                                |    |    |    |    |
| AC_INHIBIT_22              | No                                                |    |    |    |    |
| AC_INHIBIT_23              | No                                                |    |    |    |    |
| AC_INHIBIT_24              | No                                                |    |    |    |    |
| AC_INHIBIT_25              | No                                                |    |    |    |    |
| AC_INHIBIT_26              | No                                                |    |    |    |    |
| AC_INHIBIT_27              | No                                                |    |    |    |    |
| AC_LP_SW                   | OPEN                                              |    |    |    |    |
| AC_MP_SW                   | OPEN                                              |    |    |    |    |
| AC_REQ                     | No                                                |    |    |    |    |
| AC_RL_ST                   | OFF                                               |    |    |    |    |
| AC_RMNR_F                  | No Fault                                          |    |    |    |    |
| ADPT1_F                    | No Fault                                          |    |    |    |    |
| ADPT2_F                    | No Fault                                          |    |    |    |    |
| ADS                        | error                                             |    |    |    |    |
| AEIS_ACTION( )             | 0                                                 |    |    |    |    |
| AEIS_POSS( )               | 0                                                 |    |    |    |    |
| AFM_DIST(km)               | 0.0                                               |    |    |    |    |
| AFM_REM_LF(%)              | 0.00                                              |    |    |    |    |
| AF_MOD11                   | No                                                |    |    |    |    |
| AF_MOD21                   | No                                                |    |    |    |    |
| AIRSUP_DC                  | NO                                                |    |    |    |    |
| APP(%)                     | 0.00                                              |    |    |    |    |
| APP1(V)                    | 0.79                                              |    |    |    |    |
| APP2(V)                    | 0.36                                              |    |    |    |    |
| APP_D(%)                   | 0.00                                              |    |    |    |    |
| APP_E(%)                   | 0.00                                              |    |    |    |    |
| APP_FLT                    | No Fault                                          |    |    |    |    |
| APP_MAXDIFF(°)             | 0.00                                              |    |    |    |    |
| AST(ms)                    | 65000.00                                          |    |    |    |    |
| AUX_TFP_CMD_OOR            | FALSE                                             |    |    |    |    |
| AUX_TFP_CMD_REJ            | FALSE                                             |    |    |    |    |
| AUX_TFP_LOSSCOM            | FALSE                                             |    |    |    |    |
| AUX_TFP_OVR_CUR            | FALSE                                             |    |    |    |    |
| AUX_TFP_OVR_SPD            | FALSE                                             |    |    |    |    |
| AUX_TFP_OVR_TMP            | FALSE                                             |    |    |    |    |
| AUX_TFP_OVR_VOL            | FALSE                                             |    |    |    |    |
| AUX_TFP_PROTECT            | FALSE                                             |    |    |    |    |
| AUX_TFP_STALL              | FALSE                                             |    |    |    |    |
| AUX_TFP_UND_CUR            | FALSE                                             |    |    |    |    |
| AUX_TFP_UND_SPD            | FALSE                                             |    |    |    |    |
| AUX_TFP_UND_VOL            | FALSE                                             |    |    |    |    |
| AXLECC_STAT                | Data Valid or Not Used                            |    |    |    |    |
| BARO(kPa)                  | 0.0                                               |    |    |    |    |
| BARO_CORR(kPa)             | 0.0                                               |    |    |    |    |
| BARO_UR                    | No Fault                                          |    |    |    |    |
| BARO_V(V)                  | 0.00                                              |    |    |    |    |
| BATT_VLO_ACC               | NO                                                |    |    |    |    |
| BATT_VLO_FAN               | NO                                                |    |    |    |    |
| BATT_VLO_FAN_AR            | NO                                                |    |    |    |    |
| BATT_V_INF(V)              | 0.00                                              |    |    |    |    |
| BBPS_DYN_QF                | FAIL - Accuracy Undefined                         |    |    |    |    |
| BBPS_INR_QF                | nan                                               |    |    |    |    |
| BBP_ASSIST                 | Faulted - Brake Booster Assist Not Useable        |    |    |    |    |
| BBP_CORR(kPa)              | 0.0                                               |    |    |    |    |
| BBP_MES(kPa)               | 0.0                                               |    |    |    |    |
| BBP_VAC_MGR                | Vacuum Manager is Not Optimizing Engine Vacuum    |    |    |    |    |
| BISSBLS                    | Inactive                                          |    |    |    |    |
| BOO1                       | Off                                               |    |    |    |    |
| BOO2                       | Off                                               |    |    |    |    |
| BOO2                       | Off                                               |    |    |    |    |
| BRKOVRD_POSS( )            | 0                                                 |    |    |    |    |
| BRKOVR_ACTION( )           | 0                                                 |    |    |    |    |
| BRK_FLUID                  | Off                                               |    |    |    |    |
| CACCT_F                    | No Fault                                          |    |    |    |    |
| CACC_FAN                   | OFF                                               |    |    |    |    |
| CACC_FAN(%)                | 29.02                                             |    |    |    |    |
| CAC_T(°C)                  | 0                                                 |    |    |    |    |
| CAC_UR                     | No Fault                                          |    |    |    |    |
| CAC_V(V)                   | 0.05                                              |    |    |    |    |
| CAM_SYNC                   | No                                                |    |    |    |    |
| CANVENT_F                  | No Fault                                          |    |    |    |    |
| CATEMP11(°C)               | -40                                               |    |    |    |    |
| CATEMP21(°C)               | -40                                               |    |    |    |    |
| CATSUP_DC                  | NO                                                |    |    |    |    |
| CAT_EVAL                   | Yes                                               |    |    |    |    |
| CCMSUP_DC                  | NO                                                |    |    |    |    |
| CCM_EVAL                   | Yes                                               |    |    |    |    |
| CHT(V)                     | 0.13                                              |    |    |    |    |
| CHT2_F                     | No Fault                                          |    |    |    |    |
| CHTIL                      | Off                                               |    |    |    |    |
| CHT_CORR(°C)               | 0                                                 |    |    |    |    |
| CHT_F                      | No Fault                                          |    |    |    |    |
| CKP_LRN_MIN_RPM(1/min)     | 288                                               |    |    |    |    |
| CLRDIST(km)                | 1153.0                                            |    |    |    |    |
| CLR_TIME(s)                | 115                                               |    |    |    |    |
| CMP1_EXH_F                 | No Fault                                          |    |    |    |    |
| CMP1_INTK_F                | No Fault                                          |    |    |    |    |
| CMP2_EXH_F                 | No Fault                                          |    |    |    |    |
| CMP2_INTK_F                | No Fault                                          |    |    |    |    |
| COOLPMP_A_STAT             | error                                             |    |    |    |    |
| COOLPMP_CMD                | Off                                               |    |    |    |    |
| CPP_BOT                    | No                                                |    |    |    |    |
| CPP_TOP                    | Yes                                               |    |    |    |    |
| CRNKCAS_PRS(kPa)           | 2.3                                               |    |    |    |    |
| CRNKCAS_P_UR               | No Fault                                          |    |    |    |    |
| CRNKCAS_P_V(V)             | 0.00                                              |    |    |    |    |
| CYL1_INJB_F                | No Fault                                          |    |    |    |    |
| CYL2_INJB_F                | Yes Fault                                         |    |    |    |    |
| CYL3_INJB_F                | Yes Fault                                         |    |    |    |    |
| CYL4_INJB_F                | No Fault                                          |    |    |    |    |
| CYL5_INJB_F                | No Fault                                          |    |    |    |    |
| CYL6_INJB_F                | No Fault                                          |    |    |    |    |
| CYL7_INJB_F                | No Fault                                          |    |    |    |    |
| CYL8_INJB_F                | No Fault                                          |    |    |    |    |
| CYL_1_ACCL( )              | 1                                                 |    |    |    |    |
| CYL_2_ACCL( )              | 1                                                 |    |    |    |    |
| CYL_3_ACCL( )              | -2                                                |    |    |    |    |
| CYL_4_ACCL( )              | 0                                                 |    |    |    |    |
| CYL_5_ACCL( )              | -2                                                |    |    |    |    |
| CYL_6_ACCL( )              | 0                                                 |    |    |    |    |
| DECHOKE                    | No                                                |    |    |    |    |
| DIAG_VER                   | Unknown                                           |    |    |    |    |
| DIST_AEIS(km)              | 0.0                                               |    |    |    |    |
| DIST_BRKOVRD(km)           | 1978.2                                            |    |    |    |    |
| DPFE_UR                    | No Fault                                          |    |    |    |    |
| DTC TCM( )                 | 0                                                 |    |    |    |    |
| DTCCNT_OBD( )              | 10                                                |    |    |    |    |
| ECPC_CMD                   | Disengaged                                        |    |    |    |    |
| ECPC_F                     | No Fault                                          |    |    |    |    |
| ECT(°C)                    | 212                                               |    |    |    |    |
| ECTC(°C)                   | 9                                                 |    |    |    |    |
| ECT_F                      | No Fault                                          |    |    |    |    |
| ECU_ONTIME(min)            | 0                                                 |    |    |    |    |
| EC_BYPASS_VLV              | Off                                               |    |    |    |    |
| EC_BYPASS_VLV_F            | No Fault                                          |    |    |    |    |
| EGRMC1F                    | No Fault                                          |    |    |    |    |
| EGRMC2F                    | No Fault                                          |    |    |    |    |
| EGRMC3F                    | No Fault                                          |    |    |    |    |
| EGRMC4F                    | No Fault                                          |    |    |    |    |
| EGRSUP_DC                  | NO                                                |    |    |    |    |
| EGRT_B_UR                  | No Fault                                          |    |    |    |    |
| EGR_EVAL                   | Yes                                               |    |    |    |    |
| EGR_F                      | No Fault                                          |    |    |    |    |
| ENGOFF_TIMER(s)            | 0                                                 |    |    |    |    |
| ENG_CRANK                  | Inactive                                          |    |    |    |    |
| ENG_FUEL_RATE(g/s)         | 51.28                                             |    |    |    |    |
| ENG_IDLE_SD                | error                                             |    |    |    |    |
| EONV_RDY                   | Not Ready                                         |    |    |    |    |
| EOPC_CIRC_F                | Yes Fault                                         |    |    |    |    |
| EOPC_FUNC_F                | No Fault                                          |    |    |    |    |
| EOP_UR                     | No Fault                                          |    |    |    |    |
| EQRAT11_CMD(:1)            | 0.000                                             |    |    |    |    |
| EQRAT21_DSD(:1)            | 0.010                                             |    |    |    |    |
| EQ_RAT11(:1)               | 0.000                                             |    |    |    |    |
| EQ_RAT21(:1)               | 0.000                                             |    |    |    |    |
| ETC_ACT(°)                 | 0.20                                              |    |    |    |    |
| ETC_CIR_FLT                | No Fault                                          |    |    |    |    |
| ETC_CLNR_CNTR( )           | 0                                                 |    |    |    |    |
| ETC_CLNR_STAT              | No - NOT Incremented                              |    |    |    |    |
| ETC_CNTR_DRVCYL( )         | 0                                                 |    |    |    |    |
| ETC_CNTR_STAT              | No - NOT Incremented                              |    |    |    |    |
| ETC_DIST_EVENT(km)         | 0.0                                               |    |    |    |    |
| ETC_DOWN                   | FALSE                                             |    |    |    |    |
| ETC_DSD(°)                 | 1.86                                              |    |    |    |    |
| ETC_EX_PWR                 | No Fault                                          |    |    |    |    |
| ETC_FROZEN                 | Yes Fault                                         |    |    |    |    |
| ETC_HOT_STR                | No Fault                                          |    |    |    |    |
| ETC_ICE_CNTR( )            | 0                                                 |    |    |    |    |
| ETC_ICE_STAT               | Yes - Incremented                                 |    |    |    |    |
| ETC_MISWIRE                | No Fault                                          |    |    |    |    |
| ETC_OPR_ST                 | ENABLE                                            |    |    |    |    |
| ETC_OSBTR_CNTR( )          | 0                                                 |    |    |    |    |
| ETC_OSBTR_STAT             | No - NOT Incremented                              |    |    |    |    |
| ETC_PWR_UP                 | No Fault                                          |    |    |    |    |
| ETC_REASON_2nd             | KAM Reset or Counter Reset                        |    |    |    |    |
| ETC_REASON_LAST            | Moderate Obstruction during KOER                  |    |    |    |    |
| ETC_SERV_RS                | FALSE                                             |    |    |    |    |
| ETC_SERV_SH                | No Fault                                          |    |    |    |    |
| ETC_STK_HI                 | No Fault                                          |    |    |    |    |
| ETC_STK_LOW                | No Fault                                          |    |    |    |    |
| ETC_STUCK_M                | No Fault                                          |    |    |    |    |
| ETC_TP1_HI                 | No Fault                                          |    |    |    |    |
| ETC_TP1_LOW                | No Fault                                          |    |    |    |    |
| ETC_TP1_OFS                | No Fault                                          |    |    |    |    |
| ETC_TP2_LOW                | No Fault                                          |    |    |    |    |
| ETC_TP2_OFS                | No Fault                                          |    |    |    |    |
| ETC_TPS_HI                 | No Fault                                          |    |    |    |    |
| ETC_TP_FAIL                | No Fault                                          |    |    |    |    |
| ETC_TP_NP_F                | No Fault                                          |    |    |    |    |
| ETC_TRIM(°)                | 0.01                                              |    |    |    |    |
| ETC_TRIM_LRN               | Yes                                               |    |    |    |    |
| EVACC_CUR(A)               | 0.00                                              |    |    |    |    |
| EVACC_DERATE               | Normal                                            |    |    |    |    |
| EVAP020C                   | No                                                |    |    |    |    |
| EVAPCP(%)                  | 3.40                                              |    |    |    |    |
| EVAPCV                     | error                                             |    |    |    |    |
| EVAPCV(%)                  | 75.67                                             |    |    |    |    |
| EVAPCV(%)                  | 0.00                                              |    |    |    |    |
| EVAPCV_F                   | No Fault                                          |    |    |    |    |
| EVAPSOAK                   | No                                                |    |    |    |    |
| EVAPSTA                    | 0 - Vac Pulldown                                  |    |    |    |    |
| EVAPSUP_DC                 | NO                                                |    |    |    |    |
| EVAPVM_F                   | No Fault                                          |    |    |    |    |
| EVAP_EVAL                  | Yes                                               |    |    |    |    |
| EVAP_GAUGE(kPa)            | 0.0                                               |    |    |    |    |
| EVAP_LDPMP_F               | No Fault                                          |    |    |    |    |
| EVAP_LDP_VLV_F             | No Fault                                          |    |    |    |    |
| EVAP_PCT(%)                | 0.00                                              |    |    |    |    |
| EVAP_VP(kPa)               | 0.0                                               |    |    |    |    |
| EVBV_F                     | No Fault                                          |    |    |    |    |
| EVT_MON_MISF( )            | 0                                                 |    |    |    |    |
| EVT_NMO_MISF( )            | 1857                                              |    |    |    |    |
| FANMOD_PSP                 | NO                                                |    |    |    |    |
| FANSPD_MOD                 | No Fault                                          |    |    |    |    |
| FF_LRND                    | No                                                |    |    |    |    |
| FLI(%)                     | 0.00                                              |    |    |    |    |
| FLI_F                      | Yes Fault                                         |    |    |    |    |
| FLP_UR                     | No Fault                                          |    |    |    |    |
| FP(%)                      | 30.21                                             |    |    |    |    |
| FP                         | Off                                               |    |    |    |    |
| FPL_CMD                    | Off                                               |    |    |    |    |
| FPM(%)                     | 0.12                                              |    |    |    |    |
| FP_F                       | No Fault                                          |    |    |    |    |
| FP_RELAY                   | Off                                               |    |    |    |    |
| FRP(kPa)                   | 7910.0                                            |    |    |    |    |
| FRPC_STAT                  | No Fault                                          |    |    |    |    |
| FRP_DSD(kPa)               | 10.0                                              |    |    |    |    |
| FRP_F                      | No Fault                                          |    |    |    |    |
| FRP_V(V)                   | 0.00                                              |    |    |    |    |
| FRT(°C)                    | 0                                                 |    |    |    |    |
| FRT_V(V)                   | 0.00                                              |    |    |    |    |
| FTBRAKE                    | Off                                               |    |    |    |    |
| FTP_F                      | No Fault                                          |    |    |    |    |
| FTP_V(V)                   | 0.00                                              |    |    |    |    |
| FUELDR_POS_SW              | Closed                                            |    |    |    |    |
| FUELDR_REQ                 | No                                                |    |    |    |    |
| FUELDR_UNLCK_F             | No Fault                                          |    |    |    |    |
| FUELMON_CMP                | Yes                                               |    |    |    |    |
| FUELMON_RDY                | Yes                                               |    |    |    |    |
| FUELSYS_A                  | error                                             |    |    |    |    |
| FUELSYS_B                  | error                                             |    |    |    |    |
| FUEL_MASS_DI(%)            | 100.00                                            |    |    |    |    |
| FUEL_MASS_DI               | DI and PFI                                        |    |    |    |    |
| FUEL_SUP                   | NO                                                |    |    |    |    |
| FUEL_TYPE                  | NONE                                              |    |    |    |    |
| F_VCV(%)                   | 0.00                                              |    |    |    |    |
| F_VCV_F                    | No Fault                                          |    |    |    |    |
| GEAR_CMD                   | Park                                              |    |    |    |    |
| GEAR_ENGAGED               | Park                                              |    |    |    |    |
| GEAR_OSC                   | error                                             |    |    |    |    |
| GENBPLUS_F                 | No Fault                                          |    |    |    |    |
| GENBPLUS_SNS_F             | No Fault                                          |    |    |    |    |
| GENCMD_LF                  | No Fault                                          |    |    |    |    |
| GENCMD_LF2                 | No Fault                                          |    |    |    |    |
| GENFDC_MES(%)              | 6.25                                              |    |    |    |    |
| GENFIL                     | Off                                               |    |    |    |    |
| GENMON_FS                  | No Fault                                          |    |    |    |    |
| GENMON_LS                  | No Fault                                          |    |    |    |    |
| GENREG_ELEC_F              | No Fault                                          |    |    |    |    |
| GENREG_INVCMD              | No Fault                                          |    |    |    |    |
| GENREG_MECH_F              | No Fault                                          |    |    |    |    |
| GENREG_NOCMD               | No Fault                                          |    |    |    |    |
| GENREG_OVRTMP              | No Fault                                          |    |    |    |    |
| GEN_FAULT                  | No Fault                                          |    |    |    |    |
| GEN_FAULT2                 | No Fault                                          |    |    |    |    |
| GEN_FAULT_NS               | No Fault                                          |    |    |    |    |
| GEN_LOSTCOMM               | No Fault                                          |    |    |    |    |
| GLOWPLUG_LMP               | Off                                               |    |    |    |    |
| GLOWPLUG_RLY               | Off                                               |    |    |    |    |
| GP_LMP                     | Off                                               |    |    |    |    |
| GRILL_A_BLCK               | No Fault                                          |    |    |    |    |
| GRILL_A_BOOST              | No                                                |    |    |    |    |
| GRILL_A_BST_CMD            | No                                                |    |    |    |    |
| GRILL_A_CMD(%)             | 0.00                                              |    |    |    |    |
| GRILL_A_COUNT( )           | 0                                                 |    |    |    |    |
| GRILL_A_ELEC_F             | No Fault                                          |    |    |    |    |
| GRILL_A_OVRT               | No Fault                                          |    |    |    |    |
| GRILL_A_POS_F              | No Fault                                          |    |    |    |    |
| GRILL_A_UNDRV              | No Fault                                          |    |    |    |    |
| GRILL_B_BLCK               | No Fault                                          |    |    |    |    |
| GRILL_B_BOOST              | No                                                |    |    |    |    |
| GRILL_B_BST_CMD            | No                                                |    |    |    |    |
| GRILL_B_CMDCAL             | No                                                |    |    |    |    |
| GRILL_B_ELEC_F             | No Fault                                          |    |    |    |    |
| GRILL_B_LSTCOM             | No Fault                                          |    |    |    |    |
| GRILL_B_OVRT               | No Fault                                          |    |    |    |    |
| GRILL_B_POS_F              | No Fault                                          |    |    |    |    |
| GRILL_B_UNDRV              | No Fault                                          |    |    |    |    |
| GRILL_CMDCAL               | No                                                |    |    |    |    |
| GRILL_LOSTCOMM             | No Fault                                          |    |    |    |    |
| GS_A_POS_M(%)              | 0.00                                              |    |    |    |    |
| HCATSUP_DC                 | NO                                                |    |    |    |    |
| HCAT_EVAL                  | Yes                                               |    |    |    |    |
| HFC                        | Off                                               |    |    |    |    |
| HFC_F                      | No Fault                                          |    |    |    |    |
| HRSH_SHFT                  | Off                                               |    |    |    |    |
| HTR11                      | Off                                               |    |    |    |    |
| HTR11F                     | No Fault                                          |    |    |    |    |
| HTR12                      | Off                                               |    |    |    |    |
| HTR12F                     | No Fault                                          |    |    |    |    |
| HTR13                      | Off                                               |    |    |    |    |
| HTR21                      | Off                                               |    |    |    |    |
| HTR21F                     | No Fault                                          |    |    |    |    |
| HTR22                      | Off                                               |    |    |    |    |
| HTR22F                     | No Fault                                          |    |    |    |    |
| HTR23                      | Off                                               |    |    |    |    |
| HTR23F                     | No Fault                                          |    |    |    |    |
| HTRCABIN_DV                | Off                                               |    |    |    |    |
| HTRCM11(A)                 | 0.00                                              |    |    |    |    |
| HTRCM12(A)                 | 0.00                                              |    |    |    |    |
| HTRCM21(A)                 | 0.00                                              |    |    |    |    |
| HTRCM22(A)                 | 0.00                                              |    |    |    |    |
| HTRSUP_DC                  | NO                                                |    |    |    |    |
| HTRX1                      | Off                                               |    |    |    |    |
| HTRX2                      | Off                                               |    |    |    |    |
| HTRX3                      | Off                                               |    |    |    |    |
| IACKAM0_TRQ(Nm)            | 0.0                                               |    |    |    |    |
| IACKAM1_TRQ(Nm)            | -2.4                                              |    |    |    |    |
| IACKAM2_TRQ(Nm)            | 0.2                                               |    |    |    |    |
| IACKAM3_TRQ(Nm)            | 0.0                                               |    |    |    |    |
| IACTRIM_TRQ(Nm)            | 0.0                                               |    |    |    |    |
| IAC_MODE                   | CTRL LEARN                                        |    |    |    |    |
| IAT(°C)                    | -40                                               |    |    |    |    |
| IAT(V)                     | 1.50                                              |    |    |    |    |
| IAT11(°C)                  | -40                                               |    |    |    |    |
| IAT12(°C)                  | -40                                               |    |    |    |    |
| IAT13(°C)                  | -40                                               |    |    |    |    |
| IAT1_UR                    | No Fault                                          |    |    |    |    |
| IAT2(°C)                   | -40                                               |    |    |    |    |
| IAT21(°C)                  | -40                                               |    |    |    |    |
| IAT2_UR                    | No Fault                                          |    |    |    |    |
| IAT2_V(V)                  | 1.61                                              |    |    |    |    |
| IAT_F                      | No Fault                                          |    |    |    |    |
| IC_TYPECC_STAT             | Data Valid or Not Used                            |    |    |    |    |
| ID_2_BCM                   | No                                                |    |    |    |    |
| ID_2_ESCL                  | No                                                |    |    |    |    |
| ID_RECV_T1                 | No                                                |    |    |    |    |
| IGN_STRT/RUN               | Not Active                                        |    |    |    |    |
| IGN_SW                     | Off                                               |    |    |    |    |
| IGN_SW_ACC                 | Inactive                                          |    |    |    |    |
| IGN_SW_KEY_IN              | KEY_OUT                                           |    |    |    |    |
| IMRC_F                     | No Fault                                          |    |    |    |    |
| IMTV                       | Off                                               |    |    |    |    |
| IMTV_F                     | No Fault                                          |    |    |    |    |
| INJ1_F                     | No Fault                                          |    |    |    |    |
| INJ1_STAT                  | Low Side INJ Short Gnd                            |    |    |    |    |
| INJ2_F                     | No Fault                                          |    |    |    |    |
| INJ2_STAT                  | Hi Side INJ Short Low Side                        |    |    |    |    |
| INJ3_F                     | No Fault                                          |    |    |    |    |
| INJ3_STAT                  | error                                             |    |    |    |    |
| INJ4_F                     | No Fault                                          |    |    |    |    |
| INJ4_STAT                  | error                                             |    |    |    |    |
| INJ5_F                     | No Fault                                          |    |    |    |    |
| INJ5_STAT                  | error                                             |    |    |    |    |
| INJ6_F                     | No Fault                                          |    |    |    |    |
| INJ6_STAT                  | error                                             |    |    |    |    |
| INJ7_F                     | No Fault                                          |    |    |    |    |
| INJ8_F                     | No Fault                                          |    |    |    |    |
| INJPWR_M(V)                | 0.00                                              |    |    |    |    |
| INJ_F                      | No Fault                                          |    |    |    |    |
| IN_GEAR                    | No                                                |    |    |    |    |
| ISS_A_QF                   | Good - Confirmed                                  |    |    |    |    |
| ISS_A_RAW(1/min)           | 0                                                 |    |    |    |    |
| ISS_B_QF                   | Good - Confirmed                                  |    |    |    |    |
| ISS_B_RAW(1/min)           | 45                                                |    |    |    |    |
| ISS_F                      | No Fault                                          |    |    |    |    |
| KAPWR_OK                   | FAULT                                             |    |    |    |    |
| KEYST                      | Off                                               |    |    |    |    |
| KNK_CNTR_CYL1( )           | 129                                               |    |    |    |    |
| KNK_CNTR_CYL2( )           | 3                                                 |    |    |    |    |
| KNK_CNTR_CYL3( )           | 58                                                |    |    |    |    |
| KNK_CNTR_CYL4( )           | 32                                                |    |    |    |    |
| KNK_CNTR_CYL5( )           | 129                                               |    |    |    |    |
| KNK_CNTR_CYL6( )           | 0                                                 |    |    |    |    |
| KNK_RATE_LRND(%)           | 3.52                                              |    |    |    |    |
| KNOCK_1( )                 | 0                                                 |    |    |    |    |
| KNOCK_2( )                 | 5                                                 |    |    |    |    |
| KNOCK_CORR_LRN( )          | 0                                                 |    |    |    |    |
| KNOCK_SPRK(°)              | 0.00                                              |    |    |    |    |
| LFC                        | Off                                               |    |    |    |    |
| LFC_F                      | No Fault                                          |    |    |    |    |
| LFT1_C1_USED               | No                                                |    |    |    |    |
| LFT1_C2_USED               | No                                                |    |    |    |    |
| LFT1_C3_USED               | No                                                |    |    |    |    |
| LFT1_C4_USED               | Yes                                               |    |    |    |    |
| LFT1_C5_USED               | No                                                |    |    |    |    |
| LFT1_C6_USED               | No                                                |    |    |    |    |
| LFT1_C7_USED               | Yes                                               |    |    |    |    |
| LFT1_CELL1(%)              | -81.25                                            |    |    |    |    |
| LFT1_CELL2(%)              | -97.66                                            |    |    |    |    |
| LFT1_CELL3(%)              | -100.00                                           |    |    |    |    |
| LFT1_CELL4(%)              | -100.00                                           |    |    |    |    |
| LFT1_CELL5(%)              | -100.00                                           |    |    |    |    |
| LFT1_CELL6(%)              | -20.31                                            |    |    |    |    |
| LFT1_CELL7(%)              | -100.00                                           |    |    |    |    |
| LFT2_C1_USED               | Yes                                               |    |    |    |    |
| LFT2_C2_USED               | No                                                |    |    |    |    |
| LFT2_C3_USED               | No                                                |    |    |    |    |
| LFT2_C4_USED               | No                                                |    |    |    |    |
| LFT2_C5_USED               | No                                                |    |    |    |    |
| LFT2_C6_USED               | No                                                |    |    |    |    |
| LFT2_C7_USED               | No                                                |    |    |    |    |
| LFT2_CELL1(%)              | 91.41                                             |    |    |    |    |
| LFT2_CELL2(%)              | -100.00                                           |    |    |    |    |
| LFT2_CELL3(%)              | -100.00                                           |    |    |    |    |
| LFT2_CELL4(%)              | -100.00                                           |    |    |    |    |
| LFT2_CELL5(%)              | -100.00                                           |    |    |    |    |
| LGSO2FT1(%)                | -100.00                                           |    |    |    |    |
| LGSO2FT2(%)                | -82.81                                            |    |    |    |    |
| LINEDSD(kPa)               | 410.0                                             |    |    |    |    |
| LOAD(%)                    | 0.00                                              |    |    |    |    |
| LOAD_ABS(%)                | 39.22                                             |    |    |    |    |
| LONGFT1(%)                 | -100.00                                           |    |    |    |    |
| LONGFT2(%)                 | -100.00                                           |    |    |    |    |
| LOW_OIL                    | No                                                |    |    |    |    |
| LP_FUEL_SW                 | Not Low                                           |    |    |    |    |
| MAF_F                      | No Fault                                          |    |    |    |    |
| MAP(kPa)                   | 0.0                                               |    |    |    |    |
| MAP(kPa)                   | 0.0                                               |    |    |    |    |
| MAP_F                      | No Fault                                          |    |    |    |    |
| MAP_V(V)                   | 0.00                                              |    |    |    |    |
| MASTERKEY                  | No                                                |    |    |    |    |
| MFC_F                      | No Fault                                          |    |    |    |    |
| MFF_INGEAR                 | No                                                |    |    |    |    |
| MFF_LOAD(%)                | 11.75                                             |    |    |    |    |
| MFF_RPM(1/min)             | 2691                                              |    |    |    |    |
| MFF_RUN(s)                 | 255                                               |    |    |    |    |
| MFF_SOAK(min)              | 0                                                 |    |    |    |    |
| MFF_SOAK(s)                | 0                                                 |    |    |    |    |
| MFF_TCC_LOCK               | No                                                |    |    |    |    |
| MFF_THR_ANG(%)             | 0.00                                              |    |    |    |    |
| MFF_TRIP( )                | 35                                                |    |    |    |    |
| MFF_VSS(km/h)              | 0.0                                               |    |    |    |    |
| MIL                        | Off                                               |    |    |    |    |
| MIL                        | Off                                               |    |    |    |    |
| MIL_DIS(km)                | 0.0                                               |    |    |    |    |
| MISFIRE                    | No                                                |    |    |    |    |
| MISFIRE_MON                | Disabled                                          |    |    |    |    |
| MISFM_LRN_PRG( )           | 0                                                 |    |    |    |    |
| MISFSUP_DC                 | NO                                                |    |    |    |    |
| MISF_EVAL                  | Yes                                               |    |    |    |    |
| MP_LRN                     | NO                                                |    |    |    |    |
| MSFM_ACC_CYL1( )           | 0                                                 |    |    |    |    |
| MSFM_ACC_CYL2( )           | 0                                                 |    |    |    |    |
| MSFM_ACC_CYL3( )           | 0                                                 |    |    |    |    |
| MSFM_ACC_CYL4( )           | 0                                                 |    |    |    |    |
| MSFM_ACC_CYL5( )           | 0                                                 |    |    |    |    |
| MSFM_ACC_CYL6( )           | 0                                                 |    |    |    |    |
| MSFM_ACC_CYL7( )           | 0                                                 |    |    |    |    |
| MSFM_ACC_CYL8( )           | 0                                                 |    |    |    |    |
| MSFM_BAT_OR                | TRUE                                              |    |    |    |    |
| MSFM_COUNTER( )            | 10                                                |    |    |    |    |
| MSFM_CPS_NL                | FALSE                                             |    |    |    |    |
| MSFM_FI_SHO                | FALSE                                             |    |    |    |    |
| MSFM_FL_LOW                | FALSE                                             |    |    |    |    |
| MSFM_IHIBIT                | FALSE                                             |    |    |    |    |
| MSFM_OBD_BL                | FALSE                                             |    |    |    |    |
| MSFM_OBR                   | FALSE                                             |    |    |    |    |
| MSFM_OFF                   | FALSE                                             |    |    |    |    |
| MSFM_OTC                   | FALSE                                             |    |    |    |    |
| MSFM_OTR_OR                | FALSE                                             |    |    |    |    |
| MSFM_TRQ_TR                | FALSE                                             |    |    |    |    |
| NUM_MISFIRE( )             | 0                                                 |    |    |    |    |
| O2S11_CUR(mA)              | -128.00                                           |    |    |    |    |
| O2S11_F                    | No Fault                                          |    |    |    |    |
| O2S11_HTR(%)               | 0.00                                              |    |    |    |    |
| O2S11_IMPED(V)             | 0.00                                              |    |    |    |    |
| O2S11_READY                | No                                                |    |    |    |    |
| O2S11_STAT                 | No Fault                                          |    |    |    |    |
| O2S11_TR(Ω)                | 0                                                 |    |    |    |    |
| O2S12(V)                   | 4.02                                              |    |    |    |    |
| O2S12.STFT(%)              | -100.00                                           |    |    |    |    |
| O2S12.VOLT(V)              | 1.26                                              |    |    |    |    |
| O2S21_CUR(mA)              | -128.00                                           |    |    |    |    |
| O2S21_F                    | No Fault                                          |    |    |    |    |
| O2S21_HTR(%)               | 51.37                                             |    |    |    |    |
| O2S21_IMPED(V)             | 0.02                                              |    |    |    |    |
| O2S21_READY                | No                                                |    |    |    |    |
| O2S21_STAT                 | No Fault                                          |    |    |    |    |
| O2S21_TR(Ω)                | 128300                                            |    |    |    |    |
| O2S22(V)                   | 0.77                                              |    |    |    |    |
| O2S22.STFT(%)              | -100.00                                           |    |    |    |    |
| O2S22.VOLT(V)              | 0.00                                              |    |    |    |    |
| O2SHTR_EVAL                | Yes                                               |    |    |    |    |
| O2SSUP_DC                  | NO                                                |    |    |    |    |
| O2S_EVAL                   | Yes                                               |    |    |    |    |
| O2_DS1_ERR(V)              | 0.01                                              |    |    |    |    |
| O2_DS2_ERR(V)              | 0.04                                              |    |    |    |    |
| O2_DS_DISBL                | No                                                |    |    |    |    |
| OBDMON_EVAL                | Not Complete                                      |    |    |    |    |
| OCTADJ_R_LRND(%)           | 0.00                                              |    |    |    |    |
| OIL_LIFE_REDC              | OK                                                |    |    |    |    |
| OIL_LOW_SW                 | Not Low                                           |    |    |    |    |
| OIL_REMAINING(%)           | 0.00                                              |    |    |    |    |
| OSS_F                      | No Fault                                          |    |    |    |    |
| OSS_QF                     | Good - Confirmed                                  |    |    |    |    |
| OSS_RAW(1/min)             | 0                                                 |    |    |    |    |
| P2610_ECUCLOCK             | No Fault                                          |    |    |    |    |
| P2610_INFTIMER             | No Fault                                          |    |    |    |    |
| P2610_LOSSCOM              | No Fault                                          |    |    |    |    |
| PARK_BRK                   | Off                                               |    |    |    |    |
| PARK_BRK_SW                | Off                                               |    |    |    |    |
| PATSENABL                  | Disabled                                          |    |    |    |    |
| PCA(kPa)                   | 140.0                                             |    |    |    |    |
| PCA AMP(A)                 | 0.07                                              |    |    |    |    |
| PCA_F                      | No Fault                                          |    |    |    |    |
| PCVHC_F                    | No Fault                                          |    |    |    |    |
| PCV_PWM(%)                 | 0.00                                              |    |    |    |    |
| PISTON_OIL_FF              | No Fault                                          |    |    |    |    |
| PN_SW                      | Open                                              |    |    |    |    |
| PROG_FLOWTRACE1( )         | 8390656                                           |    |    |    |    |
| PROG_FLOWTRACE2( )         | 8390656                                           |    |    |    |    |
| PTO                        | Off                                               |    |    |    |    |
| PTOIL                      | Off                                               |    |    |    |    |
| PTOIL_F                    | Yes Fault                                         |    |    |    |    |
| PTOIR_V(V)                 | 2.00                                              |    |    |    |    |
| PTO_ABORT_00A              | No                                                |    |    |    |    |
| PTO_ABORT_01A              | No                                                |    |    |    |    |
| PTO_ABORT_02A              | No                                                |    |    |    |    |
| PTO_ABORT_03A              | No                                                |    |    |    |    |
| PTO_ABORT_04A              | No                                                |    |    |    |    |
| PTO_ABORT_05A              | No                                                |    |    |    |    |
| PTO_ABORT_06A              | No                                                |    |    |    |    |
| PTO_ABORT_07A              | No                                                |    |    |    |    |
| PTO_ABORT_08A              | No                                                |    |    |    |    |
| PTO_ABORT_09A              | No                                                |    |    |    |    |
| PTO_ABORT_10A              | No                                                |    |    |    |    |
| PTO_ABORT_11A              | No                                                |    |    |    |    |
| PTO_ABORT_12A              | No                                                |    |    |    |    |
| PTO_ABORT_13A              | No                                                |    |    |    |    |
| PTO_ABORT_14A              | No                                                |    |    |    |    |
| PTO_ABORT_15A              | No                                                |    |    |    |    |
| PTO_ABORT_16A              | No                                                |    |    |    |    |
| PTO_ABORT_17A              | No                                                |    |    |    |    |
| PTO_ABORT_18A              | No                                                |    |    |    |    |
| PTO_ABORT_19A              | No                                                |    |    |    |    |
| PTO_ABORT_20A              | No                                                |    |    |    |    |
| PTO_ABORT_21A              | No                                                |    |    |    |    |
| PTO_ABORT_22A              | No                                                |    |    |    |    |
| PTO_ABORT_22B              | No                                                |    |    |    |    |
| PTO_ABORT_23A              | No                                                |    |    |    |    |
| PTO_ABORT_23B              | No                                                |    |    |    |    |
| PTO_ABORT_24A              | No                                                |    |    |    |    |
| PTO_ABORT_24B              | No                                                |    |    |    |    |
| PTO_ABORT_25A              | No                                                |    |    |    |    |
| PTO_ABORT_25B              | No                                                |    |    |    |    |
| PTO_ABORT_26A              | No                                                |    |    |    |    |
| PTO_ABORT_26B              | No                                                |    |    |    |    |
| PTO_ABORT_27A              | No                                                |    |    |    |    |
| PTO_ABORT_27B              | No                                                |    |    |    |    |
| PTO_ABORT_28A              | No                                                |    |    |    |    |
| PTO_ABORT_28B              | No                                                |    |    |    |    |
| PTO_ABORT_29A              | No                                                |    |    |    |    |
| PTO_ABORT_29B              | No                                                |    |    |    |    |
| PTO_ABORT_30A              | No                                                |    |    |    |    |
| PTO_ABORT_30B              | No                                                |    |    |    |    |
| PTO_ABORT_31A              | No                                                |    |    |    |    |
| PTO_ABORT_31B              | No                                                |    |    |    |    |
| PTO_ACTV_MODE              | No Active PTO Mode                                |    |    |    |    |
| PTO_BCPIL_CMD              | Off                                               |    |    |    |    |
| PTO_BCPIL_F                | No Fault                                          |    |    |    |    |
| PTO_BCP_REQ_SW             | Low                                               |    |    |    |    |
| PTO_BLOCKD_00A             | No                                                |    |    |    |    |
| PTO_BLOCKD_01A             | No                                                |    |    |    |    |
| PTO_BLOCKD_02A             | No                                                |    |    |    |    |
| PTO_BLOCKD_03A             | No                                                |    |    |    |    |
| PTO_BLOCKD_04A             | No                                                |    |    |    |    |
| PTO_BLOCKD_05A             | No                                                |    |    |    |    |
| PTO_BLOCKD_06A             | No                                                |    |    |    |    |
| PTO_BLOCKD_07A             | No                                                |    |    |    |    |
| PTO_BLOCKD_08A             | No                                                |    |    |    |    |
| PTO_BLOCKD_09A             | No                                                |    |    |    |    |
| PTO_BLOCKD_10A             | No                                                |    |    |    |    |
| PTO_BLOCKD_11A             | Yes                                               |    |    |    |    |
| PTO_BLOCKD_12A             | No                                                |    |    |    |    |
| PTO_BLOCKD_13A             | No                                                |    |    |    |    |
| PTO_BLOCKD_14A             | No                                                |    |    |    |    |
| PTO_BLOCKD_15A             | No                                                |    |    |    |    |
| PTO_BLOCKD_16A             | No                                                |    |    |    |    |
| PTO_BLOCKD_17A             | No                                                |    |    |    |    |
| PTO_BLOCKD_18A             | No                                                |    |    |    |    |
| PTO_BLOCKD_19A             | No                                                |    |    |    |    |
| PTO_BLOCKD_20A             | No                                                |    |    |    |    |
| PTO_BLOCKD_21A             | No                                                |    |    |    |    |
| PTO_BLOCKD_22A             | No                                                |    |    |    |    |
| PTO_BLOCKD_22B             | No                                                |    |    |    |    |
| PTO_BLOCKD_23A             | No                                                |    |    |    |    |
| PTO_BLOCKD_23B             | No                                                |    |    |    |    |
| PTO_BLOCKD_24A             | No                                                |    |    |    |    |
| PTO_BLOCKD_24B             | No                                                |    |    |    |    |
| PTO_BLOCKD_25A             | No                                                |    |    |    |    |
| PTO_BLOCKD_25B             | No                                                |    |    |    |    |
| PTO_BLOCKD_26A             | No                                                |    |    |    |    |
| PTO_BLOCKD_26B             | No                                                |    |    |    |    |
| PTO_BLOCKD_27A             | No                                                |    |    |    |    |
| PTO_BLOCKD_27B             | No                                                |    |    |    |    |
| PTO_BLOCKD_28A             | No                                                |    |    |    |    |
| PTO_BLOCKD_28B             | No                                                |    |    |    |    |
| PTO_BLOCKD_29A             | No                                                |    |    |    |    |
| PTO_BLOCKD_29B             | No                                                |    |    |    |    |
| PTO_BLOCKD_30A             | No                                                |    |    |    |    |
| PTO_BLOCKD_30B             | No                                                |    |    |    |    |
| PTO_BLOCKD_31A             | No                                                |    |    |    |    |
| PTO_BLOCKD_31B             | No                                                |    |    |    |    |
| PTO_ENTRY_00A              | Yes                                               |    |    |    |    |
| PTO_ENTRY_01A              | No                                                |    |    |    |    |
| PTO_ENTRY_02A              | No                                                |    |    |    |    |
| PTO_ENTRY_03A              | No                                                |    |    |    |    |
| PTO_ENTRY_04A              | No                                                |    |    |    |    |
| PTO_ENTRY_05A              | No                                                |    |    |    |    |
| PTO_ENTRY_06A              | No                                                |    |    |    |    |
| PTO_ENTRY_07A              | Yes                                               |    |    |    |    |
| PTO_ENTRY_08A              | No                                                |    |    |    |    |
| PTO_ENTRY_09A              | No                                                |    |    |    |    |
| PTO_ENTRY_10A              | No                                                |    |    |    |    |
| PTO_ENTRY_11A              | No                                                |    |    |    |    |
| PTO_ENTRY_12A              | No                                                |    |    |    |    |
| PTO_ENTRY_13A              | No                                                |    |    |    |    |
| PTO_ENTRY_14A              | No                                                |    |    |    |    |
| PTO_ENTRY_15A              | No                                                |    |    |    |    |
| PTO_ENTRY_16A              | No                                                |    |    |    |    |
| PTO_ENTRY_17A              | No                                                |    |    |    |    |
| PTO_ENTRY_18A              | No                                                |    |    |    |    |
| PTO_ENTRY_19A              | No                                                |    |    |    |    |
| PTO_ENTRY_20A              | No                                                |    |    |    |    |
| PTO_ENTRY_21A              | No                                                |    |    |    |    |
| PTO_ENTRY_22A              | No                                                |    |    |    |    |
| PTO_ENTRY_22B              | No                                                |    |    |    |    |
| PTO_ENTRY_23A              | No                                                |    |    |    |    |
| PTO_ENTRY_23B              | No                                                |    |    |    |    |
| PTO_ENTRY_24A              | No                                                |    |    |    |    |
| PTO_ENTRY_24B              | No                                                |    |    |    |    |
| PTO_ENTRY_25A              | No                                                |    |    |    |    |
| PTO_ENTRY_25B              | No                                                |    |    |    |    |
| PTO_ENTRY_26A              | No                                                |    |    |    |    |
| PTO_ENTRY_26B              | No                                                |    |    |    |    |
| PTO_ENTRY_27A              | No                                                |    |    |    |    |
| PTO_ENTRY_27B              | Yes                                               |    |    |    |    |
| PTO_ENTRY_28A              | No                                                |    |    |    |    |
| PTO_ENTRY_28B              | No                                                |    |    |    |    |
| PTO_ENTRY_29A              | No                                                |    |    |    |    |
| PTO_ENTRY_29B              | No                                                |    |    |    |    |
| PTO_ENTRY_30A              | No                                                |    |    |    |    |
| PTO_ENTRY_30B              | No                                                |    |    |    |    |
| PTO_ENTRY_31A              | No                                                |    |    |    |    |
| PTO_ENTRY_31B              | No                                                |    |    |    |    |
| PTO_OP_STATE               | Power Takeoff Off                                 |    |    |    |    |
| PTO_REQ_SW1                | Low                                               |    |    |    |    |
| PTO_REQ_SW2                | Low                                               |    |    |    |    |
| PTO_RPM_DSD(1/min)         | 614                                               |    |    |    |    |
| PTO_STATUS                 | Off                                               |    |    |    |    |
| PWRTRN_DRVMODE             | error                                             |    |    |    |    |
| PWRT_FUNCMON_A( )          | 0                                                 |    |    |    |    |
| PWRT_FUNCMON_B( )          | 0                                                 |    |    |    |    |
| REALTIME(s)                | 839270                                            |    |    |    |    |
| REV_SW                     | Off                                               |    |    |    |    |
| RLC                        | Off                                               |    |    |    |    |
| RLC_F                      | No Fault                                          |    |    |    |    |
| RO2FT1(%)                  | -109.51                                           |    |    |    |    |
| RO2FT2(%)                  | -218.75                                           |    |    |    |    |
| RPM(1/min)                 | 11904                                             |    |    |    |    |
| RPMDSD(1/min)              | 4096                                              |    |    |    |    |
| RPM_IPC(1/min)             | 0                                                 |    |    |    |    |
| RPM_VSS_RATIO(:1)          | 0.000                                             |    |    |    |    |
| RUNTM(s)                   | 22                                                |    |    |    |    |
| SAIR_EVAL                  | No                                                |    |    |    |    |
| SELTESTDTC( )              | 0                                                 |    |    |    |    |
| SHFTLCK_ALLW               | No                                                |    |    |    |    |
| SHFTLCK_ALLW_F             | No Fault                                          |    |    |    |    |
| SHFT_DROP(1/min)           | 0                                                 |    |    |    |    |
| SHFT_FLRE(1/min)           | 0                                                 |    |    |    |    |
| SHFT_ID                    | No valid data                                     |    |    |    |    |
| SHFT_LAG(ms)               | 0.00                                              |    |    |    |    |
| SHFT_TIME(ms)              | 0.00                                              |    |    |    |    |
| SHFT_TYP                   | Auto 1st                                          |    |    |    |    |
| SHRTFT1(%)                 | 44.53                                             |    |    |    |    |
| SHRTFT2(%)                 | -100.00                                           |    |    |    |    |
| SIL                        | Off                                               |    |    |    |    |
| SMC_B_PIN                  | Off                                               |    |    |    |    |
| SMC_MON                    | Off                                               |    |    |    |    |
| SMR_ONCE                   | No                                                |    |    |    |    |
| SPARKADV(°)                | -58.00                                            |    |    |    |    |
| SPARKADV(°)                | 63.75                                             |    |    |    |    |
| SPDCTRLCC_STAT             | Not Received from Master                          |    |    |    |    |
| SSA_AMP(A)                 | 0.00                                              |    |    |    |    |
| SSB_AMP(A)                 | 5.07                                              |    |    |    |    |
| SSC_AMP(A)                 | 0.00                                              |    |    |    |    |
| SSD_AMP(A)                 | 0.03                                              |    |    |    |    |
| SSE_AMP(A)                 | 0.00                                              |    |    |    |    |
| SSF_AMP(A)                 | 0.01                                              |    |    |    |    |
| SSPCA(kPa)                 | 164.0                                             |    |    |    |    |
| SSPCA_F                    | No Fault                                          |    |    |    |    |
| SSPCB(kPa)                 | 0.0                                               |    |    |    |    |
| SSPCB_F                    | No Fault                                          |    |    |    |    |
| SSPCC(kPa)                 | 0.0                                               |    |    |    |    |
| SSPCC_F                    | No Fault                                          |    |    |    |    |
| SSPCD(kPa)                 | 146.0                                             |    |    |    |    |
| SSPCD_F                    | No Fault                                          |    |    |    |    |
| SSPCE(kPa)                 | 0.0                                               |    |    |    |    |
| SSPCE_F                    | No Fault                                          |    |    |    |    |
| SSPCF(kPa)                 | 0.0                                               |    |    |    |    |
| SSPCF_F                    | error                                             |    |    |    |    |
| SST_D                      | HIGH                                              |    |    |    |    |
| SST_U                      | HIGH                                              |    |    |    |    |
| SS_ABS_TC_IN               | Fault - ABS or network error                      |    |    |    |    |
| SS_CTRL_CRANK              | No Crank command                                  |    |    |    |    |
| SS_CTRL_STATE              | Run - Operational                                 |    |    |    |    |
| SS_DISABL_00               | No                                                |    |    |    |    |
| SS_DISABL_01               | No                                                |    |    |    |    |
| SS_DISABL_02               | No                                                |    |    |    |    |
| SS_DISABL_03               | No                                                |    |    |    |    |
| SS_DISABL_04               | No                                                |    |    |    |    |
| SS_DISABL_05               | No                                                |    |    |    |    |
| SS_DISABL_06               | No                                                |    |    |    |    |
| SS_DISABL_07               | No                                                |    |    |    |    |
| SS_DISABL_08               | No                                                |    |    |    |    |
| SS_DISABL_09               | No                                                |    |    |    |    |
| SS_DISABL_10               | No                                                |    |    |    |    |
| SS_DISABL_11               | No                                                |    |    |    |    |
| SS_DISABL_12               | No                                                |    |    |    |    |
| SS_DISABL_13               | No                                                |    |    |    |    |
| SS_DISABL_14               | No                                                |    |    |    |    |
| SS_DISABL_15               | No                                                |    |    |    |    |
| SS_DISABL_16               | No                                                |    |    |    |    |
| SS_DISABL_17               | No                                                |    |    |    |    |
| SS_DISABL_18               | No                                                |    |    |    |    |
| SS_DISABL_19               | No                                                |    |    |    |    |
| SS_DISABL_20               | No                                                |    |    |    |    |
| SS_DRVR INPUTS             | Stop Allowed                                      |    |    |    |    |
| SS_INHIB_AT_00             | No                                                |    |    |    |    |
| SS_INHIB_AT_01             | No                                                |    |    |    |    |
| SS_INHIB_AT_02             | No                                                |    |    |    |    |
| SS_INHIB_AT_03             | No                                                |    |    |    |    |
| SS_INHIB_AT_04             | No                                                |    |    |    |    |
| SS_INHIB_AT_05             | No                                                |    |    |    |    |
| SS_INHIB_AT_06             | No                                                |    |    |    |    |
| SS_INHIB_AT_07             | No                                                |    |    |    |    |
| SS_INHIB_EC00              | No                                                |    |    |    |    |
| SS_INHIB_EC01              | No                                                |    |    |    |    |
| SS_INHIB_EC02              | No                                                |    |    |    |    |
| SS_INHIB_EC03              | No                                                |    |    |    |    |
| SS_INHIB_EC04              | No                                                |    |    |    |    |
| SS_INHIB_EC05              | No                                                |    |    |    |    |
| SS_INHIB_EC06              | No                                                |    |    |    |    |
| SS_INHIB_EC07              | No                                                |    |    |    |    |
| SS_INHIB_EC08              | No                                                |    |    |    |    |
| SS_INHIB_EC09              | No                                                |    |    |    |    |
| SS_INHIB_EC10              | No                                                |    |    |    |    |
| SS_INHIB_EC11              | No                                                |    |    |    |    |
| SS_INHIB_EC12              | No                                                |    |    |    |    |
| SS_INHIB_EC13              | No                                                |    |    |    |    |
| SS_INHIB_EC14              | No                                                |    |    |    |    |
| SS_INHIB_EC15              | No                                                |    |    |    |    |
| SS_INHIB_EC16              | No                                                |    |    |    |    |
| SS_INHIB_EC17              | No                                                |    |    |    |    |
| SS_INHIB_EC18              | No                                                |    |    |    |    |
| SS_INHIB_EC19              | No                                                |    |    |    |    |
| SS_INHIB_EC20              | No                                                |    |    |    |    |
| SS_INHIB_EC21              | No                                                |    |    |    |    |
| SS_INHIB_EC22              | No                                                |    |    |    |    |
| SS_INHIB_EC23              | No                                                |    |    |    |    |
| SS_INHIB_EC24              | No                                                |    |    |    |    |
| SS_INHIB_EC26              | No                                                |    |    |    |    |
| SS_INHIB_EC27              | No                                                |    |    |    |    |
| SS_INHIB_G1_00             | No                                                |    |    |    |    |
| SS_INHIB_G1_01             | No                                                |    |    |    |    |
| SS_INHIB_G1_02             | No                                                |    |    |    |    |
| SS_INHIB_G1_03             | No                                                |    |    |    |    |
| SS_INHIB_G1_04             | No                                                |    |    |    |    |
| SS_INHIB_G1_05             | No                                                |    |    |    |    |
| SS_INHIB_G1_06             | No                                                |    |    |    |    |
| SS_INHIB_G1_07             | No                                                |    |    |    |    |
| SS_INHIB_G1_08             | No                                                |    |    |    |    |
| SS_INHIB_G1_09             | No                                                |    |    |    |    |
| SS_INHIB_G1_10             | No                                                |    |    |    |    |
| SS_INHIB_G1_11             | No                                                |    |    |    |    |
| SS_INHIB_G1_12             | No                                                |    |    |    |    |
| SS_INHIB_G1_13             | No                                                |    |    |    |    |
| SS_INHIB_G1_14             | No                                                |    |    |    |    |
| SS_INHIB_G1_15             | No                                                |    |    |    |    |
| SS_INHIB_G1_16             | No                                                |    |    |    |    |
| SS_INHIB_G1_17             | No                                                |    |    |    |    |
| SS_INHIB_G1_18             | No                                                |    |    |    |    |
| SS_INHIB_G1_19             | No                                                |    |    |    |    |
| SS_INHIB_G1_20             | No                                                |    |    |    |    |
| SS_INHIB_G1_21             | No                                                |    |    |    |    |
| SS_INHIB_G1_22             | No                                                |    |    |    |    |
| SS_INHIB_G1_23             | No                                                |    |    |    |    |
| SS_INHIB_G2_00             | No                                                |    |    |    |    |
| SS_INHIB_G2_01             | No                                                |    |    |    |    |
| SS_INHIB_G2_02             | No                                                |    |    |    |    |
| SS_INHIB_G2_03             | No                                                |    |    |    |    |
| SS_INHIB_G2_04             | No                                                |    |    |    |    |
| SS_INHIB_G2_05             | No                                                |    |    |    |    |
| SS_INHIB_G2_06             | No                                                |    |    |    |    |
| SS_INHIB_G2_07             | No                                                |    |    |    |    |
| SS_INHIB_G2_08             | Yes                                               |    |    |    |    |
| SS_INHIB_G2_09             | No                                                |    |    |    |    |
| SS_INHIB_G2_10             | No                                                |    |    |    |    |
| SS_INHIB_G2_11             | No                                                |    |    |    |    |
| SS_INHIB_G2_12             | No                                                |    |    |    |    |
| SS_INHIB_G2_13             | No                                                |    |    |    |    |
| SS_INHIB_G2_14             | No                                                |    |    |    |    |
| SS_INHIB_G2_15             | No                                                |    |    |    |    |
| SS_INHIB_G2_16             | No                                                |    |    |    |    |
| SS_INHIB_G2_17             | No                                                |    |    |    |    |
| SS_INHIB_G2_18             | No                                                |    |    |    |    |
| SS_INHIB_G2_19             | No                                                |    |    |    |    |
| SS_INHIB_G2_20             | No                                                |    |    |    |    |
| SS_INHIB_G2_21             | No                                                |    |    |    |    |
| SS_INHIB_G2_22             | No                                                |    |    |    |    |
| SS_INHIB_G2_23             | No                                                |    |    |    |    |
| SS_INHIB_G2_24             | No                                                |    |    |    |    |
| SS_INHIB_G2_25             | No                                                |    |    |    |    |
| SS_INHIB_G2_26             | No                                                |    |    |    |    |
| SS_INHIB_G2_27             | No                                                |    |    |    |    |
| SS_INHIB_G2_28             | No                                                |    |    |    |    |
| SS_INHIB_G2_29             | No                                                |    |    |    |    |
| SS_MON_STATE               | Run - Operational                                 |    |    |    |    |
| SS_MON_TIMER( )            | 0                                                 |    |    |    |    |
| SS_OUTOP                   | Normal                                            |    |    |    |    |
| SS_SHIFTER_IN              | Park / Neutral                                    |    |    |    |    |
| SS_SPEED_INPUT             | Speed Sensor Fault                                |    |    |    |    |
| SS_START_ERR               | No Error                                          |    |    |    |    |
| SS_STOP_ERR                | No Error                                          |    |    |    |    |
| SS_STRTR_HEAT              | Cold                                              |    |    |    |    |
| SS_STRT_INHB_00            | No                                                |    |    |    |    |
| SS_STRT_INHB_01            | No                                                |    |    |    |    |
| SS_STRT_INHB_02            | No                                                |    |    |    |    |
| SS_STRT_INHB_03            | Yes                                               |    |    |    |    |
| SS_STRT_INHB_04            | Yes                                               |    |    |    |    |
| SS_STRT_INHB_05            | No                                                |    |    |    |    |
| SS_STRT_INHB_06            | No                                                |    |    |    |    |
| SS_STRT_INHB_07            | No                                                |    |    |    |    |
| STARTENB_HI                | Disabled                                          |    |    |    |    |
| STARTENB_LOW               | Disabled                                          |    |    |    |    |
| STARTER_CNTRL              | Normal Mode                                       |    |    |    |    |
| STARTER_CNTS( )            | 0                                                 |    |    |    |    |
| STARTER_PROT               | Cleared State - Not Preventing Start              |    |    |    |    |
| STARTREQ_CAN               | No                                                |    |    |    |    |
| START_KEY                  | Off                                               |    |    |    |    |
| STRT_BLCK_A_00             | No                                                |    |    |    |    |
| STRT_BLCK_A_01             | No                                                |    |    |    |    |
| STRT_BLCK_A_02             | No                                                |    |    |    |    |
| STRT_BLCK_A_03             | No                                                |    |    |    |    |
| STRT_BLCK_A_04             | No                                                |    |    |    |    |
| STRT_BLCK_A_05             | Yes                                               |    |    |    |    |
| STRT_BLCK_A_06             | No                                                |    |    |    |    |
| STRT_BLCK_A_07             | No                                                |    |    |    |    |
| STRT_BLCK_A_08             | No                                                |    |    |    |    |
| STRT_BLCK_A_09             | No                                                |    |    |    |    |
| STRT_BLCK_A_10             | No                                                |    |    |    |    |
| STRT_BLCK_A_11             | No                                                |    |    |    |    |
| STRT_BLCK_A_12             | No                                                |    |    |    |    |
| STRT_BLCK_A_13             | No                                                |    |    |    |    |
| STRT_BLCK_A_14             | No                                                |    |    |    |    |
| STRT_BLCK_A_15             | No                                                |    |    |    |    |
| STRT_BLCK_A_16             | No                                                |    |    |    |    |
| STRT_BLCK_A_17             | No                                                |    |    |    |    |
| STRT_BLCK_A_18             | No                                                |    |    |    |    |
| STRT_BLCK_A_19             | No                                                |    |    |    |    |
| STRT_BLCK_A_21             | No                                                |    |    |    |    |
| STRT_BLCK_A_22             | No                                                |    |    |    |    |
| STRT_BLCK_A_23             | No                                                |    |    |    |    |
| STRT_BLCK_A_24             | No                                                |    |    |    |    |
| STRT_BLCK_A_25             | No                                                |    |    |    |    |
| STRT_BLCK_A_26             | No                                                |    |    |    |    |
| STRT_BLCK_A_27             | No                                                |    |    |    |    |
| STRT_BLCK_A_28             | No                                                |    |    |    |    |
| STRT_BLCK_A_29             | No                                                |    |    |    |    |
| STRT_BLCK_A_31             | No                                                |    |    |    |    |
| STRT_BLCK_B_00             | Yes                                               |    |    |    |    |
| STRT_BLCK_B_01             | No                                                |    |    |    |    |
| STRT_BLCK_B_02             | No                                                |    |    |    |    |
| STRT_BLCK_B_10             | No                                                |    |    |    |    |
| STRT_BLCK_B_11             | No                                                |    |    |    |    |
| STRT_BLCK_B_12             | No                                                |    |    |    |    |
| STRT_BLCK_B_13             | No                                                |    |    |    |    |
| STRT_BLCK_B_15             | No                                                |    |    |    |    |
| STRT_RLY                   | Enabled                                           |    |    |    |    |
| STR_CRNKV_PER(%)           | 50.00                                             |    |    |    |    |
| SYNC                       | Yes                                               |    |    |    |    |
| TAC_PCT(%)                 | 22.75                                             |    |    |    |    |
| TCBP(kPa)                  | 0.2                                               |    |    |    |    |
| TCBP_DSD(kPa)              | 9.0                                               |    |    |    |    |
| TCBP_UR                    | No Fault                                          |    |    |    |    |
| TCBP_V(V)                  | 5.63                                              |    |    |    |    |
| TCC(kPa)                   | 0.0                                               |    |    |    |    |
| TCC AMP(A)                 | 0.00                                              |    |    |    |    |
| TCC_F                      | No Fault                                          |    |    |    |    |
| TCC_OSC                    | Trans Control                                     |    |    |    |    |
| TCC_RAT(:1)                | 0.966                                             |    |    |    |    |
| TCFT_F                     | No Fault                                          |    |    |    |    |
| TCIL                       | Off                                               |    |    |    |    |
| TCS_DEPRES                 | No                                                |    |    |    |    |
| TCS_STATE                  | Off                                               |    |    |    |    |
| TC_SLIPACT(1/min)          | 24                                                |    |    |    |    |
| TC_SLIPDSD(1/min)          | 1023                                              |    |    |    |    |
| TFT(°C)                    | 37                                                |    |    |    |    |
| TFTV(V)                    | 1.35                                              |    |    |    |    |
| TFT_F                      | No Fault                                          |    |    |    |    |
| TFT_QF                     | Good - Confirmed                                  |    |    |    |    |
| THL_ANG_COR(%)             | 0.00                                              |    |    |    |    |
| TIRECC_STAT                | Data Valid or Not Used                            |    |    |    |    |
| TOTAL_DIST(km)             | 8392704.0                                         |    |    |    |    |
| TP(%)                      | 40.00                                             |    |    |    |    |
| TP1_LRN_TRIM(°)            | 0.00                                              |    |    |    |    |
| TP2_LRN_TRIM(°)            | 0.00                                              |    |    |    |    |
| TPS1_LRN_STA               | Aborted                                           |    |    |    |    |
| TPS2_LRN_STA               | Aborted                                           |    |    |    |    |
| TPS3_LRN_OFS(°)            | 2.00                                              |    |    |    |    |
| TPS3_LRN_STA               | Aborted                                           |    |    |    |    |
| TPS_NUM( )                 | 0                                                 |    |    |    |    |
| TP_A_2NDRCNT_F             | No Fault                                          |    |    |    |    |
| TP_A_FAULT_CNTR( )         | 0                                                 |    |    |    |    |
| TP_A_MSG_CNTR( )           | 3770                                              |    |    |    |    |
| TP_A_RCNT_F                | No Fault                                          |    |    |    |    |
| TP_F                       | No Fault                                          |    |    |    |    |
| TP_REL(%)                  | 0.00                                              |    |    |    |    |
| TQ_ACT(%)                  | -125.00                                           |    |    |    |    |
| TQ_CNTRL                   | Idle Speed Control                                |    |    |    |    |
| TQ_FRICTION(%)             | 80.00                                             |    |    |    |    |
| TQ_REF(Nm)                 | 0.0                                               |    |    |    |    |
| TR                         | error                                             |    |    |    |    |
| TR1                        | Closed                                            |    |    |    |    |
| TR2                        | Closed                                            |    |    |    |    |
| TR3                        | Closed                                            |    |    |    |    |
| TR4                        | Closed                                            |    |    |    |    |
| TRANS_CLT_STAT             | Park or Neutral-Transmission clutch is disengaged |    |    |    |    |
| TRANS_PMP_CMD(%)           | 0.00                                              |    |    |    |    |
| TRANS_PMP_Hz(Hz)           | 0                                                 |    |    |    |    |
| TRANS_PMP_MEAS(%)          | 1.86                                              |    |    |    |    |
| TRANS_VOLT_A               | On                                                |    |    |    |    |
| TRAN_RAT(:1)               | 10.000                                            |    |    |    |    |
| TRO_N_F                    | On                                                |    |    |    |    |
| TRO_P_F                    | Off                                               |    |    |    |    |
| TR_A_UR                    | Yes Fault                                         |    |    |    |    |
| TR_B_DC(%)                 | 32.85                                             |    |    |    |    |
| TR_B_FREQ(Hz)              | 2                                                 |    |    |    |    |
| TR_CRANK                   | Yes                                               |    |    |    |    |
| TR_CRANK_F                 | No Fault                                          |    |    |    |    |
| TR_DC(%)                   | 15.83                                             |    |    |    |    |
| TR_F                       | No Fault                                          |    |    |    |    |
| TR_FREQ(Hz)                | 0                                                 |    |    |    |    |
| TR_PARK_STAT               | Unknown                                           |    |    |    |    |
| TR_PAWL_NOTPARK            | FALSE                                             |    |    |    |    |
| TR_QF                      | error                                             |    |    |    |    |
| TSS_F                      | No Fault                                          |    |    |    |    |
| TSS_QF                     | Failed - Confirmed                                |    |    |    |    |
| TSS_RAW(1/min)             | 0                                                 |    |    |    |    |
| TURBO_BP1_STAT             | No Fault                                          |    |    |    |    |
| TURBO_BPASS                | OFF                                               |    |    |    |    |
| TURBO_INLET_F              | No Fault                                          |    |    |    |    |
| TURBO_OVER                 | No Fault                                          |    |    |    |    |
| TURBO_UNDER                | No Fault                                          |    |    |    |    |
| TURBO_WGATE(%)             | 0.00                                              |    |    |    |    |
| TWGATE_STAT                | No Fault                                          |    |    |    |    |
| VACCV_CMD(%)               | 2.35                                              |    |    |    |    |
| VCT1_EXH_F                 | No Fault                                          |    |    |    |    |
| VCT1_INTK_F                | No Fault                                          |    |    |    |    |
| VCT2_EXH_F                 | No Fault                                          |    |    |    |    |
| VCT2_INTK_F                | No Fault                                          |    |    |    |    |
| VCTSYS                     | Open Loop                                         |    |    |    |    |
| VCT_EXH_ACT1(°)            | -1365.38                                          |    |    |    |    |
| VCT_EXH_ACT2(°)            | 1549.75                                           |    |    |    |    |
| VCT_EXH_DC1(%)             | 0.00                                              |    |    |    |    |
| VCT_EXH_DC2(%)             | 0.00                                              |    |    |    |    |
| VCT_EXH_DIF1(°)            | 0.00                                              |    |    |    |    |
| VCT_EXH_DIF2(°)            | 0.00                                              |    |    |    |    |
| VCT_EXH_DSD(°)             | 0.00                                              |    |    |    |    |
| VCT_INTK_DSD(°)            | 0.00                                              |    |    |    |    |
| VCT_INT_ACT1(°)            | 0.00                                              |    |    |    |    |
| VCT_INT_ACT2(°)            | 0.00                                              |    |    |    |    |
| VCT_INT_DC1(%)             | 0.00                                              |    |    |    |    |
| VCT_INT_DC2(%)             | 0.00                                              |    |    |    |    |
| VCT_INT_DIF1(°)            | 0.00                                              |    |    |    |    |
| VCT_INT_DIF2(°)            | 0.00                                              |    |    |    |    |
| VEHMODE                    | Normal                                            |    |    |    |    |
| VEH_FUEL_RATE(g/s)         | 0.00                                              |    |    |    |    |
| VEH_ODO(km)                | 185.7                                             |    |    |    |    |
| VEH_SPD_LO_LIM(km/h)       | 0.0                                               |    |    |    |    |
| VEH_SPD_UP_LIM(km/h)       | 0.0                                               |    |    |    |    |
| VINCC_STAT                 | Data Valid or Not Used                            |    |    |    |    |
| VPWR(V)                    | 0.00                                              |    |    |    |    |
| VREF(V)                    | 63.23                                             |    |    |    |    |
| VSOUT_F                    | No Fault                                          |    |    |    |    |
| VSS(km/h)                  | 172.0                                             |    |    |    |    |
| VSS_HR(km/h)               | 1.0                                               |    |    |    |    |
| WARM_UPS( )                | 18                                                |    |    |    |    |
| WFS                        | No                                                |    |    |    |    |
| WGATE_PRES_F               | No Fault                                          |    |    |    |    |
| WIF_ACTIVE                 | No                                                |    |    |    |    |

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| EPAS_MOTOR_CUR(A)          | 79.10                                             |    |    |    |    |
| GLOBTIM(s)                 | 0                                                 |    |    |    |    |
| MOD_SUP_V(V)               | 0.10                                              |    |    |    |    |
| PDC_VALUE(Nm)              | 0.0                                               |    |    |    |    |
| PSCM_DState                | Default                                           |    |    |    |    |
| PSCM_INT_TEMP(°C)          | -39                                               |    |    |    |    |
| PWR_MODE_KEY               | Key Recently Out                                  |    |    |    |    |
| PWR_MODE_QF                | Power Mode Undefined                              |    |    |    |    |
| SSHFT_TQ_S2(Nm)            | -12.8                                             |    |    |    |    |
| STEER_FEEL                 | Sport                                             |    |    |    |    |
| STEER_PIN_ANG(°)           | -78.00                                            |    |    |    |    |
| STEER_PIN_SPD(1/min)       | 0                                                 |    |    |    |    |
| ST_DTC_CNT( )              | 1                                                 |    |    |    |    |
| SWA_ALIG_OS(°)             | 0.00                                              |    |    |    |    |
| TOTAL_DIST(km)             | 262144.0                                          |    |    |    |    |


#


| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| AIRBAG_ENBL                | Disable                                           |    |    |    |    |
| AIRWARNLAMP                | Off                                               |    |    |    |    |
| BLT_CUR_D(mA)              | 20.00                                             |    |    |    |    |
| BLT_CUR_P(mA)              | 12.60                                             |    |    |    |    |
| BLT_CUR_R1C(mA)            | 0.00                                              |    |    |    |    |
| BLT_CUR_R2C(mA)            | 0.00                                              |    |    |    |    |
| BLT_CUR_R2D(mA)            | 0.20                                              |    |    |    |    |
| BLT_CUR_R2P(mA)            | 0.00                                              |    |    |    |    |
| BLT_CUR_R3C(mA)            | 14.00                                             |    |    |    |    |
| BLT_CUR_R3D(mA)            | 14.00                                             |    |    |    |    |
| BLT_CUR_R3P(mA)            | 0.00                                              |    |    |    |    |
| BLT_ST_DRV                 | Unbuckled                                         |    |    |    |    |
| BLT_ST_PSR                 | Buckled                                           |    |    |    |    |
| BLT_ST_R1M                 | Unbuckled                                         |    |    |    |    |
| BLT_ST_R2D                 | Unbuckled                                         |    |    |    |    |
| BLT_ST_R2M                 | Unbuckled                                         |    |    |    |    |
| BLT_ST_R2P                 | Unbuckled                                         |    |    |    |    |
| BLT_ST_R3D                 | Unbuckled                                         |    |    |    |    |
| BLT_ST_R3M                 | Unbuckled                                         |    |    |    |    |
| BLT_ST_R3P                 | Unbuckled                                         |    |    |    |    |
| CRSH_FAT                   | No                                                |    |    |    |    |
| CRSH_ROLT                  | No                                                |    |    |    |    |
| CRSH_SATT                  | No                                                |    |    |    |    |
| CRSH_ST_LVL1               | No                                                |    |    |    |    |
| CRSH_ST_LVL2               | No                                                |    |    |    |    |
| DEPLOY_00_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_01_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_02_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_03_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_04_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_05_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_06_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_07_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_08_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_09_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_10_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_11_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_12_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_13_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_14_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_15_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_16_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_17_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_18_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_19_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_20_R(Ω)             | 2                                                 |    |    |    |    |
| DEPLOY_21_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_22_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_23_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_24_R(Ω)             | 1                                                 |    |    |    |    |
| DEPLOY_25_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_26_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_27_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_28_R(Ω)             | 0                                                 |    |    |    |    |
| DEPLOY_29_RES(Ω)           | 0                                                 |    |    |    |    |
| DEPLOY_30_RES(Ω)           | 0                                                 |    |    |    |    |
| DEPLOY_31_RES(Ω)           | 0                                                 |    |    |    |    |
| DEPLOY_32_RES(Ω)           | 0                                                 |    |    |    |    |
| DEPLOY_33_RES(Ω)           | 0                                                 |    |    |    |    |
| DEPLOY_42_RES(Ω)           | 0                                                 |    |    |    |    |
| DEPLOY_43_RES(Ω)           | 0                                                 |    |    |    |    |
| ECU_VPWR_RCM(V)            | 0.00                                              |    |    |    |    |
| ENRGY_STDWN                | No                                                |    |    |    |    |
| FUEL_CUT_RQ                | error                                             |    |    |    |    |
| GEN_RED_LMP                | Off                                               |    |    |    |    |
| IFC_D703( )                | 0                                                 |    |    |    |    |
| LMP_PAE                    | OFF                                               |    |    |    |    |
| OCS_STAT                   | Empty                                             |    |    |    |    |
| PAD_CO_SW                  | Off                                               |    |    |    |    |
| PAD_SW_FLT                 | No fault                                          |    |    |    |    |
| PAIROFFL(%)                | 0.00                                              |    |    |    |    |
| PAIRONLV(%)                | 0.00                                              |    |    |    |    |
| PA_DAL_ST                  | OFF                                               |    |    |    |    |
| PPD_RES(Ω)                 | 0                                                 |    |    |    |    |
| P_AB_LMP_LVL(%)            | 0.00                                              |    |    |    |    |
| P_AB_OFF_SERV              | FALSE                                             |    |    |    |    |
| RCM_STAT                   | error                                             |    |    |    |    |
| RDS_SEN_A_P(mA)            | 0.00                                              |    |    |    |    |
| RDS_SEN_B_P(mA)            | 41.40                                             |    |    |    |    |
| REST_STAT_P                | Enabled                                           |    |    |    |    |
| ROLL_SENS_1                | Disabled                                          |    |    |    |    |
| ROLL_SENS_2                | Disabled                                          |    |    |    |    |
| SEAT_TSF_D                 | No fault                                          |    |    |    |    |
| SEAT_TSF_P                 | No fault                                          |    |    |    |    |
| SEAT_TSS_D                 | Rearward                                          |    |    |    |    |
| SEAT_TSS_P                 | Rearward                                          |    |    |    |    |
| SELTESTDTC( )              | 0                                                 |    |    |    |    |
| SRS_SERV_REQ               | FALSE                                             |    |    |    |    |
| SRS_SERV_URG               | FALSE                                             |    |    |    |    |
| STPR_SEN_D(mA)             | 0.00                                              |    |    |    |    |
| STPR_SEN_P(mA)             | 0.00                                              |    |    |    |    |
| ST_OCC_ST                  | Not occupied                                      |    |    |    |    |
| ST_OCC_ST_C                | Not occupied                                      |    |    |    |    |
| TOTAL_DIST(km)             | 0.0                                               |    |    |    |    |
| V_ID_14229_RCM             | error                                             |    |    |    |    |
| WARN_IND_REQ               | No                                                |    |    |    |    |
| YL_INFO_LMP                | Off                                               |    |    |    |    |

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| Act_Diag_Ses               | error                                             |    |    |    |    |
| CORRUPT_CNT( )             | 0                                                 |    |    |    |    |
| Diag_Test_DTCs( )          | 0                                                 |    |    |    |    |
| ECU_VPWR(V)                | 0.00                                              |    |    |    |    |
| F1F9_B1T4( )               | 0                                                 |    |    |    |    |
| F1F9_B5T8( )               | 0                                                 |    |    |    |    |
| F1F9_B9T12( )              | 0                                                 |    |    |    |    |
| ILL_OP_CNT( )              | 0                                                 |    |    |    |    |
| LOOP_OF_CNT( )             | 0                                                 |    |    |    |    |
| Lst_Xm_ID_Cd( )            | 0                                                 |    |    |    |    |
| MIN_IDLE( )                | 0                                                 |    |    |    |    |
| N_KEYCODE( )               | 3                                                 |    |    |    |    |
| N_PERIPHERAL( )            | 129                                               |    |    |    |    |
| POWER_CNT( )               | 0                                                 |    |    |    |    |
| STACK_OF_CNT( )            | 0                                                 |    |    |    |    |
| STRAT_SW_NUM( )            | 481                                               |    |    |    |    |
| TIC_1( )                   | 1153                                              |    |    |    |    |
| TIC_10( )                  | 1153                                              |    |    |    |    |
| TIC_2( )                   | 1153                                              |    |    |    |    |
| TIC_3( )                   | 1153                                              |    |    |    |    |
| TIC_4( )                   | 1153                                              |    |    |    |    |
| TIC_5( )                   | 168034304                                         |    |    |    |    |
| TIC_6( )                   | 168034304                                         |    |    |    |    |
| TIC_7( )                   | 1153                                              |    |    |    |    |
| TIC_8( )                   | 168034304                                         |    |    |    |    |
| TIC_9( )                   | 3                                                 |    |    |    |    |
| TPM_RFR_01( )              | 0                                                 |    |    |    |    |
| TPM_RFR_02( )              | 3                                                 |    |    |    |    |
| TPM_RFR_03( )              | 2D                                                |    |    |    |    |
| TPM_RFR_04( )              | A040000                                           |    |    |    |    |
| TPM_RFR_05( )              | 481                                               |    |    |    |    |
| TPM_RFR_06( )              | 481                                               |    |    |    |    |
| WDG_RST_CNT( )             | 4                                                 |    |    |    |    |
| DIAG_SESSION               | Extended                                          |    |    |    |    |
| ELSW_AUTO                  | OFF                                               |    |    |    |    |
| ELSW_AUXDL                 | OFF                                               |    |    |    |    |
| ELSW_BRAKE                 | OFF                                               |    |    |    |    |
| ELSW_FLASH                 | OFF                                               |    |    |    |    |
| ELSW_HIBEAM                | OFF                                               |    |    |    |    |
| ELSW_HZWRN                 | OFF                                               |    |    |    |    |
| ELSW_LOBEAM                | OFF                                               |    |    |    |    |
| ELSW_SIDE                  | OFF                                               |    |    |    |    |
| ELSW_SVF                   | OFF                                               |    |    |    |    |
| ELSW_TN_L                  | OFF                                               |    |    |    |    |
| ELSW_TN_LA_L               | OFF                                               |    |    |    |    |
| ELSW_TN_LA_R               | OFF                                               |    |    |    |    |
| ELSW_TN_R                  | OFF                                               |    |    |    |    |
| F_WASH_SW                  | Off                                               |    |    |    |    |
| F_WIPE_FAST_SW             | Off                                               |    |    |    |    |
| F_WIPE_INT_SW              | Off                                               |    |    |    |    |
| F_WIPE_LIMP                | Off                                               |    |    |    |    |
| F_WIPE_PARK_SW             | Off                                               |    |    |    |    |
| F_WIP_INT_D1               | On                                                |    |    |    |    |
| F_WIP_INT_D2               | Off                                               |    |    |    |    |
| F_WIP_INT_D3               | Off                                               |    |    |    |    |
| F_WIP_INT_D4               | Off                                               |    |    |    |    |
| F_WIP_INT_D5               | On                                                |    |    |    |    |
| F_WIP_INT_D6               | Off                                               |    |    |    |    |
| F_WIP_INT_D7               | Off                                               |    |    |    |    |
| F_WIP_SLO_SW               | Off                                               |    |    |    |    |
| LA_SW_ST                   | Not Pressed                                       |    |    |    |    |
| L_CURS_DWN                 | Down RELEASED                                     |    |    |    |    |
| L_CURS_LFT                 | Left RELEASED                                     |    |    |    |    |
| L_CURS_OK                  | Ok RELEASED                                       |    |    |    |    |
| L_CURS_RGT                 | Right RELEASED                                    |    |    |    |    |
| L_CURS_UP                  | Up RELEASED                                       |    |    |    |    |
| RAIN_SENS                  | Off                                               |    |    |    |    |
| R_WASH_SW                  | Off                                               |    |    |    |    |
| R_WIPE_DEL1                | Off                                               |    |    |    |    |
| R_WIPE_DEL2                | Off                                               |    |    |    |    |
| R_WIPE_INT_SW              | Off                                               |    |    |    |    |
| R_WIPE_OFF_SW              | Off                                               |    |    |    |    |
| R_WIPE_PARK_SW             | Off                                               |    |    |    |    |
| R_WIPE_SW                  | Off                                               |    |    |    |    |
| R_WIPE_WASH_SW             | Off                                               |    |    |    |    |
| SCCS                       | Not Available                                     |    |    |    |    |
| SC_ASLD                    | OFF                                               |    |    |    |    |
| SC_CANCEL                  | OFF                                               |    |    |    |    |
| SC_CAN_RES                 | OFF                                               |    |    |    |    |
| SC_GAP                     | OFF                                               |    |    |    |    |
| SC_GAP+                    | OFF                                               |    |    |    |    |
| SC_GAP-                    | OFF                                               |    |    |    |    |
| SC_MF_IN_A                 | FALSE                                             |    |    |    |    |
| SC_OFF                     | OFF                                               |    |    |    |    |
| SC_ON                      | OFF                                               |    |    |    |    |
| SC_ON_OFF                  | OFF                                               |    |    |    |    |
| SC_ON_OFF_CAN              | OFF                                               |    |    |    |    |
| SC_RESUME                  | OFF                                               |    |    |    |    |
| SC_SET+                    | OFF                                               |    |    |    |    |
| SC_SET-                    | OFF                                               |    |    |    |    |
| SC_SW_FLT                  | No                                                |    |    |    |    |
| SC_TJA                     | OFF                                               |    |    |    |    |
| SW_END                     | RELEASED                                          |    |    |    |    |
| SW_MEDIA                   | RELEASED                                          |    |    |    |    |
| SW_MENUMINUS               | RELEASED                                          |    |    |    |    |
| SW_MENUPLUS                | RELEASED                                          |    |    |    |    |
| SW_MODE                    | RELEASED                                          |    |    |    |    |
| SW_MUTE                    | RELEASED                                          |    |    |    |    |
| SW_OK                      | RELEASED                                          |    |    |    |    |
| SW_PHONE                   | RELEASED                                          |    |    |    |    |
| SW_SEEKMINUS               | RELEASED                                          |    |    |    |    |
| SW_SEEKPLUS                | RELEASED                                          |    |    |    |    |
| SW_SEND                    | RELEASED                                          |    |    |    |    |
| SW_VOICE                   | RELEASED                                          |    |    |    |    |
| SW_VOLDOWN                 | RELEASED                                          |    |    |    |    |
| SW_VOLUP                   | RELEASED                                          |    |    |    |    |
| VBAT_SCCM(V)               | 6.00                                              |    |    |    |    |
| WIPE_SINGLE                | Off                                               |    |    |    |    |

## SODL - Side Obstacle Detection Left
| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| Act_Diag_Ses               | error                                             |    |    |    |    |
| CORRUPT_CNT( )             | 6                                                 |    |    |    |    |
| ILL_OP_CNT( )              | 3                                                 |    |    |    |    |
| LOOP_OF_CNT( )             | 3                                                 |    |    |    |    |
| MIN_IDLE( )                | 0                                                 |    |    |    |    |
| POWER_CNT( )               | 0                                                 |    |    |    |    |
| SELTESTDTC( )              | 91                                                |    |    |    |    |
| SOD_LAMP                   | error                                             |    |    |    |    |
| STACK_OF_CNT( )            | 0                                                 |    |    |    |    |
| VPWR_L(V)                  | 0.00                                              |    |    |    |    |
| VSS_SODL(km/h)             | 0.0                                               |    |    |    |    |
| WDG_RST_CNT( )             | 0                                                 |    |    |    |    |
| WRN_IND_L                  | Off                                               |    |    |    |    |

## SODR - Side Obstacle Detection Right
| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| Act_Diag_Ses               | error                                             |    |    |    |    |
| CORRUPT_CNT( )             | 0                                                 |    |    |    |    |
| ILL_OP_CNT( )              | 0                                                 |    |    |    |    |
| LOOP_OF_CNT( )             | 0                                                 |    |    |    |    |
| MIN_IDLE( )                | 0                                                 |    |    |    |    |
| POWER_CNT( )               | 0                                                 |    |    |    |    |
| SELTESTDTC( )              | 0                                                 |    |    |    |    |
| SOD_LAMP                   | nan                                               |    |    |    |    |
| STACK_OF_CNT( )            | 0                                                 |    |    |    |    |
| VPWR_R(V)                  | 0.00                                              |    |    |    |    |
| VSS_SODR(km/h)             | 65.0                                              |    |    |    |    |
| WDG_RST_CNT( )             | 0                                                 |    |    |    |    |
| WRN_IND_R                  | Off                                               |    |    |    |    |

## TCU - Telematics Control Unit
| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| AUTH_STATE                 | ePID/eWID - Connecting To Operational Server      |    |    |    |    |
| CELL_SIGNAL( )             | 0                                                 |    |    |    |    |
| Country Identity_TCU( )    | 1807                                              |    |    |    |    |
| KEYPOS                     | Key Out                                           |    |    |    |    |
| Network Identity_TCU( )    | 1708                                              |    |    |    |    |
| SELTESTDTC( )              | 131                                               |    |    |    |    |
| TCU_STATE                  | error                                             |    |    |    |    |
| VPWR_TCU(V)                | 4.00                                              |    |    |    |    |
| DTC_CNT( )                 | 0                                                 |    |    |    |    |
| L INDICATOR                | Off                                               |    |    |    |    |
| PWR_PT_RLY                 | error                                             |    |    |    |    |
| STOP_LMP_CHM               | error                                             |    |    |    |    |
| STOP_LMP_RT                | Active                                            |    |    |    |    |
| STO_POS_LMP                | Inactive                                          |    |    |    |    |
| STO_TRN_IND_R              | Inactive                                          |    |    |    |    |
| TRM_DIAGSTATE              | Default                                           |    |    |    |    |
| VPWR(V)                    | 0.10                                              |    |    |    |    |

| PID                        | Value (row 500)                                   |    |    |    |    |
|:---------------------------|:--------------------------------------------------|:---|:---|:---|:---|
| BRAKE_SW                   | Off                                               |    |    |    |    |
| CONSTAT                    | Off                                               |    |    |    |    |
| CORRUPT_CNT( )             | 1                                                 |    |    |    |    |
| DSWSTAT                    | Courtesy On                                       |    |    |    |    |
| D_CONN                     | Off                                               |    |    |    |    |
| ILL_OP_CNT( )              | 0                                                 |    |    |    |    |
| LOOP_OF_CNT( )             | 0                                                 |    |    |    |    |
| MIN_IDLE( )                | 0                                                 |    |    |    |    |
| NVR_CONN                   | Off                                               |    |    |    |    |
| OUTP_DTY_CYC(%)            | 0.00                                              |    |    |    |    |
| OUTP_VOLT(V)               | 7.84                                              |    |    |    |    |
| POWER_CNT( )               | 0                                                 |    |    |    |    |
| SELTESTDTC_TBC( )          | 0                                                 |    |    |    |    |
| SLDTRVL(%)                 | 0.00                                              |    |    |    |    |
| STACK_OF_CNT( )            | 0                                                 |    |    |    |    |
| TBMSTATE                   | error                                             |    |    |    |    |
| TB_CTRL_GN( )              | 7                                                 |    |    |    |    |
| WDG_RST_CNT( )             | 0                                                 |    |    |    |    |

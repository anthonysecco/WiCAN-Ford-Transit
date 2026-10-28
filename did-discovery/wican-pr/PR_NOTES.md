# Ford Transit profile update (draft, not submitted)

Built 2026-10-27 from the branch profile by make_pr_profile.ps1. 80 PIDs, 85 parameters (31 existing catalogue names, 54 new).

| DID | Parameter | New? | Expression | Unit | On this van | Current transit.json |
|---|---|---|---|---|---|---|
| 703:0721 | `AWD_CLUTCH_MOTOR_POS` | new | `[B4:B5]/4` | ° | 46.5 |  |
| 703:0722 | `AWD_FRONT_AXLE_DISC` | new | `B4` |  | 2 |  |
| 703:0724 | `AWD_CLUTCH_TQ_CAP` | new | `[B4:B5]` | Nm | 0 |  |
| 703:0725 | `AWD_CLUTCH_MOTOR_DUTY` | new | `S4` | % | -4 |  |
| 703:072C | `AWD_CLUTCH_TQ_REQ` | new | `[B4:B5]` | Nm | 0 |  |
| 726:4025 | `LV_QUIESCENT_A` | new | `([B4:B5]/2)-1000` | mA | 23 |  |
| 726:4027 | `LV_AGE` | new | `[B4:B5]*24` | h | 44688 |  |
| 726:4028 | `LV_SOC` |  | `B4` | % | 73 |  |
| 726:4029 | `LV_TEMP` | new | `(B4)-40` | °C | 16 |  |
| 726:402A | `LV_V` |  | `(B4/20)+(6)` | V | 12.1 |  |
| 726:402B | `LV_A` |  | `(B4)-127` | A | -5 |  |
| 726:40B5 | `IGNITION_POS` | new | `B4` |  | 3 |  |
| 726:40C8 | `REVERSE_LAMPS` | new | `B4:0` |  | 0 |  |
| 726:40E0 | `LAMP_RR_OUTPUT` | new | `B4` |  | 2 |  |
| 726:40E2 | `LAMP_RL_OUTPUT` | new | `B4` |  | 2 |  |
| 726:41B9 | `START_STOP_STATE` | new | `B4` |  | 146 |  |
| 726:41D2 | `HORN` | new | `B4` |  | 0 |  |
| 726:D137 | `BCM_DTC_COUNT` | new | `B4` |  | 1 |  |
| 726:203E | `TPMS_MOVED` | new | `B4` |  | 0 |  |
| 726:280B | `TPMS_TYRE_T` | new | `(B10)-40` | °C | 19 |  |
| 726:2813 | `TYRE_P_FL` |  | `[B4:B5]*0.04911541` | psi | 54.076 | `222813 [B4:B5]/10` |
| 726:2814 | `TYRE_P_FR` |  | `[B4:B5]*0.04911541` | psi | 53.094 | `222814 [B4:B5]/10` |
| 726:2815 | `TYRE_P_RR` |  | `[B4:B5]*0.04911541` | psi | 69.302 | `222815 [B4:B5]/10` |
| 726:2816 | `TYRE_P_RL` |  | `[B4:B5]*0.04911541` | psi | 71.512 | `222816 [B4:B5]/10` |
| 726:2817 | `TYRE_P_RRI` | new | `[B4:B5]*0.04911541` | psi | 147.346 |  |
| 726:2818 | `TYRE_P_RLI` | new | `[B4:B5]*0.04911541` | psi | 147.346 |  |
| 726:2827 | `TYRE_P_PLACARD_F` | new | `B4` | psi | 57 |  |
| 726:2828 | `TYRE_P_PLACARD_R` | new | `B4` | psi | 75 |  |
| 726:2B00 | `PARK_BRAKE` |  | `B4:6` | none | 0 | `222B00 B4` |
| 726:5B1D | `DOOR_FL` | new | `B4:0` |  | 0 |  |
| 726:5B1D | `DOOR_FR` | new | `B4:1` |  | 0 |  |
| 726:5B1D | `DOOR_RL` | new | `B4:3` |  | 0 |  |
| 726:5B1D | `DOOR_RR` | new | `B4:4` |  | 0 |  |
| 726:5B1D | `DOOR_CARGO` | new | `B4:5` |  | 0 |  |
| 726:5B1D | `HOOD` | new | `B4:2` |  | 0 |  |
| 7E0:F403 | `FUEL_SYS_STAT` |  | `B4` |  | 0 | `22F403 B4` |
| 7E0:F404 | `ENGINE_LOAD` | new | `B4*100/255` | % | 0 |  |
| 7E0:F405 | `COOLANT_TMP` |  | `B4-40` | °C | 26 | `22F405 B4-40` |
| 7E0:F406 | `STFT` |  | `(B4*100/128)-100` | % | 0 |  |
| 7E0:F407 | `LTFT` | new | `(B4*100/128)-100` | % | 0.781 |  |
| 7E0:F408 | `STFT_B2` | new | `B4*100/128-100` | % | -0.781 |  |
| 7E0:F409 | `LTFT_B2` | new | `B4*100/128-100` | % | 6.25 |  |
| 7E0:F40C | `ENGINE_RPM` |  | `[B4:B5]/4` | RPM | 0 |  |
| 7E0:F40E | `TIMING_ADVANCE` | new | `B4/2-64` | ° | 10.5 |  |
| 7E0:F40F | `INTAKE_AIR_TMP` |  | `B4-40` | °C | 22 | `22F40F B4-40` |
| 7E0:F411 | `THROTTLE` |  | `B4*100/255` | % | 10.98 |  |
| 7E0:F41F | `RUN_TIME` | new | `[B4:B5]` | s | 0 |  |
| 7E0:F423 | `FUEL_PRESSURE` |  | `[B4:B5]*10` | kPa | 11060 | `22F423 [B4:B5]` |
| 7E0:F42F | `FUEL` |  | `B4*100/255` | % | 49.412 |  |
| 7E0:F43C | `CAT_TEMP` | new | `([B4:B5]/10)-40` | °C | 148.9 |  |
| 7E0:F443 | `ENGINE_LOAD_ABS` | new | `[B4:B5]*100/255` | % | 0 |  |
| 7E0:F444 | `AFR_CMD` | new | `B4*0.1144` |  | 14.643 |  |
| 7E0:F446 | `OUTSIDE_TEMPERATURE` |  | `(B4)-40` | °C | 20 |  |
| 7E0:F462 | `ENGINE_TORQUE_PCT` | new | `(B4)-125` | % | 0 |  |
| 7E0:F463 | `ENGINE_TORQUE_REF` | new | `[B4:B5]` | Nm | 600 |  |
| 7E0:F49D | `FUEL_RATE` |  | `[B4:B5]*0.02` | g/s | 0 | `22F49D [B4:B5]*2/100` |
| 7E0:F4A6 | `ODOMETER` |  | `[B4:B7]*0.1` | km | 32245 |  |
| 7E0:0307 | `FUEL_PUMP_DUTY` |  | `B4*100/255` | % | 37.647 | `220307 (B4*100)/255` |
| 7E0:030F | `LAMBDA_CMD` | new | `[B4:B5]/32768` |  | 1.02 |  |
| 7E0:032B | `ACCEL_PEDAL` | new | `B4/2` | % | 0 |  |
| 7E0:0334 | `CYL_HEAD_TEMP` | new | `[S4:S5]/64` | °C | 26.438 |  |
| 7E0:033E | `THROTTLE_INLET_P` | new | `[B4:B5]*0.00762854` | kPa | 100.926 |  |
| 7E0:0345 | `MISFIRE_COUNT` | new | `[B4:B7]` |  | 0 |  |
| 7E0:0353 | `BARO` | new | `[B4:B5]/4` | kPa | 101.5 |  |
| 7E0:0370 | `MAP` | new | `[B4:B5]*0.25` | kPa | 100.25 |  |
| 7E0:03CA | `INTAKE_AIR_TEMP_2` |  | `B4-40` | °C | 23 | `2203CA B4-40` |
| 7E0:03DC | `FUEL_PRESSURE_D` |  | `[B4:B5]*10` | kPa | 130 | `2203DC [B4:B5]` |
| 7E0:03E8 | `OCTANE_RATIO_L` |  | `[B4:B5]/16384` | % | 0.133 | `2203E8 [B4:B5]/16384` |
| 7E0:0427 | `BYPASS_VALVE` | new | `B4/255` |  | 0 |  |
| 7E0:0462 | `WASTEGATE` |  | `B4*100/128` | % | 0 | `220462 B4*100/128` |
| 7E0:0466 | `THROTTLE_INLET_P_D` | new | `[B4:B5]*0.00762854` | kPa | 99.125 |  |
| 7E0:054B | `OIL_LIFE` |  | `B4` | % | 60 | `22054B B4` |
| 7E0:0598 | `ALT_DUTY` |  | `B4` | % | 0 | `220598 B4` |
| 7E0:0604 | `AC_REFRIGERANT_P` | new | `[S4:S5]` | kPa | 548 |  |
| 7E0:0651 | `DRIVE_MODE` |  | `B4` |  | 0 | `220651 B4` |
| 7E0:099B | `AC_COMP` |  | `B4` |  | 0 | `22099B B4` |
| 7E0:1505 | `SPEED` |  | `[B4:B5]*0.0078125` | km/h | 0 |  |
| 7E0:1E12 | `GEAR` |  | `B4` | none | 70 | `221E12 B4` |
| 7E0:1E15 | `TCC_RATIO` | new | `[B4:B5]*0.000244140625` |  | 0.997 |  |
| 7E0:1E1A | `TRANS_LINE_P_D` | new | `[B4:B5]*2` | kPa | 410 |  |
| 7E0:1E1C | `TRAN_F_TEMP` |  | `[B4:B5]/16` | °C | 21 | `221E1C [B4:B5]/16` |
| 7E0:1E1F | `GEAR_ENGAGED` | new | `B4` |  | 70 |  |
| 7E0:1E23 | `GEAR_SELECTOR` | new | `B4` |  | 100 |  |
| 7E0:1E8F | `TRANS_PARK` | new | `B4:2` |  | 0 |  |
| 7E0:3B40 | `BRAKE_PEDAL` | new | `B4:1` |  | 0 |  |

Removed from the current transit.json: `SOC` (224028 B4), `HV_V` (22402A ([B4:B5]/256)/10), `HV_A` (22402B ([B4:B5]-32768)/256)

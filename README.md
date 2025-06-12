> 🚧 **This repo is under heavy development and is incomplete.**

# WiCAN Ford Transit

[WiCAN](https://github.com/meatpiHQ/wican-fw) is an open source hardware / software project that allow the user to pull OBDII data and easily stream using MQTT into Home Assistant.  This enables custom dashboards (e.g. on a tablet) and automations while driving. 

For now, this project is **read-only**.  Additionaly complexities related to security and stability are introduce when sending commands on the OBDII interface.

> ✅ Tested on a 2021 Ford Transit AWD 3.5L EcoBoost (North America)

## Project Scope
While there's plenty of data available via the OBDII port and CANbus, this project focuses on read-only, real-time, and actionable data that's relevant in an RV.  It's not intended to replace OBDII diagnostic devices or software available on the market.

The primary reason for this scope is:

1) The WiCAN is only **ON** when the vehicle igition is in the **ON** position.  This limits the available use cases.
2) The vehicles instrument panel provides plenty of information already.
3) Ford does not publish their proprietary PIDs, this list is based on forum research, serial sniffing of OBDII tools, and some help from ChatGPT.

The focus therefore is to find what **adds** to what's available on the instrument panel and/or triggers automations within Home Assitant **while the vehicle is on**.

### Non-CAN Signals
A number of state-related information is availble outside of the OBDII on the Ford Transit.  These have the advantage of being available while the vehicle is off.  

**Auxilary Harness** - Under the driver seat
- Engine On/Off
- Igition On/Off
- Vehicle Speed Sensor

**High Spec Connector** - Optional connector located behind the glovebox
- Engine On/Off
- Igition On/Off
- Vehicle Speed Sensor
- Door Ajar (Driver, Passenger, Side, Cargo)
- Lock / Unlock Commands

Since door states are available on the high-spec connector and available while the vehicle is off, they're **excluded** from this project.

For more information visit my repo [Ford Transit Door Interface](https://github.com/anthonysecco/ford-transit-door-interface).

## Use Cases

Given the above scope, I've identified the following use cases:

### Dashboards

| **Panel**              | **Description**                                                                  | **Purpose**                                           |
| ---------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------- |
| **Fuel Efficiency**    | Real-time, projected, and historical fuel consumption.                   | Adjust driving behavior and monitor fuel usage.       |
| **Traction & Terrain** | Real-time data relevant to low-speed traction.                    | Modify off-road driving based on traction conditions. |
| **Resources**          | Provide an overview of off-grid resource levels (battery, water, solar, signal). | Choose optimal parking or camping spots.              |

### Automations

| **Name**                 | **Trigger**                               | **Action**                                                         |
| ------------------------ | ----------------------------------------- | ------------------------------------------------------------------ |
| **Excessive Tilt Alert** | Pitch > 20 ° or Roll > 15 °               | Push notification “Vehicle tilt too steep—risk of rollover!”       |
| **Dashboard Change**    | Vehicle moving / not moving        | Change relevant information on dashboard if vehicle moving    |
| **Moving Mode**   | Vehicle moving / not moving        | Lock drawers and turn off lights, inverter, water |

---

## How It Works

The [WiCAN Pro](https://github.com/meatpiHQ/wican-fw) device reads CAN data and publishes it to MQTT. From there, Home Assistant can subscribe to topics via YAML configuration to create sensors and automations.

> This should also work on a WiCAN non-pro as well.

### Quick Overview

1. Plug in the WiCAN device
2. Configure network + MQTT
3. Add PIDs (standard + Ford Transit profile JSON)
4. Load MQTT YAML config into Home Assistant
5. Build your dashboard and automations

---

## PID Background

### Standard PIDs

Standard SAE PIDs (Parameter IDs) are a set of standardized diagnostic codes defined by the SAE J1979 protocol, which allow external diagnostic tools (like OBD-II scanners) to request data from a vehicle’s ECU (Engine Control Unit). These PIDs are used to retrieve real-time sensor data, diagnostic trouble codes (DTCs), and other vehicle information.  J1979 is the standard for OBD-II communication, used widely in North America and supported globally.

The standard SAE PIDs provide a strong base which is enough to track engine state and motion. Adding the vehicle profile JSON expands access to gear selection, turbo behavior, and more.

### Ford-specific PIDs

Every manufacture will have additional PIDs that have detailed vehicle-specific information for each module.  You will see some of these below.

---

### 🎬 Actionable PIDs

| Module | PID | Description    | Type            | Home Assistant Use       | Status    |
| ------ | --- | -------------- | --------------- | ------------------------ | --------- |
| OBD    | 010D | Speedometer    | `sensor` (km/h) | Vehicle motion detection | ✅ Working |
| OBD    | 010C | Engine Speed   | `sensor` (RPM)  | Detect engine state      | ✅ Working |
| OBD    | 012F | Fuel Gauge     | `sensor` (%)    | Trigger low-fuel alerts  | ✅ Working |
| OBD    | 01A6 | Odometer       | `sensor` (km)   | Maintenance alerts       | ✅ Working |
| PCM    | 221E12 | Gear Selection | `sensor` (enum) | Driving state awareness  | ✅ Working |

---

### 🔍 Monitoring PIDs


#### Engine Performance
| Module | PID | Description          | Type             | Home Assistant Use       | Status    |
| ------ | --- | -------------------- | ---------------- | ------------------------ | --------- |
| PCM    | TBD | Coolant Temp         | `sensor` (°C)    | Engine temp monitoring (offroad?)   | 🚧 In Progress |
| PCM    | 221E1C | Transmission Temp    | `sensor` (°C)    | Gearbox temp monitoring (offroad?)  | ✅ Working |
| PCM    | 010B | Intake Manifold Abs Pressure | `sensor` (kPa)   | Turbo performance  | ✅ Working |
| PCM    | 220462 | Wastegate Open       | `sensor` (%)     | Turbo control monitoring | ✅ Working |
| PCM    | 22054B | Oil Life             | `sensor` (%)     | Remaining oil health     | ✅ Working |
| PCM    | 0163 | Torque Reference     | `sensor` (Nm)    | Engine torque value      | ✅ Working |
| PCM    | 0162 | Torque Percent       | `sensor` (%)     | Relative torque load     | ✅ Working |
| PCM    | 0111 | Throttle Position    | `sensor` (%)     | Driver input load        | ✅ Working |
| PCM    | 0144 | AFR Command          | `sensor` (%) | Air-Fuel target ratio    | ✅ Working |
| PCM    | 0134 | AFR Bank 1           | `sensor` (%) | Actual AFR (bank 1)      | ✅ Working |
| PCM    | 0138 | AFR Bank 2           | `sensor` (%) | Actual AFR (bank 2)      | ✅ Working |

#### Fuel Economy
| Module | PID | Description          | Type             | Home Assistant Use       | Status    |
| ------ | --- | -------------------- | ---------------- | ------------------------ | --------- |
| PCM    | 0104 | Engine load    | `sensor` (%)    | Fuel Advisor     | ✅ Working |
| PCM    | 22F49D | Fuel Rate          | `sensor` (g/s) | Fuel Advisor    | ✅ Working |
| PCM    | 2203E8| Learned Octane Ratio | `sensor` (%)     | Fuel Advisor     | ✅ Working |
| PCM    | TBD | Driving Mode         | `sensor` (enum) | Fuel / Off-road Advisor      | 🚧 In Progress |
| PCM    | TBD | Brake On/Off        | `binary_sensor` (On/Off) | Fuel Advisor      | 🚧 In Progress |
| IPC   | TBD | Distance to E       | `sensor` (km) | Fuel Advisor      | 🚧 In Progress  |
| IPC   | TBD | Trailing Fuel Economy      | `sensor` (L/100KM) | Fuel Advisor      | 🚧 In Progress  |

There are other standard SAE PIDs, but the ones above I find useful.

---

## 💪 Wishlist
I haven't found a PID available to WiCAN for these:

* **Parking Brake** – `binary_sensor` (ABS module, hard to access)
* **Open/Closed Loop** – `binary_sensor` (AFR feedback mode)
* **Regen Braking** – `binary_sensor` (Smart alternator charging, put on Fuel advisor)
* **Auxilary Switch States** - `binary_sensor` (Track states of rocker switches for automations)
* **Battery State of Charge** - `binary_sensor` (display how dead/alive the vehicle battery is in %)
* **A/C Compressor On/Off States** - `binary_sensor` (Display on fuel advisor)
* **Turn Signals or blind spot monitors** - `binary_sensor` (trigger vehicle camera to display on corresponding side of the vehicle for lane change)

### 🛻 Off-Road Wishlist
* **AWD Clutch Duty Cycle** - 'sensor' (Display calculated torque split)
* **AWD Clutch temperature** - 'sensor' (monitor for overheating)
* **Tire Pressure** - 'sensor' (Display all tires for off-road advisor)
* **Wheel Spin** - 'sensor' (Display wheel spin for all tires)
* **Traction Contrl Intervention** - 'sensor' (% how much TSC is engaged)

## 🚫 Unavailable
These are simply not possible using factory hardware

* **Oil Temperature ** - No sensor in vehicle.

---

## 📁 Extended PID List

See [`PIDs.md`](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md) for experimental and unverified PIDs. These are community-contributed or AI-suggested—**use at your own discretion**.

---

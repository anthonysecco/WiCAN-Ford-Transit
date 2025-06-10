> 🚧 **This repo is under heavy development.**

# WiCAN Ford Transit

WiCAN for Ford Transit exposes select OBDII sensor data to Home Assistant. This enables custom dashboards (e.g. on a tablet) and automations while driving. The project is **read-only** for now, with future plans to support sending commands via OBDII.

> ✅ Tested on a 2021 Ford Transit AWD 3.5L EcoBoost (North America)

## Project Scope
While there's plenty of data available via the OBDII port, this project focuses on read-only, real-time, and actionable data that's relevant in an RV.  I do not intend to replace OBDII diagnostic devices available on the market.

The primary reason for this scope is:

1) The WiCAN is only online when the vehicle igition is in the **ON** position.  This limits the number of available use cases.
2) Much of the information is already available on the vehicle's instrument panel
3) Ford does not publish their proprietary PIDs, this list is based on forum research, serial sniffing of OBDII tools, and some help from ChatGPT.

Therefore, I've prioritized data that **adds** to what's available on the instrument panel and/or triggers automations within Home Assitant **while the vehicle is on**.

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

I decided not to track door ajar states in WiCAN since these signals are available while the vehicle is off on these signal wires.  For more information visit my repo [Ford Transit Door Interface](https://github.com/anthonysecco/ford-transit-door-interface).

---

## How It Works

This project uses the [WiCAN Pro](https://github.com/meatpiHQ/wican-fw) device to read CAN data and publish it to MQTT. From there, Home Assistant can subscribe to topics via YAML configuration to create sensors and automations.

> This should also work on a WiCAN non-pro as well.

### Quick Start

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
| OBD    | TBD | Speedometer    | `sensor` (km/h) | Vehicle motion detection | ✅ Working |
| OBD    | TBD | Engine Speed   | `sensor` (RPM)  | Detect engine state      | ✅ Working |
| OBD    | TBD | Fuel Gauge     | `sensor` (%)    | Trigger low-fuel alerts  | ✅ Working |
| OBD    | TBD | Odometer       | `sensor` (km)   | Maintenance alerts       | ✅ Working |
| PCM    | 221E12 | Gear Selection | `sensor` (enum) | Driving state awareness  | ✅ Working |

---

### 🔍 Monitoring PIDs

| Module | PID | Description          | Type             | Home Assistant Use       | Status    |
| ------ | --- | -------------------- | ---------------- | ------------------------ | --------- |
| PCM    | 2203E8| Learned Octane Ratio | `sensor` (%)     | Fuel quality tracking    | ✅ Working |
| PCM    | TBD | Coolant Temp         | `sensor` (°C)    | Engine temp monitoring   | 🚧 In Progress |
| PCM    | 221E1C | Transmission Temp    | `sensor` (°C)    | Gearbox temp monitoring  | 🚧 In Progress |
| PCM    | TBD | Engine Oil Temp      | `sensor` (°C)    | Oil temp monitoring      | 🚧 In Progress |
| PCM    | TBD | Boost Gauge          | `sensor` (kPa)   | Turbo performance        | ✅ Working |
| PCM    | 220462 | Wastegate Open       | `sensor` (%)     | Turbo control monitoring | ✅ Working |
| PCM    | 22054B | Oil Life             | `sensor` (%)     | Remaining oil health     | ✅ Working |
| PCM    | TBD | Torque Reference     | `sensor` (Nm)    | Engine torque value      | ✅ Working |
| PCM    | TBD | Torque Percent       | `sensor` (%)     | Relative torque load     | ✅ Working |
| PCM    | TBD | Throttle Position    | `sensor` (%)     | Driver input load        | ✅ Working |
| PCM    | TBD | AFR Command          | `sensor` (ratio) | Air-Fuel target ratio    | ✅ Working |
| PCM    | TBD | AFR Bank 1           | `sensor` (ratio) | Actual AFR (bank 1)      | ✅ Working |
| PCM    | TBD | AFR Bank 2           | `sensor` (ratio) | Actual AFR (bank 2)      | ✅ Working |
| PCM    | 22F49D | Fuel Rate          | `sensor` (g/s) | Fuel Economy     | ✅ Working |
| PCM    | TBD | Driving Mode         | `sensor` (enum) | Gauge & Graph      | 🚧 In Progress |

---

## 💪 Wishlist
I haven't found a PID available to WiCAN for these:

* **Parking Brake** – `binary_sensor` (ABS module, hard to access)
* **Open/Closed Loop** – `binary_sensor` (AFR feedback mode)
* **Auxilary Switch States** - `binary_sensor` (Track states of rocker switches for automations)

---

## 📁 Extended PID List

See [`PIDs.md`](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md) for experimental and unverified PIDs. These are community-contributed or AI-suggested—**use at your own discretion**.

---

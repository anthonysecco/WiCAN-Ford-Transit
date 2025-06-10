> 🚧 **This repo is under heavy development.**

# WiCAN Ford Transit

WiCAN for Ford Transit exposes select OBDII sensor data to Home Assistant. This enables custom dashboards (e.g. on a tablet) and automations while driving. The project is **read-only** for now, with future plans to support sending commands via OBDII.

> ✅ Tested on a 2021 Ford Transit AWD 3.5L EcoBoost (North America)

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

## Available PIDs

WiCAN focuses on **real-time**, **actionable** data useful while driving—not on deep diagnostics already available on the gauge cluster.

Since Ford does not openly publish proprietary PIDs, this list is based on forum research, serial sniffing of OBDII tools, and some help from ChatGPT.

The standard SAE PIDs provide a strong base—enough to track engine state and motion. Adding the vehicle profile JSON expands access to gear selection, turbo behavior, and more.

---

### 🎬 Actionable PIDs

| Module | PID | Description    | Type            | Home Assistant Use       | Status    |
| ------ | --- | -------------- | --------------- | ------------------------ | --------- |
| OBD    | TBD | Speedometer    | `sensor` (km/h) | Vehicle motion detection | ✅ Working |
| OBD    | TBD | Engine Speed   | `sensor` (RPM)  | Detect engine state      | ✅ Working |
| OBD    | TBD | Fuel Gauge     | `sensor` (%)    | Trigger low-fuel alerts  | ✅ Working |
| OBD    | TBD | Odometer       | `sensor` (km)   | Maintenance alerts       | ✅ Working |
| PCM    | TBD | Gear Selection | `sensor` (enum) | Driving state awareness  | ✅ Working |

---

### 🔍 Monitoring PIDs

| Module | PID | Description          | Type             | Home Assistant Use       | Status    |
| ------ | --- | -------------------- | ---------------- | ------------------------ | --------- |
| PCM    | TBD | Learned Octane Ratio | `sensor` (%)     | Fuel quality tracking    | ✅ Working |
| PCM    | TBD | Coolant Temp         | `sensor` (°C)    | Engine temp monitoring   | ✅ Working |
| PCM    | TBD | Transmission Temp    | `sensor` (°C)    | Gearbox temp monitoring  | ✅ Working |
| PCM    | TBD | Engine Oil Temp      | `sensor` (°C)    | Oil temp monitoring      | ✅ Working |
| PCM    | TBD | Boost Gauge          | `sensor` (kPa)   | Turbo performance        | ✅ Working |
| PCM    | TBD | Wastegate Open       | `sensor` (%)     | Turbo control monitoring | ✅ Working |
| PCM    | TBD | Oil Life             | `sensor` (%)     | Remaining oil health     | ✅ Working |
| PCM    | TBD | Torque Reference     | `sensor` (Nm)    | Engine torque value      | ✅ Working |
| PCM    | TBD | Torque Percent       | `sensor` (%)     | Relative torque load     | ✅ Working |
| PCM    | TBD | Throttle Position    | `sensor` (%)     | Driver input load        | ✅ Working |
| PCM    | TBD | AFR Command          | `sensor` (ratio) | Air-Fuel target ratio    | ✅ Working |
| PCM    | TBD | AFR Bank 1           | `sensor` (ratio) | Actual AFR (bank 1)      | ✅ Working |
| PCM    | TBD | AFR Bank 2           | `sensor` (ratio) | Actual AFR (bank 2)      | ✅ Working |

---

## 💪 Wishlist PIDs

* **Parking Brake** – `binary_sensor` (ABS module, hard to access)
* **Open/Closed Loop** – `binary_sensor` (AFR feedback mode)

---

## 📁 Extended PID List

See [`PIDs.md`](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md) for experimental and unverified PIDs. These are community-contributed or AI-suggested—**use at your own discretion**.

---

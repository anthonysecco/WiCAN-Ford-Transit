| Useful Links |
|-------|
| [PID List](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md) |

> 🚧 **This repo is under heavy development** 🚧

# WiCAN Ford Transit

[WiCAN](https://github.com/meatpiHQ/wican-fw) is an open source hardware / software project that allow the user to pull OBDII data and easily stream using [MQTT](https://en.wikipedia.org/wiki/MQTT) into [Home Assistant](https://www.home-assistant.io/) and other tools.  From there a user can build custom dashboards (e.g. on a tablet) and other automations while driving. 

> Testing performed on a 2021 Ford Transit AWD 3.5L EcoBoost (North America).

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

Since door states are available on the high-spec connector and available while the vehicle is off, they're **excluded** from this project.  It doesn't make sense to monitor them when the vehicle is on because the driver will see that on the vehicle's instrument panel.  Triggering automations isn't that useful related to door open/close while the vehicle is on.

For more information visit my repo [Ford Transit Door Interface](https://github.com/anthonysecco/ford-transit-door-interface).

## Use Cases

Given the above scope, I've identified the following use cases:

### Dashboards

Some dashboard ideas.  These can be updated or changed with other vehicle data (GPS, Cell Signal, Fresh/Gray tank etc.)

| **Panel**              | **Description**                                                                  | **Purpose**                                           |
| ---------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------- |
| **Fuel Efficiency**    | Real-time, projected, and historical fuel consumption.                   | Adjust driving behavior and monitor fuel usage.       |
| **Traction & Terrain** | Real-time data relevant to low-speed traction.                    | Modify off-road driving based on traction conditions. |
| **Resources**          | Provide an overview of off-grid resource levels (battery, water, solar, signal). | Choose optimal parking or camping spots.              |

### Automations

| **Name**                 | **Trigger**                               | **Action**                                                         |
| ------------------------ | ----------------------------------------- | ------------------------------------------------------------------ |
| **Dashboard Change**    | Vehicle moving / not moving        | Change relevant information on dashboard if vehicle moving    |
| **Moving Mode**   | Vehicle moving / not moving        | Lock drawers and turn off lights, inverter, water |
| **Trip Reports** | End of Day | Send message with trip summary (miles, time, fuel etc.) |
| **Excessive Tilt Alert** | Pitch > 20 ° or Roll > 15 °               | Push notification “Vehicle tilt too steep—risk of rollover!”       |

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

## Home Assistant Sensors

> 🚧 **This section to be defined** 🚧

---

## 💖 Support
The development of this repo took many hours and dollars in hardware, software, and testing.  If you found this useful, consider buying me a coffee. ☕

## 💪 Future Enhancements
If you have feature requests, please create an _issue_.  It's been said that I can be bribed with coffee. 😊

Otherwise, here's what I'm interested in but haven't yet solved:

| **Feature**                      | **Description**                                 |
| -------------------------------- | ----------------------------------------------- |
| **Parking Brake**                | In ABS module only, hard to access              |
| **Open/Closed Loop**             | AFR feedback mode                               |
| **Regen Braking**                | Smart alternator charging; put on Fuel advisor  |
| **Auxilary Switch States**       | Track states of rocker switches for automations |
| **Wheel Spin**                   | Display wheel spin for all tires for off-road   |
| **Traction Contrl Intervention** | % how much TSC is engaged                       |

### 🚫 Unavailable
These simply don't exist with factory equipment:

* **Oil Temperature ** - No sensor in vehicle.
* **AWD Clutch temperature** - No sensor in vehicle.

### ⏰ Wake Commands
Many aftermarket alarm systems will send commands on the CANbus to awaken modules and then issue commands (lock, start etc.).  Additionally the vehicles TCU (telematics control unit) for things like Ford Pass can also awaken module.

I would like to know how to issue these types of commands from WiCAN.  Additionally WiCAN itself also has complexity with sleeping and being awake.  It would be interesting to understand if there's a path to wake the WiCAN and the vehicle without too much delay and issue commands (turn on puddle lights etc.).  This is an stretch goal for the project.

### 📁 Extended PID List

See [`PIDs.md`](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md) for experimental and unverified PIDs. These are community-contributed or AI-suggested—**use at your own discretion**.

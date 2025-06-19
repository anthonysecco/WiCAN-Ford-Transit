![cartoon_logo_transparent_256](https://github.com/user-attachments/assets/24c77662-bc93-4e59-b70a-6bf2cb2cf5be)

# WiCAN Ford Transit
This project allows a user to use a WiCAN dongle and access detailed information from their Ford Transit and stream that data into entities in Home Assistant.  The user may then create dashboards, automations, or review historical data about their trips and journeys related to fuel, temperatures etc.

### **What's WiCAN?**
[WiCAN](https://github.com/meatpiHQ/wican-fw) is an open-source hardware and software project that allows users to stream OBDII data via [MQTT](https://en.wikipedia.org/wiki/MQTT) into [Home Assistant](https://www.home-assistant.io/) or other tools.  

Let's get started!

## 👷 Project Scope
Both WiCAN and WiCAN Pro are supported unless otherwise indicated.

This project intends to:
1) Supplement real-time vehicle data not shown (or poorly displayed) on the instrument panel.
2) Provide actionable data to Home Assistant for automations.

It does **not** intend to:
1) Replace commercial OBDII diagnostic tools (e.g., FORScan, OBDwiz).

Limiting factors on this project
1) The WiCAN is only **ON** when the vehicle Ignition is in the **ON** position.  This will limit use cases.
2) Ford does not publish their proprietary PIDs, this list is based on forum research, serial sniffing of OBDII tools, and some help from ChatGPT.

### Non-CAN Signals
It's far better to interface with the Transit using Non-CAN interfaces when possible.  They are reliable and function even when the Ignition is **off**.  Here are examples of what's available:

**Auxilary Harness** - Standard equipment. Connector under the driver seat.
- Engine On/Off
- Ignition On/Off
- Vehicle Speed Sensor

**High Spec Connector** - Optional equipment. Connector located behind the glovebox.
- Engine On/Off
- Ignition On/Off
- Vehicle Speed Sensor
- Door Ajar (Driver, Passenger, Side, Cargo)
- Lock / Unlock Commands

For more information visit my other project: [Ford Transit Door Interface](https://github.com/anthonysecco/ford-transit-door-interface).

## 🧑‍💻 Ford Transit Entities Available
The following are entities that can be made available to Home Assistant.  Testing was performed on a 2021 Ford Transit AWD 3.5L EcoBoost (North America).  

| Entity                          | Type            | Unit  | Source   | Sug. Refresh | Tier |
| :------------------------------ | :-------------- | :---- | :------- | :----------- | :--- |
| A/C Compressor Status           | `binary_sensor` |       | 0x22099B | 5000ms       | C    |
| Alternator Duty Cycle           | `sensor`        | %     | 0x220598 | 5000ms       | A    |
| Barometric Pressure             | `sensor`        | psi   | 0x33     | 5000ms       | B    |
| Boost Gauge                     | `sensor`        | psi   | Template |              | B    |
| Brake On/Off                    | `binary_sensor` |       | 0x222B00 | 1000ms       | C    |
| Drive Mode                      | `sensor`        | enum  | 0x220651 | 1000ms       | B    |
| Engine Coolant Temp             | `sensor`        | °F    | 0x22F405 | 5000ms       | S    |
| Engine Horsepower               | `sensor`        | hp    | Template | -            | B    |
| Engine Load                     | `sensor`        | %     | 0x04     | 1000ms       | A    |
| Engine Running                  | `binary_sensor` |       | Template | -            | S    |
| Engine Speed                    | `sensor`        | RPM   | 0x0C     | 1000ms       | B    |
| Engine Torque                   | `sensor`        | lb-ft | Template |              | B    |
| Engine Torque Percent           | `sensor`        | %     | 0x62     | 1000ms       | B    |
| Engine Torque Reference         | `sensor`        | Nm    | 0x63     | 60000ms      | B    |
| Fuel Level                      | `sensor`        | %     | 0x2F     | 60000ms      | S    |
| Fuel Pressure Actual            | `sensor`        | psi   | 0x22F423 | 1000ms       | D    |
| Fuel Pressure Desired           | `sensor`        | psi   | 0x2203DC | 1000ms       | D    |
| Fuel Rate                       | `sensor`        | g/s   | 0x22F49D | 1000ms       | S    |
| Fuel System Status              | `sensor`        | enum  | 0x22F403 | 1000ms       | A    |
| Fuel Pump Duty Cycle            | `sensor`        | %     | 0x220307 | 1000ms       | D    |
| Intake Air Temp                 | `sensor`        | °F    | 0x22F40F | 5000ms       | C    |
| Intake Air Temp 2               | `sensor`        | °F    | 0x2203CA | 5000ms       | C    |
| Learned Octane Ratio            | `sensor`        | %     | 0x2203E8 | 60000ms      | A    |
| Manifold Pressure               | `sensor`        | psi   | 0x0B     | 1000ms       | B    |
| Oil Life                        | `sensor`        | %     | 0x22054B | 60000ms      | B    |
| Odometer                        | `sensor`        | mi    | 0xA6     | 60000ms      | S    |
| OBD Status                      | `binary_sensor` |       | WiCAN    | -            | S    |
| Real-Time Fuel Economy          | `sensor`        | MPG   | Template | -            | S    |
| Throttle Position               | `sensor`        | %     | 0x11     | 1000ms       | D    |
| Transmission Fluid Temp         | `sensor`        | °F    | 0x221E1C | 5000ms       | A    |
| Transmission Gear               | `sensor`        | enum  | 0x221E12 | 1000ms       | S    |
| Tire Pressure Left Front        | `sensor`        | InHg  | 0x222813 | 5000ms       | S    |
| Tire Pressure Left Rear Outer   | `sensor`        | InHg  | 0x222816 | 5000ms       | S    |
| Tire Pressure Right Front       | `sensor`        | InHg  | 0x222814 | 5000ms       | S    |
| Tire Pressure Right Rear Outer  | `sensor`        | InHg  | 0x222815 | 5000ms       | S    |
| Vehicle Battery Current         | `sensor`        | A     | 0x22402B | 5000ms       | C    |
| Vehicle Battery Power           | `sensor`        | W     | Template | 5000ms       | C    |
| Vehicle Battery State of Charge | `sensor`        | %     | 0x224028 | 5000ms       | A    |
| Vehicle Battery Voltage         | `sensor`        | V     | 0x22402A | 5000ms       | C    |
| Vehicle Speed                   | `sensor`        | mph   | 0x0D     | 1000ms       | S    |
| Wastegate                       | `sensor`        | %     | 0x220462 | 1000ms       | D    |
> Suggested Refresh is my suggested period setting for MQTT updates in WiCAN.

### Tiers
The entity list above is rather long.  I've ranked the entities based on my own personal opinion of usefulness.  On my Transit, I've only implemented Tiers **S**, **A**, and **B**.

| Tier  | Description|
|:------|:------|
| S     | Must Have |
| A     | Good to Have |
| B     | Nice to Have |
| C     | Not necessary |
| D     | Diagnostic |

### More PID Information
For more details on the source, visit [PID List](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md).  I've also provided a dump from OBDwiz [here](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/obdwiz.md) and a dump for FORScan [here](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/FORScan.md).

## 🤖 Installation
The [WiCAN](https://github.com/meatpiHQ/wican-fw) device reads CAN bus data and publishes it to your MQTT broker. From there, Home Assistant subscribes to the data stream using YAML configuration files.

This guide assumes you:
- Have WiCAN connected to your OBDII port
- Joined it to your Wi-Fi
- Enabled AutoPID mode
- Connected it to your MQTT broker

### Setup Standard PIDs
1) Navigate to **Automate** tab
2) Select ECU Protocol **6- ISO 15765-4 (CAN 11bit/500K)**
3) Scan for PIDs
4) Add the PIDs of your choice.  Not all work correctly.  Refer to [PID List](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md)) to see what's been tested.

### Setup Vehicle Specific PIDs
1) Download the JSON file [here](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/2021-Ford-Transit-North-America.json) for the Ford Transit.
2) Navigate to **Automate** tab.
3) Scroll to Vehicle Specific and **Enable**
4) Upload vehicle profile JSON
5) Select Vehicle model from drop-down
6) Click 'Submit' to make the upload PIDs active.  This will reboot the WiCAN.

After applying, specific initialization and additional PIDs will show below.  Next configure MQTT.

### Configure MQTT on WiCAN
You will need to instruct WiCAN on the topic you wish data to be posted.  You may use the topic provided in the this YAML file or one of your own choosing.

Additionaly, you'll need to set the interval.  For real-time data, I suggest an interval no less than 1000ms.  For non real-time data, I suggest as long of an interval as is reasonable.  For example, tire pressure and odometer, won't be changing as frequency, to 60000ms (60s) is plenty.  This reduces load on the WiCAN and Home Assistant.  I've provided my suggested refresh intervals in the entities table above.

Once configured, submit and reboot your WiCAN.  If all is well, you should see the data flowing into your MQTT broker.  Use MQTT Explorer to validate data is flowing.  I suggest keeping your vehicle running when testing to validate the sensors are working as expected.

### Configure MQTT Entities on Home Assistant
Once you validated that all expected sensors are streaming into your MQTT broker, you may now begin to add the sensors to Home Assistant.

You may use the YAML file found [here](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/mqtt-wican.yaml) as a template to add your entities.  This YAML converts the MQTT topic into US Imperial units.

There are some template sensors also included in that YAML file for calcuated values such as Horsepower.

Reload your Home Assistant configuration and you should now see the entities.

![image](https://github.com/user-attachments/assets/9c4fe1b6-fde9-44ad-b3c4-a32cf5fc6a7c)
![image](https://github.com/user-attachments/assets/3509e3bb-cecd-42dc-bb71-e5164133adf8)

## 🚗 Use Cases

> 🥼 I'm still experimenting to see how this data can be useful and will expand this section.

### Dashboards

> 🚧 This section is still very much under development.

![image](https://github.com/user-attachments/assets/f4633975-db54-4616-9946-efb9a747a770)

Some other dashboard ideas...

| **Panel**              | **Description**                                                                  | **Purpose**                                           |
| ---------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------- |
| **Fuel Efficiency**    | Real-time, projected, and historical fuel consumption.                   | Adjust driving behavior and monitor fuel usage.       |
| **Traction & Terrain** | Real-time data relevant to low-speed traction.                    | Modify off-road driving based on traction conditions. |
| **Resources**          | Provide an overview of off-grid resource levels (battery, water, solar, signal). | Choose optimal parking or camping spots.              |
| **Trip Reports** | End of Day | Send message with trip summary (miles, time, fuel etc.) |

I'm also experimenting with conditional dashboards that displays different data based on:
- Vehicle Moving/Not Moving
- Vehicle On/Off
- Vehicle Drive Modes (Normal/Mud/Slippery/Tow)

### Automations

> 🚧 More information to be added here.

| **Name**                 | **Trigger**                               | **Action**                                                         |
| ------------------------ | ----------------------------------------- | ------------------------------------------------------------------ |
| **Moving Mode**   | Vehicle moving / not moving        | Lock drawers and turn off lights, inverter, water |
| **Excessive Tilt Alert** | Pitch > 20 ° or Roll > 15 °               | Push notification “Vehicle tilt too steep—risk of rollover!”       |

---

## 💪 Future Enhancements
The following are entities I would like to add.

| **Feature**                      | **Description**                                 |
| -------------------------------- | ----------------------------------------------- |
| **Inner Tires**                  | For Dual Rear Wheel Configurations              |
| **Parking Brake**                | In ABS module only, hard to access              |
| **Cylinder Head Temp**           |                                                 |
| **Regen Braking**                | Smart alternator charging; put on Fuel advisor  |
| **Auxilary Switch States**       | Track states of rocker switches for automations |
| **Wheel Spin**                   | Display wheel spin for all tires for off-road   |
| **Traction Contrl Intervention** | % how much TSC is engaged                       |
| **All-Wheel Drive Engagement  ** | % torque split between front and rear           |
| **All-Wheel Drive Clutch Temp  ** | C monitor to prevent overheating               |

If you have requests, please create an _issue_.  It's been said that I can be bribed with coffee. 😊

### 🚫 Unavailable
These simply don't exist with factory equipment:

* **Oil Temperature ** - No sensor in vehicle.
* **Cylinder Head Temperature ** - No sensor in vehicle.

### ⏰ Wake Commands
Many aftermarket alarm systems will send commands on the CANbus to awaken modules and then issue commands (lock, start etc.).  Additionally the vehicles TCU (telematics control unit) for things like Ford Pass can also awaken module.

I would like to know how to issue these types of commands from WiCAN.  Additionally WiCAN itself also has complexity with sleeping and being awake.  It would be interesting to understand if there's a path to wake the WiCAN and the vehicle without too much delay and issue commands (turn on puddle lights etc.).  This is an stretch goal for the project.

### 🔗 Useful Links

| Tool | Description |
|------|-------------|
| [PID List](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md) | Verified and tested OBDII PIDs for Ford Transit |
| [Transit Profile](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/2021-Ford-Transit-North-America.json) | Vehicle-specific profile for WiCAN |
| [MQTT YAML](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/mqtt-wican.yaml) | Sample Home Assistant MQTT config |
| [WiCAN Profile Editor](https://meatpihq.github.io/vehicle_profile_editor/) | Web UI to create or edit vehicle profiles |

## 💖 Support
The development of this repo took many hours and dollars in hardware, software, and testing.  If you found this useful, consider buying me a coffee. ☕

## Contributions

Open issues, suggest improvements, or contribute pull requests directly here on GitHub.

## License

This project is licensed under the MIT License. For more details, see the LICENSE file.&#x20;

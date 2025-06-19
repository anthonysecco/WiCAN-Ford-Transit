![image](https://github.com/user-attachments/assets/befab2a4-e66b-4935-ad08-d809927ac942) 

# WiCAN Ford Transit

[WiCAN](https://github.com/meatpiHQ/wican-fw) is an open source hardware / software project that allow the user to pull OBDII data and easily stream using [MQTT](https://en.wikipedia.org/wiki/MQTT) into [Home Assistant](https://www.home-assistant.io/) or other tools.  

From there a user can build custom dashboards (e.g. on a tablet) and automations while driving. 

| Useful Links |
|-------|
| [PID List](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md) |
| [WiCAN Profile Editor](https://meatpihq.github.io/vehicle_profile_editor/) |
| [Transit Profile](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/2021-Ford-Transit-North-America.json) |
| [MQTT YAML](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/mqtt-wican.yaml) |

## Project Scope
The project works for both WiCAN and WiCAN Pro unless indicated otherwise.

This project intends to:
1) To supplement real-time information that may not be displayed (or displayed well) on the instrument panel.
2) To provide actional data to Home Assistant to trigger actions

It does **not** intend to:
1) Replace OBDII diagnostic devices or software available on the market (FORScan, OBDwiz etc.)

Limiting factors on this project
1) The WiCAN is only **ON** when the vehicle igition is in the **ON** position.  This will limit use cases.
2) Ford does not publish their proprietary PIDs, this list is based on forum research, serial sniffing of OBDII tools, and some help from ChatGPT.

### Non-CAN Signals
It's far better to interface with the Transit using Non-CAN interfaces.  The are reliable and function even when the igition is **off**.  Here are examples of what's available:

**Auxilary Harness** - Standard equipment. Connector under the driver seat.
- Engine On/Off
- Igition On/Off
- Vehicle Speed Sensor

**High Spec Connector** - Optional equipment. Connector located behind the glovebox.
- Engine On/Off
- Igition On/Off
- Vehicle Speed Sensor
- Door Ajar (Driver, Passenger, Side, Cargo)
- Lock / Unlock Commands

For more information visit [Ford Transit Door Interface](https://github.com/anthonysecco/ford-transit-door-interface).

## Ford Transit Entities Available

> Testing performed on a 2021 Ford Transit AWD 3.5L EcoBoost (North America).

| Entity                                      | Type             | Unit | Source    | Tier |
|:--------------------------------------------|:-----------------|:-----|:----------|:-----|
| A/C Compressor Status                       | `binary_sensor`  |      | 0x22099B  | C    |
| Alternator Duty Cycle                       | `sensor`         | %    | 0x220598  | A    |
| Barometric Pressure                         | `sensor`         | psi  | 0x33      | B    |
| Boost Gauge                                 | `sensor`         | psi  | Template  | B    |
| Brake On/Off                                | `binary_sensor`  |      | 0x222B00  | C    |
| Drive Mode                                  | `sensor`         | enum | 0x220651  | B    |
| Engine Coolant Temp                         | `sensor`         | °F   | 0x22F405  | S    |
| Engine Horsepower                           | `sensor`         | hp   | Template  | B    |
| Engine Load                                 | `sensor`         | %    | 0x04      | A    |
| Engine Running                              | `binary_sensor`  |      | Template  | S    |
| Engine Speed                                | `sensor`         | RPM  | 0x0C      | B    |
| Engine Torque                               | `sensor`         | lb-ft| Template  | B    |
| Engine Torque Percent                       | `sensor`         | %    | 0x62      | B    |
| Engine Torque Reference                     | `sensor`         | Nm   | 0x63      | B    |
| Fuel Level                                  | `sensor`         | %    | 0x2F      | S    |
| Fuel Pressure Actual                        | `sensor`         | psi  | 0x22F423  | D    |
| Fuel Pressure Desired                       | `sensor`         | psi  | 0x2203DC  | D    |
| Fuel Rate                                   | `sensor`         | g/s  | 0x22F49D  | S    |
| Fuel System Status                          | `sensor`         | enum | 0x22F403  | A    |
| Fuel Pump Duty Cycle                        | `sensor`         | %    | 0x220307  | D    |
| Intake Air Temp                             | `sensor`         | °F   | 0x22F40F  | C    |
| Intake Air Temp 2                           | `sensor`         | °F   | 0x2203CA  | C    |
| Learned Octane Ratio                        | `sensor`         | %    | 0x2203E8  | A    |
| Manifold Pressure                           | `sensor`         | psi  | 0x0B      | B    |
| Oil Life                                    | `sensor`         | %    | 0x22054B  | B    |
| Odometer                                    | `sensor`         | mi   | 0xA6      | S    |
| OBD Status                                  | `binary_sensor`  |      | WiCAN     | S    |
| Real-Time Fuel Economy                      | `sensor`         | MPG  | Template  | S    |
| Throttle Position                           | `sensor`         | %    | 0x11      | D    |
| Transmission Fluid Temp                     | `sensor`         | °F   | 0x221E1C  | A    |
| Transmission Gear                           | `sensor`         | enum | 0x221E12  | S    |
| Tire Pressure Left Front                    | `sensor`         | InHg | 0x222813  | S    |
| Tire Pressure Left Rear Outer               | `sensor`         | InHg | 0x222816  | S    |
| Tire Pressure Right Front                   | `sensor`         | InHg | 0x222814  | S    |
| Tire Pressure Right Rear Outer              | `sensor`         | InHg | 0x222815  | S    |
| Vehicle Battery Current                     | `sensor`         | A    | 0x22402B  | C    |
| Vehicle Battery Power                       | `sensor`         | W    | Template  | C    |
| Vehicle Battery State of Charge             | `sensor`         | %    | 0x224028  | A    |
| Vehicle Battery Voltage                     | `sensor`         | V    | 0x22402A  | C    |
| Vehicle Speed                               | `sensor`         | mph  | 0x0D      | S    |
| Wastegate                                   | `sensor`         | %    | 0x220462  | D    |

### Tiers
| Tier  | Description|
|:------|:------|
| S     | Must Have |
| A     | Good to Have |
| B     | Nice to Have |
| C     | Not necessary |
| D     | Diagnostic |

The entity table above has been ranked based on what I find the most useful.  I use entities in tiers (S/A/B).

### More PID Information
For more details on the source, visit [PID List](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md). 

I've also provided a dump from OBDwiz [here](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/obdwiz.md).  I don't have a FORScan dump, but its similar.


## 🏗️ How It Works
The [WiCAN](https://github.com/meatpiHQ/wican-fw) device reads CAN data and publishes it to MQTT. From there, Home Assistant can subscribe to topics via YAML configuration to create sensors and automations.

This guide assumes you have WiCAN connected to the OBDII, joined it to your Wi-Fi network, have it communicating with your MQTT broker, and enabled AutoPID mode.  You may likely already have some standard PIDs working.

### Add Vehicle Profile
1) Download the JSON file here for the Ford Transit.
2) Navigate to **Automate** tab.
3) Upload vehicle profile JSON
4) Click 'Submit' to make the upload PIDs active.  This will reboot the WiCAN.

### Configure MQTT
You will need to instruct WiCAN on the topic you wish data to be posted.  You may use the topic provided in the this YAML file or one of your own choosing.

Additionaly, you'll need to set the interval.  For real-time data, I suggest an interval no less than 1000ms.  For non real-time data, I suggest as long of an interval as is reasonable.  For example, tire pressure and odometer, won't be changing as frequency, to 60000ms (60s) is plenty.  This reduces load on the WiCAN and Home Assistant.

Once configured, submit and reboot your WiCAN.  If all is well, you should see the data flowing into your MQTT broker.  Use MQTT Explorer to validate data is flowing.  I suggest keeping your vehicle running when testing to validate the sensors are working as expected.

### Configure MQTT Entities
Once you validated that all expected sensors are streaming into your MQTT broker, you may now begin to add the sensors to Home Assistant.

You may use the YAML file found [here](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/mqtt-wican.yaml) as a template to add your entities.  This YAML converts the MQTT topic into US Imperial units.

There are some template sensors also included in that YAML file for calcuated values such as Horsepower.

Reload your Home Assistant configuration and you should now see the entities.

## 🚗 Use Cases

> 🥼 I'm still experimenting to see how this data can be useful and will expand this section.

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

## 💪 Future Enhancements
The following are entities I would like to add.  It doesn't mean I've figured out how to yet.

| **Feature**                      | **Description**                                 |
| -------------------------------- | ----------------------------------------------- |
| **Inner Tires**                  | For Dual Rear Wheel Configurations              |
| **Parking Brake**                | In ABS module only, hard to access              |
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

## 💖 Support
The development of this repo took many hours and dollars in hardware, software, and testing.  If you found this useful, consider buying me a coffee. ☕

## Contributions

Open issues, suggest improvements, or contribute pull requests directly here on GitHub.

## License

This project is licensed under the MIT License. For more details, see the LICENSE file.&#x20;

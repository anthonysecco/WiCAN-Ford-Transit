> This repo is under heavy development.

# WiCAN Ford Transit
This project is intended to expose sensors from OBDII into Home Assistant.  This can be used to create custom dashboard on a tablet while driving or trigger automations.  Initially this project will be **read-only**.  Future versions may provide methods to send commands to the vehicle via OBDII.

> Testing was performed on 2021 Ford Transit AWD 3.5L Ecoboost for North America.

## How it works
This project relies on the [WiCAN Pro](https://github.com/meatpiHQ/wican-fw) to interface and translate messages to MQTT.  From there, MQTT YAML configurations makes sensors available to Home Assistant

## Available Sensors
There are many data points within the vehicle.  Many are useful for diagnostic purposes for troubleshooting issues.  My intent with WiCAN is not to recreate a diagnostic tool.  Instead I'm only interested in sensors that are useful while driving to trigger actions or provide _high level_ diagnostic that's not _already_ on the gauge cluster.  More data isn't always better.

The major challenge in this project is that Ford does not overtly publish the available PIDs on their vehicle.  Through scraping forums and sniffing the serial interface from OBDII scanner, and a little help with ChatGPT we can ascertain a number of PIDs and their formulas.

My approach



### Actionable Sensors
| Module | PID   | Description               | Type           | Home Assistant Use     | Status |
|--------|-------|---------------------------|----------------|-------------------------|--------|
| PCM    | TBD   | Gear Selection    | `sensor` (enum)   | Understand vehicle motion | ✅ Working |
| OBD    | TBD   | Speedometer    | `sensor` (kmph)   | Understand vehicle rate of motion | ✅ Working |
| PCM    | TBD   | Engine Speed      | `sensor` (rpm)   | Determine engine state on/off | ✅ Working |
| OBD    | TBD   | Fuel Gauge    | `sensor` (kmph)   | Trigger custom alerts | ✅ Working |

### Monitoring Sensors
| Module | PID   | Description               | Type           | Home Assistant Use     | Status |
|--------|-------|---------------------------|----------------|-------------------------|--------|
| PCM    | TBD   | Learned Octane Ratio      | `sensor` (%)   | Understand Fuel Quality | ✅ Working |
| PCM    | TBD   | Coolant Temp              | `sensor` (°C)  | Monitor overheating     | ✅ Working |
| PCM    | TBD   | Transmission Fluid Temp   | `sensor` (°C)  | Monitor overheating     | ✅ Working |
| PCM    | TBD   | Engine Oil Temp           | `sensor` (°C)  | Monitor overheating     | ✅ Working |
| PCM    | TBD   | Boost Gauge               | `sensor` (kPa) | Turbo performance       | ✅ Working |
| PCM    | TBD   | Wastegate Open            | `sensor` (%)   | Turbo performance       | ✅ Working |
| PCM    | TBD   | Oil Life                  | `sensor` (%)   | Gauge & Graph           | ✅ Working |
| PCM    | TBD   | Torque Reference      | `sensor` (nm)   | Torque Formula          | ✅ Working |
| PCM    | TBD   | Torque Percent        | `sensor` (%)   | Gauge & Graph           | ✅ Working |
| PCM    | TBD   | Throttle position     | `sensor` (%)   | Gauge & Graph           | ✅ Working |

| PCM    | TBD   | AFR Command      | `sensor` (nm)   | Understand combustion        | ✅ Working |
| PCM    | TBD   | AFR Bank 1        | `sensor` (%)   | Understand combustion         | ✅ Working |
| PCM    | TBD   | AFR Bank 2     | `sensor` (%)   | Understand combustion           | ✅ Working |

## Wishlist Sensors

- Parking Brake - Found in ABS module, hard to access

## Extended List

I am collecting actively collecting potential sensors are putting them in [PIDs](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md).  These are untested and may be completely made up by ChatGPT so take everything in there with a grain of salt.

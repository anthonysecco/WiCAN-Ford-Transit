> This repo is under heavy development.

# WiCAN Ford Transit
This project is intended to expose sensors from OBDII into Home Assistant.  This can be used to create custom dashboard on a tablet while driving or trigger automations.  Initially this project will be **read-only**.  Future versions may provide methods to send commands to the vehicle via OBDII.

In my application, I'm using my 2021 Ford Transit with AWD and an 3.5L Ecoboost engine here in North America.  It's being used as an RV with Home Assistant installed.

## How it works
This project relies on the [WiCAN Pro](https://github.com/meatpiHQ/wican-fw) to interface and translate messages to MQTT.  From there, MQTT YAML configurations makes sensors available to Home Assistant

## Available Sensors
Ford does not overtly publish the available PIDs on their vehicle.  That said, through forums and through sniffing traffic from OBDII scanners, we can ascertain the PIDs and their formulas.

I am collecting actively collecting potential sensors are putting them in [PIDs](https://github.com/anthonysecco/WiCAN-Ford-Transit/blob/main/PIDs.md).  These are untested and may not be applicable.

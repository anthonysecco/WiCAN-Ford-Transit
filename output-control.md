# Future enhancement: controlling lights, locks and horn

Idea: let Home Assistant switch the van's interior lights, exterior lights, locks and horn through the body module
(BCM, address 726), using UDS service 2F (input/output control by identifier).

**Not built yet.** The project is read-only today: nothing is written or sent to a module. Control may be added later,
once it can be done safely. Written 2026-11-01. Nothing here has been tested.

## Candidate outputs (BCM 726)

These items answer to service 22 reads, and their names say "output" or "output control". On Ford, the item you read
with 22 is usually the same one a tool controls with 2F. The value encoding for control is unknown until tested. The
read side is known: lamp outputs read 1 = on and 2 = off, and turn signals read 3 = flashing.

| Group | Item | Name |
|---|---|---|
| Interior lights | 42AC | Cabin lamp |
| | 42AD | Cargo lamp |
| | 425D | Demand lamp output |
| | 40EF | Backlighting LED control |
| Exterior lights | 41F0 / 41EF | Front / rear park lamps |
| | 41ED / 41F4 | Left / right front position lamps |
| | 41EC / 41F3 | Left / right front fog lamps |
| | 40DA / 40DB | Right / left high beams |
| | 40E0 / 40E2 / 40E3 / 40E4 | Turn signals (RR / LR / RF / LF) |
| | 40F5 | Center high-mounted stop lamp |
| | 40C8 | Reverse lamps |
| | 42A7 | License plate lamp |
| | 41F6 | Trailer tow park/tail lamp |
| Locks | 41E2 | Driver and all doors lock output |
| Horn | 41D3 | Horn relay output |

Related read-only items for feedback: door status 5B1D, last remote key request 4251, headlamp switch 429F,
ignition status 40B5.

## How 2F would work

- Request: `2F <item> <option> [value]`. Options: 00 hand control back to the module, 01 reset to default, 02 freeze
  current state, 03 force a value.
- Needs extended session (`10 03`) first. Security access (`27`) may also be needed.
- Holds only while the tool keeps the session alive with tester-present (`3E 80`). A few seconds after that stops, the
  module takes control back. So it's a "hold on" control, not a latching switch. A momentary action (horn chirp, lock
  pulse, light flash) fits it best.
- Always end with option 00 to hand control back cleanly.
- The BCM must be awake (ignition on or recently active). This can't wake a sleeping van; see "Wake Commands" in the
  [README](README.md#-wake-commands).
- The BCM may refuse non-default sessions in some states. Item 42A6, "NoDefault Session Lockout Status", suggests this.
  Expect refusals while moving.

## Plan for when it's built

1. Parked, engine off, ignition on: try one harmless output (cargo lamp 42AC). Check the read-back value and the
   physical lamp.
2. Map the value encoding for each output, and record which ones need security access.
3. Add a small command path on the WiCAN side (or a separate device) that exposes Home Assistant buttons. Each
   command: open the session, run 2F, keep it alive for the needed time, hand back with 00, close.
4. Home Assistant ideas: welcome/porch lighting on unlock or after dark, a lock/unlock button, "find my van" horn
   chirp and light flash, all lights off at bedtime.

## Safety rules

- Only when parked: Park, parking brake on, speed 0. Never send ignition, start or powertrain outputs.
- A forced output fights the module's own logic and can set trouble codes. Clear the override with option 00 every time.
- Don't use this for anything safety-critical: a dropped connection silently returns control to the module.
- For permanent RV wiring, Ford's upfitter interface options or the upfitter switch circuits may be the sturdier route.

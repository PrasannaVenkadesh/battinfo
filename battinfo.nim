import logging
import os
import system
import battery

proc compute_percentage(battery: string): int = 
  var charge_now: float = get_current_charge(battery)
  var capacity: float = get_total_capacity(battery)
  result = int((charge_now/capacity) * 100)

proc get_batt_info(battery: string) =
  info("Battery ID: " & os.last_path_part(battery))
  info("Manufacturer: " & get_manufacturer(battery))
  info("Model/Serial: " & get_model(battery) & "/" & get_serial(battery))
  info("Technology: " & get_tech(battery))
  info("Status: " & get_status(battery))
  info("Charge: " & $compute_percentage(battery) & "%")

if isMainModule:
  var console_log = logging.newConsoleLogger(fmt_str="")
  logging.addHandler(console_log)

  let batteries: seq[string] = battery.get_batteries()
  if batteries.len == 0:
    system.quit("Could not recognize any batteries in your system!", QuitFailure)
 
  info("Found " & $batteries.len & " Battery")
  info("---------------------")
  for battery in batteries:
    get_batt_info(battery)
    info("---------------------")

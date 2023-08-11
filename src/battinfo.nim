import logging
import os
import system

import battinfopkg/battery

proc display_batt_info(battery: string) =
  info("Battery ID: " & os.last_path_part(battery))
  info("Manufacturer: " & get_manufacturer(battery))
  info("Model/Serial: " & get_model(battery) & "/" & get_serial(battery))
  info("Technology: " & get_tech(battery))
  info("Status: " & get_status(battery))
  info("Charge: " & $get_percentage(battery) & "%")

if isMainModule:
  var console_log = logging.newConsoleLogger(fmt_str="")
  logging.addHandler(console_log)

  let batteries: seq[string] = battery.get_batteries()
  if batteries.len == 0:
    system.quit("Could not recognize any batteries in your system!", QuitFailure)
 
  info("Found " & $batteries.len & " Battery")
  info("---------------------")
  for battery in batteries:
    display_batt_info(battery)
    info("---------------------")

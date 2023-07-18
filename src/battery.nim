# std imports
import os
import re
import strutils

# local imports
from constants import POWER_PATH, BatteryFiles


proc get_batteries*(): seq[string] =
  for dir in os.walk_dir(POWER_PATH):
    if re.match(os.last_path_part(dir.path), re"^BAT\d+$"):
      result.add(dir.path)

proc get_current_charge*(batt_path: string): float =
  result = -1.0
  let charge_files: array[2, string] = [
    os.join_path(batt_path, $BatteryFiles.CHARGE_NOW),
    os.join_path(batt_path, $BatteryFiles.ENERGY_NOW)
  ]
  for charge_file in charge_files:
    if os.file_exists(charge_file):
      result = parse_float(read_file(charge_file).strip())
  return result

proc get_total_capacity*(batt_path: string): float = 
  result = -1.0
  let capacity_files: array[2, string] = [
    os.join_path(batt_path, $BatteryFiles.CHARGE_FULL),
    os.join_path(batt_path, $BatteryFiles.ENERGY_FULL)
  ]
  for capacity_file in capacity_files:
    if os.file_exists(capacity_file):
      result = parse_float(read_file(capacity_file).strip())
  return result

proc get_status*(batt_path: string): string = 
  let file_path: string = join_path(batt_path, $BatteryFiles.STATUS)
  return read_file(file_path).strip()

proc get_manufacturer*(batt_path: string): string = 
  let file_path: string = join_path(batt_path, $BatteryFiles.MANUFACTURER)
  return read_file(file_path).strip()

proc get_model*(batt_path: string): string = 
  let file_path: string = join_path(batt_path, $BatteryFiles.MODEL)
  return read_file(file_path).strip()

proc get_tech*(batt_path: string): string = 
  let file_path: string = join_path(batt_path, $BatteryFiles.TECH)
  return read_file(file_path).strip()

proc get_serial*(batt_path: string): string = 
  let file_path: string = join_path(batt_path, $BatteryFiles.SERIAL)
  return read_file(file_path).strip()

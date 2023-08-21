import re

let POWER_PATH*: string = "/sys/class/power_supply"
let BATTERY_REGEX* = re"^BAT\d+$"

type
  BatteryFiles* = enum
    CHARGE_NOW = "charge_now",
    CHARGE_FULL = "charge_full",
    ENERGY_NOW = "energy_now",
    ENERGY_FULL = "energy_full",
    MANUFACTURER = "manufacturer",
    MODEL = "model_name",
    SERIAL = "serial_number",
    STATUS = "status",
    TYPE = "type",
    TECH = "technology"

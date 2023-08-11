# battinfo

[![nimble](https://raw.githubusercontent.com/yglukhov/nimble-tag/master/nimble.png)](https://github.com/yglukhov/nimble-tag)

## Introduction

A simple command line utility and a [nim](https://nim-lang.org) library to discover batteries in your GNU/Linux machine and print it's information in the console.

## Get Started

Install using [nimble](https://github.com/nim-lang/nimble#readme) package manager

   ```shell
	 $ nimble install battinfo
   ```

**Note**: One can also install without nimble directly by downloading either the 64-bit executable binary or .deb package for Debian/Ubuntu based distros from the [releases](https://gitlab.com/prashere/battinfo/-/releases)


Using as cli tool

   ```shell
	 # discovers batteries and displays their info
	 $ battinfo
   ```

Using battinfo as library in your Nim program

```nim
import battinfopkg/battery

var batteries: seq = get_batteries()  # returns a sequence of battery files found in the system.
echo batteries

if batteries.len > 0:
  # following procedures accept battery file path as argument
  echo get_status(batteries[0])          # returns charging/discharging status as string
  echo get_manufacturer(batteries[0])    # returns the name of the manufacturer as string
  echo get_model(batteries[0])           # returns the battery model as string
  echo get_tech(batteries[0])            # returns the type of battery as string
  echo get_serial(batteries[0])          # returns serial info of the battery as string
  echo get_percentage(batteries[0])      # returns battery percentage left as int
  echo get_current_charge(batteries[0])  # returns the current charge as float
  echo get_total_capacity(batteries[0])  # returns the total capacity of the battery as float
```

## License

This software is offered as a Free Software under the terms of [GNU General Public License version 3](https://www.gnu.org/licenses/gpl-3.0.en.html).

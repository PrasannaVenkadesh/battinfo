# Package

version       = "0.2.0"
author        = "Prasanna Venkadesh"
description   = "cli tool & library to query battery info for GNU/Linux"
license       = "GPL-3.0-only"
srcDir        = "src"
installExt    = @["nim"]
binDir        = "bin"
bin           = @["battinfo"]


# Dependencies

requires "nim >= 1.6.12"

OVERVIEW
--------
This repository contains example of [*riverdi-eve-lib*](https://github.com/riverdi/riverdi-eve-lib) library integration for [*Raspberry Pi*](https://www.raspberrypi.org/) and other linux-based single board computers. Please check [*riverdi-eve-lib*](https://github.com/riverdi/riverdi-eve-lib) project repository for more info about library itself.

PREREQUISITES
-------------

To get started, please make sure, that all libraries and tools for C/C++ development on *Raspberry Pi* are properly installed and configured, and SPI interface is enabled via *raspi-config* tool.

CONNECTIONS
-----------

|  RiBUS connector | Raspberry Pi |
| ---- | ----- |
| VDD  | 3.3V  |
| GND  | GND   |
| SCLK | 11    |
| MISO | 9     |
| MOSI | 10    |
| CS   | 13    |
| INT  | 26    |
| PD   | 19    |

COMPILATION
-----------

__Note:__ *before compilation, please edit Makefile file to choose Embedded Video Engine series (-DEVE_1, -DEVE_2, -DEVE_3 or -DEVE_4 flags), choose type and size of connected TFT module (choose predefined macros for Riverdi EVE modules or edit timings manually in modules.h file for custom displays) or to adjust compilation settings.*

[1] Clone *'riverdi-eve-demo-rpi'* repository (with *'riverdi-eve-lib'* submodule):

`git clone --recursive git@github.com:riverdi/riverdi-eve-demo-rpi.git`

[2] Build and run demo application:

`cd riverdi-eve-demo-rpi`
`make`
`./riverdi-demo`

GETTING HELP
------------

Please contact Riverdi support - [*<contact@riverdi.com>*](contact@riverdi.com)

LICENSE
-------

See *LICENSE.txt* file for details.


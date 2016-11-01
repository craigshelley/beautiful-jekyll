---
layout: page
pagetype: project
permalink: /SiUSBXp_Linux_Driver
title: SiUSBXp Linux Driver
subtitle: An Open Source Implementation of the SiLabs USBXpress Driver using LibUSB
projectlogo: SiUSBXp_Linux_Logo.png
---

This is the project page for an open source implementation of the SiLabs USBXpress driver. USBXpress is a drop-in USB stack for the SiLabs C8051Fxxx series of microprocessors. SiLabs provide a closed source driver for Microsoft Windows, which provides a simple, yet powerful API. The driver discussed here is 100% open source alternative with an identical API, and is licensed under the terms of the GNU General Public Licence.

## Project History
This project started when a SiLabs C8051Fxxx based battery analyser was accidentally misclassified as a CP210x. The [CP210x Linux Driver](CP210x_Linux_Driver) had patches applied to support the relevant device VID/PIDs, however the device was later found to be incompatible.
The Computerised Battery Analyser, a product from [West Mountain Radio](http://www.westmountainradio.com) uses a .NET application as a front-end. The .NET application would run under Linux, with a little encouragement, using [Mono](http://www.mono-project.com). However a Linux version of the USBXpress driver was not available.
This driver was written with help from Michael Heubeck to allow devices using the USBXpress stack and application software to be ported to a Linux environment.

## Compatibility
This driver is userland implementation using [LibUSB](http://www.libusb.org), so strictly speaking, it isn't a true driver. It provides an identical API to that provided by SiUSBXp.dll which is intended to greatly simplify the task of porting applications. Furthermore, .NET applications that are capable of running under [Mono](http://www.mono-project.com), will "just work" without any need to recompile because Mono automatically links requests to SiUSBXp.dll to libSiUSBXp.so.

## Supported Features
The following table lists the implementation status of the SiUSBXp API function calls.

|    API Function      |   Status    |
|----------------------|-------------|
| SI_GetNumDevices     | Implemented |
| SI_GetProductString  | Implemented |
| SI_FillBuffer        | Implemented |
| SI_Close             | Implemented |
| Si_Read              | Implemented |
| SI_Write             | Implemented |
| SI_ResetDevice       | **Not Implemented** |
| SI_DeviceIOControl   | **Not Implemented** |
| SI_FlushBuffers      | Implemented |
| SI_SetTimeouts       | Implemented |
| SI_CheckRXQueue      | Implemented |

## SiUSBXp Linux Driver Download
[SiUSBXp.c](https://raw.githubusercontent.com/craigshelley/SiUSBXp/master/SiUSBXp.c) **(latest)**

## Compiling and Installing
To compile the library, you will need gcc and libusb-dev. The library can be compiled using the following command line;
 `gcc -shared -l usb -o libSiUSBXp.so SiUSBXp.c -Wall -fPIC`
After compiling, copy the library to your system's library directory.
 `cp libSiUSBXp.so /usr/local/lib/`

**Note 1:** In order to execute a program that uses libSiUSBXp.so, the USB device permissions must be configured correctly. This can be done manually by changing the permissions of the devices in /dev/bus/usb/..., however if the device is removed/reinserted the changes to the permissions may be lost. On most desktop systems, the permissions of devices can be configured permanently through [HAL](http://freedesktop.org/wiki/Software/hal).

**Note 2:** Also ensure that no kernel drivers are blocking access to the device by unloading the relevant kernel modules using rmmod. e.g.
 `rmmod cp210x`
 
## Credits
Michael Heubeck - Testing, Debugging, Protocol Analysis.  
Craig Shelley - Author

Although I cannot guarantee a timely response, use the contact links below if you have any questions or suggestions.

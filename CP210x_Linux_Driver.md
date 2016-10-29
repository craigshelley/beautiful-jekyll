---
layout: page
title: CP210x Linux Driver
subtitle: Linux Driver for SiLabs CP2101, CP2102 and CP2013 USB to Serial Bridges
---
![CP210x Linux Driver](/img/CP210x_Linux_Logo.png)

This is the project page for the Linux driver for CP2101, CP2102 and CP2103 based USB to serial bridges. The driver discussed here is 100% open source, and is licensed under the terms of the GNU General Public License.

## Project History
The CP210x driver is now distributed with 2.6 series kernels, and should be compiled and part of the default installation for most modern Linux distributions. In the majority of cases, no further action is required to use CP210x based devices.

The project began in December 2004, after purchasing a CP2101 based USB to RS232 converter cable. The cable was advertised as having Linux support however this was far from the case since the only Linux driver that was provided was in binary form, and for a specific Red Hat Linux kernel. For some reason the manufacturers try to keep the protocol used for configuring this device secret. Well, it's out in the open now!

After writing the first version of the open source driver, I received feedback from numerous companies, some with names we all recognise. This feedback has only reinforced my belief that using an open standard protocol for this type of device would have made it more appealing to many product designers.
With no data-sheets available, this driver had to be produced by tediously analysing the protocol used by the windows drivers.

## Supported Features
The open source driver supports the majority of the features of the CP210x devices, and should in theory be compatible with the basic functionality of the CP2103.

* 600 to 921600 Baud
* 5, 6, 7 or 8 Data bits
* None/Odd/Even/Mark/Space Parity modes
* 1, 1.5 or 2 Stop bits
* Optional RTS-CTS Flow control
* TIOCMGET/TIOCMSET ioctls enable flow control lines to be fully programmed
* Break on/off support

## CP210x Driver Download
The CP210x driver is distributed with 2.6 series kernels >=2.6.12. These can be downloaded in source form from http://www.kernel.org.
Using cp210x devices with older kernels, 2.4 series and 2.6 <2.6.12, is possible by applying the appropriate patch to the kernel source.
Note: The driver version numbers for the 2.4 and 2.6 development branches are not related because the two drivers are maintained separately.

### 2.4.x Kernel Patches
 [[media:CP210x_v0.05_2.4-backport.patch|CP210x_v0.05_2.4-backport.patch]]
 [[media:CP210x_v0.06_2.4-backport.patch|CP210x_v0.06_2.4-backport.patch]]
 [[media:CP210x_v0.07_2.4-backport.patch|CP210x_v0.07_2.4-backport.patch]]
 [[media:CP210x_v0.08_2.4-backport.patch|CP210x_v0.08_2.4-backport.patch]]
 [[media:CP210x_v0.09_2.4-backport.patch|CP210x_v0.09_2.4-backport.patch]]
 [[media:CP210x_v0.10_2.4-backport.patch|CP210x_v0.10_2.4-backport.patch]]
 [[media:CP210x_v0.11_2.4-backport.patch|CP210x_v0.11_2.4-backport.patch]] '''(latest)'''

=== 2.6.x Kernel Patches=== 
 [[media:CP210x_v0.07_2.6.11.12.patch|CP210x_v0.07_2.6.11.12.patch]] (for kernels <2.6.12)
For newer kernels, the driver is distributed with the source.

### Troubleshooting
First, ensure that the driver has loaded, run '''dmesg'''
There should be a line saying something similar to "cp210x.c: Silicon Labs CP2101/CP2102/CP2103 RS232 serial adaptor driver..."
Second, check that the driver has bound to the device, after making a connection to the USB, the following message should be present in dmesg, "CP210x converter detected", and "CP210x converter now attached to..."
If these stages have not happened, ensure the driver is loaded, check the output of lsmod. In order to detect your device, the product and vendor IDs must be recognised. CP210x based devices have vendor programmable device IDs and it is likely that if your device is not being detected, the device IDs are unknown. The device IDs can be obtained by running '''lsusb''' and appear as hex numbers in the format '''vendor:product'''. Verify that they are present in the list towards the top of drivers/usb/serial/cp210x.c which can be found in the kernel source directory. If modifications to the driver's device ID list are required, the module must be recompiled, and reinstalled.
After these initial stages, further problems are rare. However if you are still getting trouble, reload the module with the debug option "'''rmmod cp210x; modprobe cp210x debug'''". Then send me the output of '''lsusb -v''', and the output of '''dmesg''', when the driver is loaded, when the device inserted, and when an attempt is made to use the device. Also include the command line parameters/output of the program that was having trouble communicating. My email address is at the end of this page.

## Driver Development
The first version of this driver to go into the Linux kernel entered the bitkeeper patches for 2.6.12-rc1 and was at driver version 0.03. It had very basic support for opening the device, setting the baud rate. Since the flow control lines were not touched, the early version of the driver left them in the wrong state. This caused many problems in devices where the flow control lines were connected. Unfortunately, the cable which was being used for development only had the TX/RX signals connected, so it was impossible for development in this area by myself alone.
Karl Hiramoto, a developer with access to a CP2101 evaluation kit, provided excellent information by testing development versions of the driver, and was able to establish the correct bit mappings of all of the flow control lines.
At this point Munir Nassar, came to the rescue by providing some USB Snoopy logs, and also sent me a cable with the flow control lines connected. This enabled support for hardware flow control to be implemented, and was released as version 0.04 which became available in kernel version 2.6.12-rc5
The driver continues to be updated with new device IDs as they emerge.

## Credits
Making this driver wouldn't have been possible without the community support. I wish to thank Karl Hiramoto, Munir Nassar and Greg Kroah for their help, and also to to Andreas Weinberger for the original 2.4 back-port.
Please send bug reports and comments to [mailto:craig@microtron.org.uk craig@microtron.org.uk]
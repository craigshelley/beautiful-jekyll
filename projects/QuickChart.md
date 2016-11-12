---
layout: page
pagetype: project
permalink: /Quick_Chart_File_Format
title: Quick Chart File Format
subtitle: File Format Specification for Quick Chart (QCT) Compressed Raster Image Files
---
The Quick Chart file format (.QCT file extension) is a proprietary raster image format designed for storing high resolution maps. It allows the images to be decoded with very little processing overhead, while having an appreciable level of lossless compression. Geographical data embedded within the header allows the image to be mapped in terms of latitude and longitude.
Quick Chart is an efficient file format for map data because indexes within the file allow the relevent areas to be decoded at the desired level of magnification without having to process the entire file.

## History
The Quick Chart file format is officially a closed specification file format. However due to a large number of freely available files in .QCT format, I have decided to write an unofficial specification based on the content of the freely available .QCT files.
This specification is known to be incomplete, and although best attempts have been made to ensure that it is accurate, it is impossible to guarantee this.
This specification has been released with the intention that developers can use it to create conversion tools, input/output plugins or even mobile apps.

'''This information was NOT obtained by means of reverse engineering software applications.'''

## Licence
Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation Licence, Version 1.2 or any later version published by the Free Software Foundation.

## Quick Chart (QCT) File Format Specificatios
The Quick Chart specification can be downloaded in Portable Document Format format by following the links below;

* [The Quick Chart File Format Specification 1.00.pdf](https://raw.githubusercontent.com/craigshelley/QuickChart/master/Specification/The Quick Chart File Format Specification 1.00.pdf)
* [The Quick Chart File Format Specification 1.01.pdf](https://raw.githubusercontent.com/craigshelley/QuickChart/master/Specification/The Quick Chart File Format Specification 1.01.pdf)
* [The Quick Chart File Format Specification 1.02.pdf](https://raw.githubusercontent.com/craigshelley/QuickChart/master/Specification/The Quick Chart File Format Specification 1.02.pdf)
* [The Quick Chart File Format Specification 1.03.pdf](https://raw.githubusercontent.com/craigshelley/QuickChart/master/Specification/The Quick Chart File Format Specification 1.03.pdf) **(latest)**

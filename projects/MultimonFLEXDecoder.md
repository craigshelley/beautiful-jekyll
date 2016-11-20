---
layout: page
pagetype: project
permalink: /MultimonFLEXDecoder
title: Multimon FLEX Decoder
subtitle: An Open Source Decoder for the FLEX Paging Protocol
projectlogo: ????????
---

This is the project page for an open source implementation of a [FLEX paging protocol](https://en.wikipedia.org/wiki/FLEX_(protocol)) decoder for use with [Multimon-ng](https://github.com/EliasOenal/multimon-ng). With the widespread use of cellular networks, the use of pagers has seen a significant decline however under certain circumstances, pagers can provide a more reliable means of communication in unpopulated areas, and are still popular in certain service industries.

**WARNING: Monitoring pager communications could be illegal in your country. This decoder was created out of academic interest and released with the intention that it will have a legitimate, legal use.**

## History

In 2003 the [author discovered](https://internal.lboro.ac.uk/mail/public/lulu/2003-10/msg00064.html) that an Avermedia AverTV PCI Analogue TV tuner card could be tuned over a wider range of frequencies than originally designed. This enabled it to be used as a programmable radio scanner. Anyone who has used a radio scanner will soon realise that there are many unintelligible data transmissions which are broadcast at various pre-defined frequencies. Some of the data transmissions are at such a low baud rate that audible tones can be heard which sound like the chirps produced by a dial-up modem. The types of services which may be encountered include:

* Time/Date Services - Used to synchronise radio clocks
* Weather Reports
* Radiofax
* Pagers
* Air data services
* ISS Packet Radio

A piece of software called [Multimon](https://sourceforge.net/projects/multimon/) was found to allow some of these data transmissions to be identified and, in some cases, decoded.

While demonstrating this in 2011, the author discovered that many of the pager broadcasts observed in 2003 were now using a new protocol. This was identified to be [FLEX](https://en.wikipedia.org/wiki/FLEX_(protocol)) and Multimon did not support decoding it.

It was eventually found that [GNURadio](https://en.wikipedia.org/wiki/GNU_Radio) had some support for decoding FLEX messages, however the author did not possess any GNURadio compatible hardware and the FLEX decoder module did not perform the symbol synchronisation or quantization using a method which was compatible with Multimon. Furthermore, the decoder did not support error correction, and was written in C++.

After a few long nights of code hacking, the GNURadio FLEX decoder had been adapted to build with Multimon, a symbol synchroniser and quantiser had been written, and [BCH](https://en.wikipedia.org/wiki/BCH_code) 3121 [forward error correction](https://en.wikipedia.org/wiki/Forward_error_correction) had been implemented.

Although the decoder was functional, the code was in a dreadful mess. The task of tidying it up was daunting, and the original developers of Multimon could not be contacted. At this point, the Flex decoder became another dormant project, resigned to the back burner (the temp directory).

In 2015 the use of RTL-SDR based [software defined radio](https://en.wikipedia.org/wiki/Software-defined_radio) opened the radio spectrum up to new users in a way which had never before been possible. A new project called [multimon-ng](https://github.com/EliasOenal/multimon-ng) by [Elias Önal](https://github.com/EliasOenal) had picked up the development of Multimon and was available on [GitHub](https://github.com). Many of the features which Multimon had been severely lacking for many years were being added. It was also good to see Multimon had a new maintainer, and that Elias's updates had prompted renewed interest in the project. It was noticed that FLEX support was still missing from Multimon-NG, so the code from 2011 was dusted off and recompiled.

On [15th May 2015 a post was submitted](https://github.com/EliasOenal/multimon-ng/issues/1#issuecomment-101831418) to the [FLEX Support, Issue #1](https://github.com/EliasOenal/multimon-ng/issues/1) message thread to gauge interest. Following a significant code tidy up exercise, the FLEX decoder was [committed](https://github.com/EliasOenal/multimon-ng/commit/81e6429e48938f608f16521b727eb560f4a7986c) to Elias's tree on 25th May 2015.

This FLEX decoder continues to be updated by the open source community, developers and users. The software lives on!

## Where Can I Download It?

At the time of writing (2016), the best place to obtain Multimon-NG from is [Elias Önal's Multimon-NG repository on GitHub](https://github.com/EliasOenal/multimon-ng). Multimon-NG may now have binary packages available for your distribution, which would obviously be the recommended installation method.

## Useful FLEX Info

* [FLEX paging protocol](https://en.wikipedia.org/wiki/FLEX_(protocol)) Wikipedia
* [Design And Implementation Of A Practical FLEX Paging Decoder](http://scholar.lib.vt.edu/theses/public/etd-10597-161936/materials/THESIS.PDF)
* [Employing the FLEX Protocol in Messaging Applications](http://www.wirelessdesignonline.com/doc/employing-the-flex-protocol-in-messaging-appl-0001)
* [GNURadio Pager Decoder Libraries](http://gnuradio.org/redmine/projects/gnuradio/repository/revisions/master/show/gr-pager/lib)
* [The Original Multimon](https://sourceforge.net/projects/multimon/) SourceForge Page
* [The Author's multimon-ng Fork](https://github.com/craigshelley/multimon-ng) Please use Elias's repository as this will be out of date.

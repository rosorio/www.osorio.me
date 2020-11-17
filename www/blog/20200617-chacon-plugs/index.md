---
title: Using cheap Radio-controled plugs to buils a manageable power switch
categories: [arduino, hack, SDR]
---

I finally decide to build a manageable power switch at $WOME, but because the devices
I need to power-cycle are all over the house and not in a central place, I need somethin
more flexible than the commercial products available.

I decide to try with a couple of remote-managed power plugs from an european manufacturer
called [CHACON](https://chacon.com/fr/). The mention "433Mhz" in the product description
let me heope I can easily manage using an Ardouino board and and RF transmitter.

Searching through the web, you can see multiple projects who does sa same thing, including with
the "Chacon protocol", so I start reusing an existing project.

== Reusing an existing project








A couple of weeks ago I bought a set of [CHACON](https://chacon.com/fr/) On/Off remote plugs
in a DIY store. The plugs are good quality and fairly inexpensive, an excellent starting point to build
a remote power switch for my home devices.

Those plugs are radio managed, so you don't need to have a centralized power switch where everything
is connected, but instead multiple plugs devices across the house controlled from a single point.
On specs the maximum distance between the remote and the plug is 25 meters.

* Product specs on the [manufacturer website](https://chacon.com/en/remote-controlled-sockets/456-set-of-3-on-off-remote-controlled-sockets-remote-control-5411478546634.html)

The plugs uses the well known 433.92 MHz frequency, so I guess it will be easy to analyse the signal.

# First look with gprx

A first look at the signal with gqrx and an RTL2832U USB dongle looks promising, I adjust the receiver
on the 443.92 Mhz frequency and every time I pressed the remote control I hear the [audio signal](signal01.wav).
But the wave signal was less easy to interpret.





so I record it and edit
it with Audacidy, here is where real trouble starts.



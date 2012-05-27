DMX Controller
==============

What is it?
-----------

DMX Controller is a basic [Processing](http://processing.org)/Java based [DMX lighting controller](http://en.wikipedia.org/wiki/DMX512), the application is designed to be used in conjunction with an [Arduino](http://arduino.cc) with [DMX Shield](http://www.skpang.co.uk/catalog/arduino-dmx-shield-p-663.html) and the [DmxSimple](http://code.google.com/p/tinkerit/wiki/DmxSimple) library by Peter Knight.

How do I install it?
--------------------
1. Install [Processing](http://processing.org) and [Arduino](http://arduino.cc) software with Arduino drivers (as required).
2. Download the [DmxSimple](http://code.google.com/p/tinkerit/wiki/DmxSimple).
3. Copy DmxSimple library into [Arduino libraries folder](http://www.arduino.cc/en/Hacking/Libraries).
4. Open and upload the SerialToDmx sketch to the Arduino. 
5. Connect DMX Shield to the Arduino.
6. Connect a DMX cable between the shield and lights.
7. Download the [controlP5](http://www.sojamo.de/libraries/controlP5/).
8. Copy [controlP5](http://www.sojamo.de/libraries/controlP5/) library into the [Processing libraries folder](http://wiki.processing.org/w/How_to_Install_a_Contributed_Library).
9. Download the source code (above).
10. Open the source code in Processing and ensure you have.
11. Compile and run DMX Controller.

How does it work?
-----------------
1. On opening DMX Controller checks to see if an Arduino can be automatically detected and will attempt to connect, if you are already using that serial port it will crash.

If it doesn't connect to the Arduino automatically you can select it from the list in the top right corner (in red).

Note: Automatic detection is not available on Windows. Automatic detection is dumb, if you use another Arduino like device it may use that.

If you wish to disable automatic detection comment out those lines in the setup() routine.

2. Click, drag or scroll on each slider and the channel should update.

Need help?
----------
Raise a ticket here on GitHub with detailed notes of what went wrong. This code is untested.

Love it?
--------
Please donate some money to Cancer Research UK if you like this app.
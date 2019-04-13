This repo is for archiving purposes and some compile fixes for 5.0+.
Original source: https://steamcommunity.com/groups/linuxff/discussions/0/405692224235574471/

Logitech Force Feedback driver package
=======================================

This package contains new drivers for almost all Logitech force feedback wheels


Driver 'hid-lg4ff':

	Driving Force / Formula EX
	Driving Force Pro
	Driving Force GT
	G25 Racing Wheel
	G27 Racing Wheel
	G29 Driving Force Racing Wheel

Driver 'hid-logitech-hidpp':

	G920 Driving Force Racing Wheel


This package has only been tested on Ubuntu 15.10, but should work on all
distros that have at least a 4.2 kernel.

WARNING: This is experimental! Use at your own risk!


To build the driver, open a command prompt in the base directory and type:

	make


If your system is properly set up for building kernel modules (which is
normally the case), then everything should build without errors.


You can now reload the drivers using:

	sudo make load_g29

or

	sudo make load_g920


depending on the type of wheel you have. These last commands try to unload 
all drivers for USB HID support and reload them with the new versions. If
you have other drivers depending on hid, these commands may not work and
you'll have to modify the module list or do it manually. If you're going
to do this, remember that both your mouse and keyboard can (and probably
will) depend on these drivers. So you can imagine what happens if you just
unload everything. So before you do anything, try:

	lsmod | grep hid

And what drivers you have that directly or indirectly depend on this.
If you have more than hid-generic, usbhid, hid-logitech and 
hid-logitech-hidpp, add them to the rmmod commands in the Makefile.



The sources contained in this package are are slightly modified versions of:
KLGD (https://github.com/MadCatX)
Portions of the Linux kernel (https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/)
My experimental hid-lg4ff driver
G920 patches submitted for Linux 4.6 (http://www.spinics.net/lists/linux-input/msg42863.html)

All sources fall under the GPL2 licence used by the Linux kernel.


CP := cp
CAT := cat

build:
	$(MAKE) -C KLGD
	$(CP) KLGD/Module.symvers /tmp
	$(MAKE) -C KLGDFF/plugin
	$(MAKE) -C hid
	$(CAT) KLGDFF/plugin/Module.symvers >> /tmp/Module.symvers
	$(MAKE) -C hid-logitech
	$(RM) /tmp/Module.symvers
	$(MAKE) -C hid-logitech-hidpp

clean:
	$(MAKE) -C KLGD clean
	$(MAKE) -C KLGDFF/plugin clean
	$(MAKE) -C hid clean
	$(MAKE) -C hid-logitech clean
	$(MAKE) -C hid-logitech-hidpp clean

unload:
	-rmmod hid-logitech-hidpp hid-logitech klgd-ff-plugin klgd usbhid hid-generic hid
	modprobe hid-generic
	modprobe usbhid
	modprobe ff-memless

load_with_builtin_hid:
	-rmmod hid-logitech-hidpp hid-logitech hid-logitech-dj klgd-ff-plugin klgd usbhid hid-generic
	modprobe hid-generic
	modprobe usbhid
	modprobe ff-memless
	insmod KLGD/klgd.ko
	insmod KLGDFF/plugin/klgd_ff_plugin.ko
	-rmmod hid-logitech
	insmod hid-logitech/hid-logitech.ko

load_g29:
	-rmmod hid-logitech-hidpp hid-logitech hid-logitech-dj klgd-ff-plugin klgd usbhid hid-generic hid
	insmod hid/hid.ko
	modprobe hid-generic
	modprobe usbhid
	modprobe ff-memless
	insmod KLGD/klgd.ko
	insmod KLGDFF/plugin/klgd_ff_plugin.ko
	-rmmod hid-logitech
	insmod hid-logitech/hid-logitech.ko

load_g920:
	-rmmod hid-logitech-hidpp hid-logitech hid-logitech-dj klgd-ff-plugin klgd usbhid hid-generic hid
	insmod hid/hid.ko
	modprobe hid-generic
	modprobe usbhid
	insmod hid-logitech-hidpp/hid-logitech-hidpp.ko


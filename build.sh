
pkgbuild --analyze \
		 --root ./lib  \
		 libusb-lib.plist

pkgbuild --root ./lib \
		 --identifier com.libusb.libusb-lib \
		 --version 1 \
		 --install-location /usr/local/lib \
		 --component-plist libusb-lib.plist \
		 libusb-lib.pkg


pkgbuild --analyze \
		 --root ./include  \
		 libusb-inc.plist

pkgbuild --root ./include \
		 --identifier com.libusb.libusb-inc \
		 --version 1 \
		 --install-location /usr/local/include \
		 --component-plist libusb-inc.plist \
		 libusb-inc.pkg

productbuild --synthesize \
		     --package libusb-lib.pkg \
		     --package libusb-inc.pkg \
		     libusb.xml

productbuild --distribution ./libusb.xml \
			 --package-path . ./LibUSB.pkg

rm libusb-inc.pkg libusb-inc.plist libusb-lib.pkg libusb-lib.plist libusb.xml

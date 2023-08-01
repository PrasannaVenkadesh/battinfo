build_bin:
	nimble build -d:release --opt:size
	strip bin/battinfo

build_deb: build_bin
	cp -r bin build/
	chmod -R 755 build/
	fakeroot dpkg-deb --build build bin/battinfo_x86-64.deb

clean_artifacts:
	rm -rf bin/ build/bin

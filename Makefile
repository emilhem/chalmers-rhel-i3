
#
# Makefile to build i3 for RHEL 7.x on Chalmers machines
# Copyright (C) 2019  Emil Hemdal (emil AT hemdal DOT se)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# Thanks to:
#  * Jacob Jonsson (https://github.com/Jassob) - for help regarding certain Makefile syntax
#

dest = /chalmers/users/$(USER)/usr
buildDir = /tmp/$(USER)-i3build
srcDir = /tmp/$(USER)-i3src
dirs = $(dest) $(srcDir) $(buildDir)

jobs = -j8

export LD_LIBRARY_PATH+=:$(dest)/lib:$(dest)/include
export LIBRARY_PATH+=:$(dest)/lib:$(dest)/include
export LD_RUN_PATH+=:$(dest)/lib
export PKG_CONFIG_PATH+=:$(dest)/lib/pkgconfig:$(dest)/share/pkgconfig
export PREFIX=$(dest)


cairoVersion				:= 1.16.0
confuseVersion				:= 2.7
dmenuVersion				:= 4.8
freetypeVersion				:= 2.9.1
i3Version					:= 4.16
i3statusVersion				:= 2.12
libXdmcpVersion				:= 1.1.2
libevVersion				:= 4.25
libevdevVersion			:= 1.6.0
libnlVersion				:= 3.2.25
libxcbVersion				:= 1.13.1
libxkbcommonVersion			:= 0.8.2
lloyd-yajlVersion			:= 2.1.0
xcb-protoVersion			:= 1.13
xcb-util-cursorVersion		:= 0.1.3
xcb-util-imageVersion		:= 0.4.0
xcb-util-keysymsVersion		:= 0.4.0
xcb-util-renderutilVersion	:= 0.3.9
xcb-util-wmVersion			:= 0.4.1
xcb-util-xrmVersion		:= 1.3
xcb-utilVersion				:= 0.4.0


bzExtension 		:= .tar.bz2
gzExtension 		:= .tar.gz
xzExtension 		:= .tar.xz


cairoFolderName					:= cairo-$(cairoVersion)
confuseFolderName				:= confuse-$(confuseVersion)
dmenuFolderName					:= dmenu-$(dmenuVersion)
freetypeFolderName				:= freetype-$(freetypeVersion)
i3FolderName					:= i3-$(i3Version)
i3statusFolderName				:= i3status-$(i3statusVersion)
libXdmcpFolderName				:= libXdmcp-$(libXdmcpVersion)
libevFolderName					:= libev-$(libevVersion)
libevdevFolderName					:= libevdev-$(libevdevVersion)
libnlFolderName					:= libnl-$(libnlVersion)
libxcbFolderName				:= libxcb-$(libxcbVersion)
libxkbcommonFolderName			:= libxkbcommon-$(libxkbcommonVersion)
lloyd-yajlFolderName			:= $(lloyd-yajlVersion)
xcb-protoFolderName				:= xcb-proto-$(xcb-protoVersion)
xcb-util-cursorFolderName		:= xcb-util-cursor-$(xcb-util-cursorVersion)
xcb-util-imageFolderName		:= xcb-util-image-$(xcb-util-imageVersion)
xcb-util-keysymsFolderName		:= xcb-util-keysyms-$(xcb-util-keysymsVersion)
xcb-util-renderutilFolderName	:= xcb-util-renderutil-$(xcb-util-renderutilVersion)
xcb-util-wmFolderName			:= xcb-util-wm-$(xcb-util-wmVersion)
xcb-util-xrmFolderName		:= xcb-util-xrm-$(xcb-util-xrmVersion)
xcb-utilFolderName				:= xcb-util-$(xcb-utilVersion)


cairoFileName					:= $(cairoFolderName)$(xzExtension)
confuseFileName					:= $(confuseFolderName)$(gzExtension)
dmenuFileName					:= $(dmenuFolderName)$(gzExtension)
freetypeFileName				:= $(freetypeFolderName)$(bzExtension)
i3FileName						:= $(i3FolderName)$(bzExtension)
i3statusFileName				:= $(i3statusFolderName)$(bzExtension)
libXdmcpFileName				:= $(libXdmcpFolderName)$(bzExtension)
libevFileName					:= $(libevFolderName)$(gzExtension)
libevdevFileName					:= $(libevdevFolderName)$(xzExtension)
libnlFileName					:= $(libnlFolderName)$(gzExtension)
libxcbFileName					:= $(libxcbFolderName)$(bzExtension)
libxkbcommonFileName			:= $(libxkbcommonFolderName)$(xzExtension)
lloyd-yajlFileName				:= $(lloyd-yajlFolderName)$(gzExtension)
xcb-protoFileName				:= $(xcb-protoFolderName)$(bzExtension)
xcb-util-cursorFileName			:= $(xcb-util-cursorFolderName)$(bzExtension)
xcb-util-imageFileName			:= $(xcb-util-imageFolderName)$(bzExtension)
xcb-util-keysymsFileName		:= $(xcb-util-keysymsFolderName)$(bzExtension)
xcb-util-renderutilFileName		:= $(xcb-util-renderutilFolderName)$(bzExtension)
xcb-util-wmFileName				:= $(xcb-util-wmFolderName)$(bzExtension)
xcb-util-xrmFileName			:= $(xcb-util-xrmFolderName)$(bzExtension)
xcb-utilFileName				:= $(xcb-utilFolderName)$(bzExtension)


cairoUrl					:= https://www.cairographics.org/releases/$(cairoFileName)
confuseUrl					:= http://download.savannah.gnu.org/releases/confuse/$(confuseFileName)
dmenuUrl					:= http://dl.suckless.org/tools/$(dmenuFileName)
freetypeUrl					:= http://download.savannah.gnu.org/releases/freetype/$(freetypeFileName)
i3Url						:= https://i3wm.org/downloads/$(i3FileName)
i3statusUrl					:= https://i3wm.org/i3status/$(i3statusFileName)
libXdmcpUrl					:= https://www.x.org/archive/individual/lib/$(libXdmcpFileName)
libevUrl					:= http://dist.schmorp.de/libev/$(libevFileName)
libevdevUrl					:= https://www.freedesktop.org/software/libevdev/$(libevdevFileName)
libnlUrl					:= http://www.infradead.org/~tgr/libnl/files/$(libnlFileName)
libxcbUrl					:= https://xcb.freedesktop.org/dist/$(libxcbFileName)
libxkbcommonUrl				:= https://xkbcommon.org/download/$(libxkbcommonFileName)
lloyd-yajlUrl				:= https://github.com/lloyd/yajl/archive/$(lloyd-yajlFileName)
xcb-protoUrl				:= https://xcb.freedesktop.org/dist/$(xcb-protoFileName)
xcb-util-cursorUrl			:= https://xcb.freedesktop.org/dist/$(xcb-util-cursorFileName)
xcb-util-imageUrl			:= https://xcb.freedesktop.org/dist/$(xcb-util-imageFileName)
xcb-util-keysymsUrl			:= https://xcb.freedesktop.org/dist/$(xcb-util-keysymsFileName)
xcb-util-renderutilUrl		:= https://xcb.freedesktop.org/dist/$(xcb-util-renderutilFileName)
xcb-util-wmUrl				:= https://xcb.freedesktop.org/dist/$(xcb-util-wmFileName)
xcb-util-xrmUrl			:= https://github.com/Airblader/xcb-util-xrm/releases/download/v$(xcb-util-xrmVersion)/$(xcb-util-xrmFileName)
xcb-utilUrl					:= https://xcb.freedesktop.org/dist/$(xcb-utilFileName)


i3: $(buildDir)/i3
	@# No separate rule, just run dependency

$(dest):
	mkdir -p $@

$(srcDir):
	mkdir -p $@

$(buildDir):
	mkdir -p $@

.PHONY: clean fullclean test i3
clean:
	rm -rf $(buildDir)

fullclean: clean
	rm -rf $(srcDir)

$(srcDir)/$(i3FileName):
	curl --ipv4 --location -o $@ $(i3Url)

$(buildDir)/i3: $(dirs) i3status libev libevdev xcb-util-xrm $(srcDir)/$(i3FileName)
	tar -xf $(srcDir)/$(i3FileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	mkdir $(buildDir)/$(i3FolderName)/build
	cd $(buildDir)/$(i3FolderName)/build && $(buildDir)/$(i3FolderName)/configure --prefix=$(dest)
	cd $(buildDir)/$(i3FolderName)/build && make $(jobs) -C $(buildDir)/$(i3FolderName)/build -f $(buildDir)/$(i3FolderName)/build/Makefile
	cd $(buildDir)/$(i3FolderName)/build && make install -C $(buildDir)/$(i3FolderName)/build -f $(buildDir)/$(i3FolderName)/build/Makefile
	ln -s /usr/share/X11 $(dest)/share/

$(srcDir)/$(i3statusFileName):
	curl --ipv4 --location -o $@ $(i3statusUrl)

i3status: confuse dmenu libnl $(srcDir)/$(i3statusFileName)
	tar -xf $(srcDir)/$(i3statusFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(dmenuFileName):
	curl --ipv4 --location -o $@ $(dmenuUrl)

dmenu: freetype lloyd-yajl $(srcDir)/$(dmenuFileName)
	tar -xf $(srcDir)/$(dmenuFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	echo dmenu är bråkig
	sed -i 's|/usr/local|$(dest)/local|g' $(buildDir)/*/config.mk
	sed -i 's|/usr/include|$(dest)/include|g' $(buildDir)/*/config.mk
	sed -i 's|/usr/X11R6|$(dest)|g' $(buildDir)/*/config.mk
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(lloyd-yajlFileName):
	curl --ipv4 --location --ignore-content-length -o $@ $(lloyd-yajlUrl)

lloyd-yajl: $(srcDir)/$(lloyd-yajlFileName) #xcb-util-keysyms xcb-util cairo xcb-util-wm xcb-util-renderutil xcb-util-image libev xcb-proto libxcb libxkbcommon libXdmcp xcb-util-cursor confuse freetype
	tar -xf $(srcDir)/$(lloyd-yajlFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	# Av någon anledning fungerar inte --prefix så man måste använda -p istället.
	cd $(buildDir)/*/ && $(buildDir)/*/configure -p $(dest)
	cd $(buildDir)/*/ && make distro $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(libnlFileName):
	curl --ipv4 --location --ignore-content-length -o $@ $(libnlUrl)

libnl: $(srcDir)/$(libnlFileName)
	tar -xf $(srcDir)/$(libnlFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix $(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(xcb-util-keysymsFileName):
	curl --ipv4 --location -o $@ $(xcb-util-keysymsUrl)

xcb-util-keysyms: $(srcDir)/$(xcb-util-keysymsFileName)
	tar -xf $(srcDir)/$(xcb-util-keysymsFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(xcb-utilFileName):
	curl --ipv4 --location -o $@ $(xcb-utilUrl)

xcb-util: xcb-util-keysyms $(srcDir)/$(xcb-utilFileName)
	tar -xf $(srcDir)/$(xcb-utilFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(cairoFileName):
	curl --ipv4 --location -o $@ $(cairoUrl)

cairo: xcb-util $(srcDir)/$(cairoFileName)
	tar -xf $(srcDir)/$(cairoFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(xcb-util-wmFileName):
	curl --ipv4 --location -o $@ $(xcb-util-wmUrl)

xcb-util-wm: cairo $(srcDir)/$(xcb-util-wmFileName)
	tar -xf $(srcDir)/$(xcb-util-wmFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(xcb-util-renderutilFileName):
	curl --ipv4 --location -o $@ $(xcb-util-renderutilUrl)

xcb-util-renderutil: xcb-util-wm $(srcDir)/$(xcb-util-renderutilFileName)
	tar -xf $(srcDir)/$(xcb-util-renderutilFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(xcb-util-imageFileName):
	curl --ipv4 --location -o $@ $(xcb-util-imageUrl)

xcb-util-image: xcb-util-renderutil $(srcDir)/$(xcb-util-imageFileName)
	tar -xf $(srcDir)/$(xcb-util-imageFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(xcb-util-xrmFileName):
	curl --ipv4 --location -o $@ $(xcb-util-xrmUrl)

xcb-util-xrm: $(srcDir)/$(xcb-util-xrmFileName)
	tar -xf $(srcDir)/$(xcb-util-xrmFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(libevFileName):
	curl --ipv4 --location -o $@ $(libevUrl)

libev: xcb-util-image $(srcDir)/$(libevFileName)
	tar -xf $(srcDir)/$(libevFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(libevdevFileName):
	curl --ipv4 --location -o $@ $(libevdevUrl)

libevdev: libev $(srcDir)/$(libevdevFileName)
	tar -xf $(srcDir)/$(libevdevFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(xcb-protoFileName):
	curl --ipv4 --location -o $@ $(xcb-protoUrl)

xcb-proto: libev $(srcDir)/$(xcb-protoFileName)
	tar -xf $(srcDir)/$(xcb-protoFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(libxcbFileName):
	curl --ipv4 --location -o $@ $(libxcbUrl)

libxcb: xcb-proto $(srcDir)/$(libxcbFileName)
	tar -xf $(srcDir)/$(libxcbFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(libxkbcommonFileName):
	curl --ipv4 --location -o $@ $(libxkbcommonUrl)

libxkbcommon: libxcb $(srcDir)/$(libxkbcommonFileName)
	tar -xf $(srcDir)/$(libxkbcommonFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(libXdmcpFileName):
	curl --ipv4 --location -o $@ $(libXdmcpUrl)

libXdmcp: libxkbcommon $(srcDir)/$(libXdmcpFileName)
	tar -xf $(srcDir)/$(libXdmcpFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(xcb-util-cursorFileName):
	curl --ipv4 --location -o $@ $(xcb-util-cursorUrl)

xcb-util-cursor: libXdmcp $(srcDir)/$(xcb-util-cursorFileName)
	tar -xf $(srcDir)/$(xcb-util-cursorFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(confuseFileName):
	curl --ipv4 --location -o $@ $(confuseUrl)

confuse: xcb-util-cursor $(srcDir)/$(confuseFileName)
	tar -xf $(srcDir)/$(confuseFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

$(srcDir)/$(freetypeFileName):
	curl --ipv4 --location -o $@ $(freetypeUrl)

freetype: $(srcDir)/$(freetypeFileName)
	tar -xf $(srcDir)/$(freetypeFileName) -C $(buildDir)
	chmod +x -R $(buildDir)
	cd $(buildDir)/*/ && $(buildDir)/*/configure --prefix=$(dest)
	cd $(buildDir)/*/ && make $(jobs) -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	cd $(buildDir)/*/ && make install -C $(buildDir)/*/ -f $(buildDir)/*/Makefile
	rm -rf $(buildDir)/*

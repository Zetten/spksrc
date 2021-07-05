SPK_NAME = navidrome
SPK_VERS = 0.44.1
SPK_REV = 5
SPK_ICON = src/navidrome.png
DSM_UI_DIR = app

DEPENDS = cross/busybox cross/$(SPK_NAME)

UNSUPPORTED_ARCHS = $(PPC_ARCHES)
GENERIC_ARCHS = ARM7

MAINTAINER = zetten
DESCRIPTION = Modern Music Server and Streamer compatible with Subsonic/Airsonic
RELOAD_UI = yes
DISPLAY_NAME = navidrome
HOMEPAGE = https://github.com/navidrome/navidrome
LICENSE = GPL-3.0
STARTABLE = yes

WIZARDS_DIR = src/wizard/

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 4533
SERVICE_PORT_TITLE = $(DISPLAY_NAME)
SERVICE_WIZARD_SHARE = wizard_data_directory

SERVICE_EXE = $${SYNOPKG_PKGDEST}/bin/navidrome

# Admin link for in DSM UI
ADMIN_PORT = $(SERVICE_PORT)

BUSYBOX_CONFIG = usrmng daemon nice
ENV += BUSYBOX_CONFIG="$(BUSYBOX_CONFIG)"

include ../../mk/spksrc.spk.mk

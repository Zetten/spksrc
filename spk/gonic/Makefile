SPK_NAME = gonic
SPK_VERS = 0.12.2
SPK_REV = 7
SPK_ICON = src/gonic.png
DSM_UI_DIR = app

DEPENDS = cross/busybox cross/$(SPK_NAME)

UNSUPPORTED_ARCHS = $(PPC_ARCHES)
GENERIC_ARCHS = ARM7

MAINTAINER = zetten
DESCRIPTION = Music streaming server / subsonic server API implementation
RELOAD_UI = yes
DISPLAY_NAME = gonic
HOMEPAGE = https://github.com/sentriz/gonic
LICENSE = GPL-3.0
STARTABLE = yes

WIZARDS_DIR = src/wizard/

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 4747
SERVICE_PORT_TITLE = $(DISPLAY_NAME)
SERVICE_WIZARD_SHARE = wizard_data_directory

SERVICE_EXE = $${SYNOPKG_PKGDEST}/bin/gonic

# Admin link for in DSM UI
ADMIN_PORT = $(SERVICE_PORT)

BUSYBOX_CONFIG = usrmng daemon nice
ENV += BUSYBOX_CONFIG="$(BUSYBOX_CONFIG)"

include ../../mk/spksrc.spk.mk


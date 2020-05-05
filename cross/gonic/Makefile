PKG_NAME = gonic
PKG_VERS = 0.8.8
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/sentriz/$(PKG_NAME)/archive
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
EXTRACT_PATH = $(WORK_DIR)/src/github.com/$(PKG_NAME)
PKG_DIR =  $(PKG_NAME)-$(PKG_VERS)

DEPENDS = native/go cross/zlib cross/taglib cross/alsa-lib cross/sqlite cross/ffmpeg
UNSUPPORTED_ARCHS = $(PPC_ARCHES)
GENERIC_ARCHS = ARM7

HOMEPAGE = https://github.com/sentriz/gonic
COMMENT  = Music streaming server / subsonic server API implementation
LICENSE  = GPL-3.0

COMPILE_TARGET = my_build_target

GO_SRC_DIR = $(EXTRACT_PATH)/$(PKG_NAME)-$(PKG_VERS)
GO_BIN_DIR = $(GO_SRC_DIR)/$(PKG_NAME)
GO_LDFLAGS = -s -w

include ../../mk/spksrc.cross-go.mk

my_build_target:
	@$(MSG) - Compile with go build
	cd $(GO_SRC_DIR) && env $(ENV) CGO_ENABLED=1 CGO_CFLAGS="$(CFLAGS)" CGO_CPPFLAGS="$(CPPFLAGS)" CGO_CXXFLAGS="$(CXXFLAGS)" CGO_LDFLAGS="$(LDFLAGS) " go build $(GO_BUILD_ARGS) cmd/gonic/main.go

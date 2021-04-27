PKG_NAME = navidrome
PKG_VERS = 0.42.0
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/navidrome/$(PKG_NAME)/archive
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
EXTRACT_PATH = $(WORK_DIR)/src/github.com/$(PKG_NAME)
PKG_DIR =  $(PKG_NAME)-$(PKG_VERS)
PKG_GIT_SHA = 43bb075849fe0d573c20c1baddb45cabf72833b6

DEPENDS = native/go native/nodejs cross/taglib

HOMEPAGE = https://github.com/navidrome/navidrome
COMMENT  = Modern Music Server and Streamer compatible with Subsonic/Airsonic
LICENSE  = GPL-3.0

POST_EXTRACT_TARGET = navidrome_post_extract
PRE_COMPILE_TARGET = navidrome_setup
COMPILE_TARGET = navidrome_compile
INSTALL_TARGET = navidrome_install

GO_SRC_DIR = $(EXTRACT_PATH)/$(PKG_NAME)
GO_BIN_DIR = $(GO_SRC_DIR)/$(PKG_NAME)

ENV += GO111MODULE=on
ENV += NPM_CONFIG_USER=root

PATH := $(WORK_DIR)/../../../native/nodejs/work-native/node/bin:$(PATH)

GO_BUILD_ARGS = -tags=netgo

GO_LDFLAGS  = 
GO_LDFLAGS += -X github.com/navidrome/navidrome/consts.gitSha=f1bd736b20e9d985f3a224f2067ace0ca5ce7a47
GO_LDFLAGS += -X github.com/navidrome/navidrome/consts.gitTag=0.42.0

include ../../mk/spksrc.cross-go.mk

# rename extracted folder to make imports work when used as GOPATH
navidrome_post_extract:
	cd $(EXTRACT_PATH) && [ -d $(PKG_DIR) ] && mv $(PKG_DIR) $(PKG_NAME)

navidrome_setup:
	@$(MSG) - Set up navidrome dependencies
	cd $(GO_SRC_DIR) && env $(ENV) make setup

navidrome_compile:
	@$(MSG) - Compile navidrome with npm and go build
	cd $(GO_SRC_DIR)/ui && env $(ENV) npm run build
	cd $(GO_SRC_DIR) && env $(ENV) CGO_ENABLED=1 CGO_CFLAGS="$(CFLAGS)" CGO_CPPFLAGS="$(CPPFLAGS)" CGO_CXXFLAGS="$(CXXFLAGS)" CGO_LDFLAGS="$(LDFLAGS) " go build $(GO_BUILD_ARGS)

navidrome_install:
	cd $(GO_SRC_DIR) && cp navidrome $(STAGING_INSTALL_PREFIX)/bin/navidrome

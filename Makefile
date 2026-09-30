export TARGET := iphone:clang:latest:13.0
export ARCHS = arm64 arm64e

# Rootless (Dopamine, iOS 15/16, palera1n):
#   make package ROOTLESS=1 FINALPACKAGE=1
# Rootful (unc0ver/checkra1n/Taurine, iOS 12-14):
#   make package FINALPACKAGE=1
ifeq ($(ROOTLESS), 1)
	export THEOS_PACKAGE_SCHEME = rootless
endif

# Theos uses the newest SDK it can find (the Xcode SDK on macOS, or whatever is
# in $(THEOS)/sdks). Uncomment and adjust to pin a specific one.
# export SYSROOT = $(THEOS)/sdks/iPhoneOS16.5.sdk

INSTALL_TARGET_PROCESSES = Cydia Zebra Installer Sileo Tweakio Preferences Zebra-Alpha Sileo-Beta Sileo-Nightly

ifeq ($(RELEASE), 1)
	PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
endif

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = TweakioiOSRepoUpdates

$(LIBRARY_NAME)_FILES = Tweak.x
$(LIBRARY_NAME)_FRAMEWORKS += Foundation
$(LIBRARY_NAME)_LIBRARIES += substrate
$(LIBRARY_NAME)_CFLAGS = -fobjc-arc
# Rootless builds get /var/jb prefixed by the theos rootless scheme, which is
# where Tweakio looks for plugins (ROOT_PATH_NS(@"/Library/TweakioPlugins/")).
$(LIBRARY_NAME)_INSTALL_PATH = /Library/TweakioPlugins

include $(THEOS_MAKE_PATH)/library.mk

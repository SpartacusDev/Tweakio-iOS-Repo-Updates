export TARGET := iphone:clang:latest:13.0
export SYSROOT = $(THEOS)/sdks/iPhoneOS13.7.sdk
export ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = Cydia Zebra Installer Sileo Tweakio Preferences Zebra-Alpha Sileo-Beta Sileo-Nightly
THEOS_DEVICE_IP = Spartacus-iPhone-2.local

ifeq ($(RELEASE), 1)
	PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)
endif

ifeq ($(ROOTLESS), 1)
	export THEOS_PACKAGE_SCHEME = rootless
endif

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = TweakioiOSRepoUpdates

$(LIBRARY_NAME)_FILES = Tweak.x
$(LIBRARY_NAME)_FRAMEWORKS += Foundation
$(LIBRARY_NAME)_LIBRARIES += substrate
$(LIBRARY_NAME)_CFLAGS = -fobjc-arc
$(LIBRARY_NAME)_INSTALL_PATH = /Library/TweakioPlugins

include $(THEOS_MAKE_PATH)/library.mk

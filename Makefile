ARCHS = arm64 arm64e


INSTALL_TARGET_PROCESSES = SpringBoard

export THEOS=/var/jb/var/mobile/theos
TARGET := iphone:clang:latest:16.0

THEOS_PACKAGE_SCHEME=rootless


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = iGLog1n

iGLog1n_FILES = Tweak.xm
iGLog1n_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value

include $(THEOS_MAKE_PATH)/tweak.mk













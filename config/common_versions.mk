# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=MMB29U BUILD_ID=MMB29U BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

ANDROID_NAME := sixzeroone
export ANDROID_NAME

    CUSTOM_BUILD_TYPE := UNOFFICIAL
    PLATFORM_VERSION_CODENAME := UNOFFICIAL
    BENZO_POSTFIX := -$(shell date -u +%Y%m%d)

ROM_DATE := $(shell date -u +%Y%m%d)-$(shell date -u +%H%M)
ROM_VERSION := $(ROM_DATE)-$(TARGET_DEVICE)
OTA_DATE := $(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.benzo.version=$(ROM_VERSION) \
  ro.modversion=$(ROM_VERSION)

BENZO_ROM_NAME := Benzo
BENZO_DEVICE_URL := http://files.oceighty.co/benzo

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ota.romname=$(TARGET_DEVICE) \
    ro.ota.version=$(OTA_DATE) \
    ro.ota.device=$(TARGET_DEVICE) \
    ro.ota.manifest=http://oceighty.co/ota/ota.xml

# DragonTC info
DRAGONTC_VERSION := 3.9
export $(DRAGONTC_VERSION)

DTC_PATH := prebuilts/clang/linux-x86/host/$(DRAGONTC_VERSION)
DTC_VER := $(shell cat $(DTC_PATH)/VERSION)
export $(DTC_VER)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dtc.version=$(DTC_VER)


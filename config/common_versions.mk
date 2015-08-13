
# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=LVY48E BUILD_ID=LVY48E BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

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

export BENZO_OTA_ROM=$(BENZO_ROM_NAME)
export BENZO_OTA_VERNAME=benzo-fivedotone-$(ROM_VERSION)
export BENZO_OTA_VER=$(OTA_DATE)
export BENZO_OTA_URL=$(BENZO_DEVICE_URL)/$(BENZO_OTA_VERNAME).zip

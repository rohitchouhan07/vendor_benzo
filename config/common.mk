# Inherit build optimizations
include vendor/benzo/config/optimizations/optimizations.mk

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.com.android.dataroaming=false \
    ro.build.selinux=0 \
    persist.debug.wfd.enable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
    ro.layers.noIcon=noIcon \
    persist.sys.root_access=3

# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.adb.secure=0 \
	ro.secure=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/benzo/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions

# Density Backup
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/addon.d/95-backup.sh:system/addon.d/95-backup.sh \
    vendor/benzo/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# init.d support
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/benzo/prebuilt/common/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# init file
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/init.benzo.rc:root/init.benzo.rc

# Google DNS server
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/benzo/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Layers backup
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/addon.d/71-layers.sh:system/addon.d/71-layers.sh

# SuperSU
PRODUCT_COPY_FILES += \
   vendor/benzo/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
   vendor/benzo/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Viper4Android etxra files
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/addon.d/91-v4a.sh:system/addon.d/91-v4a.sh \
    vendor/benzo/prebuilt/common/etc/v4a.zip:system/addon.d/v4a.zip

# Extra packages
PRODUCT_PACKAGES += \
    BenzoBlock \
    BenzoOTA \
    Chromium \
    Gallery2 \
    KernelAdiutor \
    Launcher3 \
    LayersManager \
    LMT \
    LockClock \
    OmniJaws \
    OmniSwitch \
    Terminal \
    Viper4Android

# Busybox
PRODUCT_PACKAGES += \
    Busybox

PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay/common

include vendor/benzo/config/optimizations/sm.mk

# Inherit common product build prop overrides
-include vendor/benzo/config/common_versions.mk

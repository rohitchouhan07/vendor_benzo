# Inherit build optimizations
include vendor/benzo/config/optimizations.mk

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
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.build.selinux=0 \
    persist.debug.wfd.enable=1 \

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    ro.allow.mock.location=0 \
    ro.debuggable=1 \
    persist.service.adb.enable=1

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/bin/50-benzo.sh:system/addon.d/50-benzo.sh \
    vendor/benzo/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/benzo/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions

# Density Backup
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/addon.d/95-backup.sh:system/addon.d/95-backup.sh \
    vendor/benzo/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# SuperSU
PRODUCT_COPY_FILES += \
   vendor/benzo/prebuilt/common/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
   vendor/benzo/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Viper4Android
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/addon.d/91-v4a.sh:system/addon.d/91-v4a.sh \
    vendor/benzo/prebuilt/common/priv-app/ViPER4Android_FX_A4.x/ViPER4Android_FX_A4.x.apk:system/priv-app/ViPER4Android_FX_A4/ViPER4Android_FX_A4.x.apk \
    vendor/benzo/prebuilt/common/priv-app/ViPER4Android_FX_A4.x/lib/arm/libV4AJniUtils.so:system/priv-app/ViPER4Android_FX_A4/lib/arm/libV4AJniUtils.so \
    vendor/benzo/prebuilt/common/etc/v4a.zip:system/addon.d/v4a.zip

# Log fix for GCC 5.2
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/logfix.zip:system/addon.d/logfix.zip

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

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Adblocker
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/app/BenzoBlock/BenzoBlock.apk:system/app/BenzoBlock/BenzoBlock.apk

# LMT (PIE)
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/priv-app/LMT/LMT.apk:system/priv-app/LMT/LMT.apk \
    vendor/benzo/prebuilt/common/priv-app/LMT/lib/arm/libTouchServiceNative.so:system/priv-app/LMT/lib/arm/libTouchServiceNative.so

# Benzo Performance
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/priv-app/BPerf/BPerf.apk:system/priv-app/BPerf/BPerf.apk

# Extra packages
PRODUCT_PACKAGES += \
    BenzoOTA \
    Development \
    Eleven \
    LockClock \
    OmniSwitch \
    Profiles \
    SlimLauncher \
    VisualizationWallpapers

# Busybox
PRODUCT_PACKAGES += \
    Busybox

# Extra externals
PRODUCT_PACKAGES += \
    libncurses \
    unrar \
    vim \
    zip

PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su

# Screen recorder package and lib
PRODUCT_PACKAGES += \
    ScreenRecorder \
    libscreenrecorder

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1

# CM Platform Library
PRODUCT_PACKAGES += \
    org.cyanogenmod.platform-res \
    org.cyanogenmod.platform \
    org.cyanogenmod.platform.xml

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

ifndef CM_PLATFORM_SDK_VERSION
  # This is the canonical definition of the SDK version, which defines
  # the set of APIs and functionality available in the platform.  It
  # is a single integer that increases monotonically as updates to
  # the SDK are released.  It should only be incremented when the APIs for
  # the new release are frozen (so that developers don't write apps against
  # intermediate builds).
  CM_PLATFORM_SDK_VERSION := 2
endif

ifndef CM_PLATFORM_REV
  # For internal SDK revisions that are hotfixed/patched
  # Reset after each CM_PLATFORM_SDK_VERSION release
  # If you are doing a release and this is NOT 0, you are almost certainly doing it wrong
  CM_PLATFORM_REV := 0
endif

PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.display.version=$(CM_DISPLAY_VERSION)

# CyanogenMod Platform SDK Version
PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.build.version.plat.sdk=$(CM_PLATFORM_SDK_VERSION)

# CyanogenMod Platform Internal
PRODUCT_PROPERTY_OVERRIDES += \
  ro.cm.build.version.plat.rev=$(CM_PLATFORM_REV)

# T-Mobile theme engine
include vendor/benzo/config/themes_common.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/benzo/overlay/common

# SM Makefile
include vendor/benzo/config/sm.mk

# Inherit common product build prop overrides
-include vendor/benzo/config/common_versions.mk

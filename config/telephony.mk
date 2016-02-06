# World APN lists
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/benzo/prebuilt/common/etc/old-apns-conf.xml:system/etc/old-apns-conf.xml

# World SPN lists
PRODUCT_COPY_FILES += \
    vendor/benzo/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml \
    vendor/benzo/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Stk

# Enable tethering
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dun.override=0

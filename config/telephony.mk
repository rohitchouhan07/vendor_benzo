# World APN list
#PRODUCT_COPY_FILES += \
#    vendor/benzo/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Stk

# Enable tethering
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dun.override=0

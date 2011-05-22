# Inherit common stuff
$(call inherit-product, vendor/aosp/products/common.mk)

#Theme packages
include vendor/aosp/products/themes.mk

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Playa.ogg \
    ro.config.notification_sound=regulus.ogg \
    ro.config.alarm_alert=Alarm_Beep_03.ogg

# Inherit common stuff
$(call inherit-product, vendor/TeamICS/products/common.mk)

#Theme packages
include vendor/TeamICS/products/themes.mk

# Include extra dictionaries for LatinIME
PRODUCT_PACKAGE_OVERLAYS += vendor/TeamICS/overlay/dictionaries

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Playa.ogg \
    ro.config.notification_sound=regulus.ogg \
    ro.config.alarm_alert=Alarm_Beep_03.ogg

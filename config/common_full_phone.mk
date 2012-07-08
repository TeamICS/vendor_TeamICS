# Inherit common CM stuff
$(call inherit-product, vendor/TeamICS/config/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/NewAudio.mk
include frameworks/base/data/sounds/OldAudio.mk

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Playa.ogg \
    ro.config.notification_sound=regulus.ogg \
    ro.config.alarm_alert=Alarm_Beep_03.ogg

PRODUCT_PACKAGES += \
  Mms

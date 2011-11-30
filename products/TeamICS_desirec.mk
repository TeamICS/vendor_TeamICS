# Inherit AOSP device configuration for desirec.
$(call inherit-product, device/htc/desirec/full_desirec.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/TeamICS/products/common.mk)

# Copy compatible prebuilt files
PRODUCT_COPY_FILES +=  \
    vendor/TeamICS/prebuilt/app/Superuser.apk:system/app/Superuser.apk \
    vendor/TeamICS/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

#
# Setup device specific product configuration.
#
PRODUCT_NAME := TeamICS_desirec
PRODUCT_BRAND := verizon
PRODUCT_DEVICE := desirec
PRODUCT_MODEL := ERIS
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 BUILD_FINGERPRINT=google/passion/passion:2.3.3/GRI40/102588:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.3 GRI40 102588 release-keys"

# Extra overlay for Gallery3D orientation hack
PRODUCT_PACKAGE_OVERLAYS += vendor/TeamICS/overlay/desirec

PRODUCT_RELEASE_NAME := desirec
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/TeamICS/products/common_versions.mk


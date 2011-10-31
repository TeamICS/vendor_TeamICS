# Inherit AOSP device configuration for heroc.
$(call inherit-product, device/htc/heroc/heroc.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aosp/products/common_full.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := aosp_heroc
PRODUCT_BRAND := sprint
PRODUCT_DEVICE := heroc
PRODUCT_MODEL := HERO200
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 BUILD_FINGERPRINT=google/passion/passion:2.3.3/GRI40/102588:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.3 GRI40 102588 release-keys"

# Extra overlay for Gallery3D orientation hack
PRODUCT_PACKAGE_OVERLAYS += vendor/aosp/overlay/heroc
PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/aosp/prelink-linux-arm-heroc.map

PRODUCT_RELEASE_NAME := Heroc
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/aosp/products/common_versions.mk


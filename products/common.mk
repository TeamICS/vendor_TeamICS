# Generic aosp product
PRODUCT_NAME := aosp
PRODUCT_BRAND := aosp
PRODUCT_DEVICE := generic

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# THC specific product packages
PRODUCT_PACKAGES += \
    AndroidTerm \
    CMParts \
    CMScreenshot \
    screenshot \
    DSPManager \
    libcyanogen-dsp \
    FileManager

# Extra tools in THC
PRODUCT_PACKAGES += \
    liblzo \
    lsof \
    openvpn

# Common THC Overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/aosp/overlay/common

# T-Mobile theme engine
include vendor/aosp/products/themes_common.mk

PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/aosp/prebuilt/common/bin/modelid_cfg.sh:system/bin/modelid_cfg.sh \
    vendor/aosp/prebuilt/common/bin/verify_cache_partition_size.sh:system/bin/verify_cache_partition_size.sh \
    vendor/aosp/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/aosp/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/aosp/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/aosp/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/aosp/prebuilt/common/etc/profile:system/etc/profile \
    vendor/aosp/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/aosp/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/aosp/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/aosp/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/aosp/prebuilt/common/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    vendor/aosp/prebuilt/common/etc/init.d/06mountdl:system/etc/init.d/06mountdl \
    vendor/aosp/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
    vendor/aosp/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/aosp/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/aosp/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/aosp/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/aosp/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/aosp/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/aosp/prebuilt/common/xbin/powertop:system/xbin/powertop \
    vendor/aosp/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

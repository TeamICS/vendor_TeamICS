PRODUCT_BRAND ?= TeamICS

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=TeamICS

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_COPY_FILES += \
    vendor/TeamICS/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/TeamICS/prebuilt/common/bin/sysinit:system/bin/sysinit

# Compcache/Zram support
PRODUCT_COPY_FILES += \
    vendor/TeamICS/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/TeamICS/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/TeamICS/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache

PRODUCT_COPY_FILES +=  \
    vendor/TeamICS/proprietary/Term.apk:system/app/Term.apk \
    vendor/TeamICS/proprietary/lib/armeabi/libjackpal-androidterm3.so:system/lib/libjackpal-androidterm3.so \
    vendor/TeamICS/prebuilt/common/bootanimation.zip:system/media/bootanimation.zip
  	

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Required CM packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    SpareParts \
    Superuser \
    Superuser.apk \
    su

# Optional CM packages
PRODUCT_PACKAGES += \
    VideoEditor \
    VoiceDialer \
    Basic \
    LiveWallpapers \
    LiveWallpapersPicker

# Custom CM packages
PRODUCT_PACKAGES += \
    DSPManager \
    libcyanogen-dsp \
    audio_effects.conf

PRODUCT_PACKAGE_OVERLAYS += vendor/TeamICS/overlay/dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/TeamICS/overlay/common

PRODUCT_VERSION_MAJOR = 4
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 3-RC0

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=ITL41D

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=TeamICS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(PRODUCT_RELEASE_NAME)-$(shell date +%0d%^b%Y-%H%M%S)


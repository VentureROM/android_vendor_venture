PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=LRX22G BUILD_ID=LRX22G BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

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
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Disable excessive dalvik debug messages
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.debug.alloc=0

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/venture/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/venture/prebuilt/common/bin/50-venture.sh:system/addon.d/50-venture.sh \
    vendor/venture/prebuilt/common/bin/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/venture/prebuilt/common/etc/backup.conf:system/etc/backup.conf

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh

# Init file
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/common/etc/init.local.rc:root/init.venture.rc

# Copy latinime for gesture typing
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# SELinux filesystem labels
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/common/etc/init.d/50selinuxrelabel:system/etc/init.d/50selinuxrelabel

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Don't export PS1 in /system/etc/mkshrc.
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/common/etc/mkshrc:system/etc/mkshrc \
    vendor/venture/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf

PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/venture/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/venture/prebuilt/common/bin/sysinit:system/bin/sysinit

# Packages
PRODUCT_PACKAGES += \
    Basic \
    BusyBox \
    CellBroadcastReceiver

# Optional packages
PRODUCT_PACKAGES += \
    LatinIME \
    BluetoothExt

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat

# easy way to extend to add more packages
-include vendor/extra/product.mk

PRODUCT_PACKAGE_OVERLAYS += vendor/venture/overlay/common

# Boot Animation
PRODUCT_COPY_FILES += \
    vendor/venture/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip

# SuperSU
PRODUCT_COPY_FILES += \
   vendor/venture/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
   vendor/venture/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# Versioning System
ANDROID_VERSION = 5.0.2
VENTURE_BUILD = ALPHA4

# Set all versions
VENTURE_VERSION := $(TARGET_PRODUCT)-$(VENTURE_BUILD)-$(shell date -u +%Y%m%d)
VENTURE_MOD_VERSION := $(VENTURE_BUILD)-$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.venture.version=$(VENTURE_VERSION) \
    ro.mod.version=$(VENTURE_MOD_VERSION) \

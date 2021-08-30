#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Installs gsi keys into ramdisk, to boot a GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/picasso/picasso-vendor.mk)

# Inherit properties
include $(LOCAL_PATH)/properties.mk
include $(LOCAL_PATH)/system.prop
include $(LOCAL_PATH)/product.prop

PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Overlays -- Override vendor ones
PRODUCT_PACKAGES += \
    FrameworksResCommon \
    FrameworksResTarget \
    DevicesOverlay \
    DevicesAndroidOverlay \
    CarrierConfigResCommon

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/xiaomi/picasso \
    hardware/xiaomi

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_BUILD_PRODUCT_IMAGE := true

# ANT+
PRODUCT_PACKAGES += \
    AntHalService-Soong \
    com.dsi.ant.antradio_library \
    com.dsi.ant@1.0

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    android.hardware.audio.service \
    vendor.qti.hardware.audiohalext@1.0 \
    vendor.qti.hardware.audiohalext-utils

PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_PACKAGES += \
    libqcomvoiceprocessingdescriptors

PRODUCT_PACKAGES += \
    tinymix \
    libaudio-resampler

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/audio_policy_engine_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    com.qualcomm.qti.bluetooth_audio@1.0 \
    vendor.qti.hardware.bluetooth_audio@2.0 \
    vendor.qti.hardware.btconfigstore@1.0 \
    vendor.qti.hardware.btconfigstore@2.0

PRODUCT_PACKAGES += \
    libbluetooth_qti \
    libbtconfigstore \
    bt_configstore.conf


# Camera
PRODUCT_PACKAGES += \
    vendor.qti.hardware.camera.device@1.0

# Configstore
PRODUCT_PACKAGES += \
    vendor.qti.hardware.capabilityconfigstore@1.0

# Component overrides
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/component-overrides_qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/component-overrides.xml

# Display/Graphics
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan \
    vendor.display.config@1.0 \
    vendor.display.config@1.2 \
    vendor.display.config@1.3 \
    vendor.display.config@1.5 \
    vendor.display.config@2.0 \
    vendor.qti.hardware.display.composer@3.0

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# GoogleCamera
PRODUCT_PACKAGES += \
    GoogleCamera

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/Gcam/privapp-permissions-googlecamera.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-googlecamera.xml

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    libhidltransport \
    libhwbinder

# Hardware
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.freeform_window_management.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml

# HotwordEnrollement
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml

# IFAA manager
PRODUCT_PACKAGES += \
    org.ifaa.android.manager

PRODUCT_BOOT_JARS += \
    org.ifaa.android.manager

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.smartcharging.rc

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-goodix.idc

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-goodix.kl
 
# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.xiaomi_picasso

# Modules
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/modules,$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/lib/modules)

#Miui sounds
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media/alarms,$(TARGET_COPY_OUT_SYSTEM)/media/audio/alarms) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media/ringtones,$(TARGET_COPY_OUT_SYSTEM)/media/audio/ringtones) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media/notifications,$(TARGET_COPY_OUT_SYSTEM)/media/audio/notifications) \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media/ui,$(TARGET_COPY_OUT_SYSTEM)/media/audio/ui)

PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Mi.ogg \
    ro.config.notification_sound=Ariel.ogg \
    ro.config.alarm_alert=Fireflies.ogg

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    NfcNci \
    Tag \
    SecureElement \
    vendor.nxp.hardware.nfc@1.2-service

# Overlay - notch style
#PRODUCT_PACKAGES += \
    NotchNoFillOverlay

# Parts
PRODUCT_PACKAGES += \
    XiaomiParts

# Perf
PRODUCT_PACKAGES += \
    vendor.qti.hardware.perf@2.0

# Ramdisk
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.recovery.qcom.rc

# Telephony
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/telephony_system-ext_privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/telephony_system-ext_privapp-permissions-qti.xml \
    $(LOCAL_PATH)/configs/com.android.carrierconfig.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.android.carrierconfig.xml

PRODUCT_PACKAGES += \
    RemovePackages

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.qti

# WiFi
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    TelecommResCommon \
    TelephonyResCommon \
    WifiResCommon

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

PRODUCT_BOOT_JARS += \
    WfdCommon

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-wfd.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-wfd.xml \
    $(LOCAL_PATH)/configs/hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/system/etc/sysconfig/hiddenapi-package-whitelist.xml \
    $(LOCAL_PATH)/configs/qti_whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/system/etc/sysconfig/qti_whitelist.xml \
    $(LOCAL_PATH)/configs/qti_whitelist_system_ext.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/system_ext/etc/sysconfig/qti_whitelist_system_ext.xml






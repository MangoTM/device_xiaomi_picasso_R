#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from lmi device
$(call inherit-product, device/xiaomi/picasso/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/palladium/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := palladium_picasso
PRODUCT_DEVICE := picasso
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi K30 5G
PRODUCT_MANUFACTURER := Xiaomi
WITH_GAPPS := true
TARGET_BOOT_ANIMATION_RES := 1080

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

#Gapps
WITH_GAPPS := true
PALLADIUM_BUILD_VARIANT := GAPPS
TARGET_GAPPS_ARCH := arm64
TARGET_SUPPORTS_GOOGLE_RECORDER := false
TARGET_INCLUDE_STOCK_ARCORE := true

#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

TARGET_SUPPORTS_OMX_SERVICE := false

# Inherit some common BlKi stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# BLKI
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_EXCLUDES_AUDIOFX := true
BLACKIRON_BUILDTYPE := Official
BLACKIRON_MAINTAINER := JYR_RC
WITH_GMS := true
#WITH_GMS_VARIANT := pico

# Reduce overdraw debugging to improve performance
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.show_overdraw=false

# Enable Vulkan for games and OpenGL Skia for the UI
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.force_vulkan=1 \
    debug.hwui.renderer=skiagl

# Ensures smoother rendering by turning off unnecessary GPU debugging
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.show_overdraw=false

# Reduces input lag and smoothens animations
PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.use_triple_buffering=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3

# Disable scrolling cache for smoother scrolling
persist.sys.scrollingcache=3

# Keep the launcher in memory to reduce reload times
ro.HOME_APP_ADJ=1

# Inherit from garnet device
$(call inherit-product, device/xiaomi/garnet/device.mk)

PRODUCT_NAME := lineage_garnet
PRODUCT_DEVICE := garnet
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 2312DRA50G

PRODUCT_SYSTEM_NAME := garnet_global
PRODUCT_SYSTEM_DEVICE := garnet

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="garnet_global-user 15 AQ3A.240912.001 OS2.0.6.0.VNREUXM release-keys" \
    BuildFingerprint=Redmi/garnet_global/garnet:15/AQ3A.240912.001/OS2.0.6.0.VNREUXM:user/release-keys \
    DeviceName=garnet \
    DeviceProduct=garnet_global

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

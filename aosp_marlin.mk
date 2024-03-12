#
# Copyright 2015 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Inherit some common PixelExperience stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

PRODUCT_NAME := aosp_marlin
PRODUCT_DEVICE := marlin
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel XL
TARGET_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false


-include device/google/marlin/device-aosp.mk

## Device identifier. This must come after all inclusions


PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    PRIVATE_BUILD_DESC="marlin-user 10 QP1A.191005.007.A3 5972272 release-keys"

BUILD_FINGERPRINT := google/marlin/marlin:10/QP1A.191005.007.A3/5972272:user/release-keys

$(call inherit-product, vendor/google/marlin/marlin-vendor.mk)

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

PRODUCT_COPY_FILES += device/google/marlin/fstab.common:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.marlin

$(call inherit-product, device/google/marlin/device-marlin.mk)
$(call inherit-product-if-exists, vendor/google_devices/marlin/device-vendor-marlin.mk)

PRODUCT_PACKAGES += \
    Launcher3QuickStep \
    WallpaperPicker


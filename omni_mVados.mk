#
# Copyright 2017 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := EP mVados

# Inherit from those products. Most specific first.
#$(call inherit-product-if-exists, $(SRC_TARGET_DIR)/product/embedded.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/go_defaults.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from hardware-specific part of the product configuration
#$(call inherit-product, device/BQ/BQ5519G/device.mk)

# Inherit some common Omni stuff.
#$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, vendor/pb/config/common.mk)
#$(call inherit-product, vendor/omni/config/gsm.mk)

$(call inherit-product, device/sprd/mVados/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mVados
PRODUCT_NAME := omni_mVados
PRODUCT_BRAND := SPRD
PRODUCT_MODEL := sl8541e_cus_gofu
PRODUCT_MANUFACTURER := sprd

PRODUCT_GMS_CLIENTID_BASE := android-sprd

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=sl8541e_cus_go \
    PRODUCT_NAME=sl8541e_cus_gofu_osea \
    PRIVATE_BUILD_DESC="sp9832e_1h10_native-user 8.1.0 OPM2.171019.012 52215 release-keys"

BUILD_FINGERPRINT := SPRD/sp9832e_1h10_native/sp9832e_1h10:8.1.0/OPM2.171019.012/52215:user/release-keys
PLATFORM_SECURITY_PATCH := 2025-12-31

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.vendor.build.security_patch=2025-12-31

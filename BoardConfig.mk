#
# Copyright 2019 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

DEVICE_PATH := device/sprd/mVados

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
export LC_ALL=C
BUILD_BROKEN_DUP_RULES := true
#BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
#TARGET_ARCH := arm64
#TARGET_ARCH_VARIANT := armv8-a
#TARGET_CPU_ABI := arm64-v8a
#TARGET_CPU_ABI2 :=
#TARGET_CPU_VARIANT := generic

#TARGET_2ND_ARCH := arm
#TARGET_2ND_ARCH_VARIANT := armv7-a-neon
#TARGET_2ND_CPU_ABI := armeabi-v7a
#TARGET_2ND_CPU_ABI2 := armeabi
#TARGET_2ND_CPU_VARIANT := cortex-a53
#TARGET_2ND_CPU_VARIANT_RUNTIME := generic

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/recovery/root/vendor/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/recovery/root/vendor/compatibility_matrix.xml

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53
#TARGET_CPU_VARIANT := armv8-a

TARGET_CPU_SMP := true
#ARCH_ARM_HAVE_TLS_REGISTER := true

# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Platform
TARGET_BOARD_PLATFORM := sc9832e
TARGET_BOARD_PLATFORM_GPU := mali-midgard

# FOCKING BINDER
TARGET_USES_64_BIT_BINDER := true
#TARGET_SUPPORTS_32_BIT_APPS := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := sl8541e_cus_32b

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 36700160
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 36700160
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28462529536
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_PERSISTIMAGE_PARTITION_SIZE := 2097152
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 314572800

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# MTP
TW_HAS_MTP := true
TW_MTP_DEVICE := /dev/mtp_usb

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_USES_SPRD_HARDWARE := true

# Android Verified Boot
BOARD_AVB_ENABLE := true
#BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_KEY_PATH := $(BOARD_AVB_KEY_PATH)
BOARD_AVB_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_AVB_ROLLBACK_INDEX := 1 #$(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(BOARD_AVB_ROLLBACK_INDEX)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 2

# Kernel armv7l
#TARGET_KERNEL_ARCH := armv7l
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 loglevel=1 init=/init root=/dev/ram0 vmalloc=360M
BOARD_KERNEL_CMDLINE += lcd_id=ID770703 lcd_base=99aee000 lcd_size=1280x320
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.configfs=true
BOARD_KERNEL_CMDLINE += androidboot.hardware=sl8541e_cus_go
BOARD_KERNEL_CMDLINE += loop.max_part=7

BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05400000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := kernel

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DT := $(DEVICE_PATH)/prebuilt/dt.img
BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DT)
#BOARD_HEADER_VERSION := 1
#BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_HEADER_VERSION)
#BOARD_KERNEL_SEPARATED_DT := 
#TARGET_KERNEL_CONFIG := sl8541e_cus_go_defconfig
#TARGET_KERNEL_SOURCE := kernel/sprd/sl8541e_cus_go
# Kernel Depesh
#BOARD_INCLUDE_RECOVERY_DTBO := true
#BOARD_PREBUILT_DTBOIMAGE := $(PLATFORM_PATH)/prebuilt/dtbo.img
#BOARD_HEADER_VERSION := 1
#BOARD_MKBOOTIMG_ARGS += --ramdisk_offset 0x05400000 --header_version $(BOARD_HEADER_VERSION)

# Recovery
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true
RECOVERY_SDCARD_ON_DATA := true
# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true								  
#TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/etc/recovery.fstab
#TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
#TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/root/etc/init.rc
# system.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop
#RECOVERY_VARIANT := twrp
#BOARD_ROOT_EXTRA_FOLDERS += metadata my_preload
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_NO_RECOVERY := true

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
#creates the metadata directory
BOARD_USES_METADATA_PARTITION := true
#TW_USE_FSCRYPT_POLICY := 2
# Test sdcard decrypt
TW_PREPARE_DATA_MEDIA_EARLY := true

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster3 \
    sprdstorageproxyd \
    libpuresoftkeymasterdevice
#    ashmemd_aidl_interface-cpp \
#    libashmemd_client

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster3.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so 
#    $(TARGET_OUT_SHARED_LIBRARIES)/ashmemd_aidl_interface-cpp.so \
#    $(TARGET_OUT_SHARED_LIBRARIES)/libashmemd_client.so

# Display
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
# Old option:
#DEVICE_RESOLUTION := 1280x320
TW_IGNORE_MAJOR_AXIS_0 := true
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_SCREEN_DENSITY := 128
# Touchscreen based on landscape screen but TWRP displays portraitly
# This option makes touchscreen portrait 
RECOVERY_TOUCHSCREEN_SWAP_XY:= true
# This option flips the value of touch x-axis
RECOVERY_TOUCHSCREEN_FLIP_X:= true

# Resolution
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2000
# TWRP Configuration
# TWRP specific build flags by Depesh
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.gs6/lun.%d/file
TW_BRIGHTNESS_PATH := "/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/devices/platform/sprd_backlight/backlight/sprd_backlight/brightness\"
#TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone0/temp
TW_MAX_BRIGHTNESS := 125
TW_DEFAULT_BRIGHTNESS := 95
#TW_THEME := portrait_hdpi
TW_DEFAULT_LANGUAGE := ru
TW_SCREEN_BLANK_ON_BOOT := false
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_LEGACY_PROPS := true
TW_USE_TOOLBOX := true
HAVE_SELINUX := true
# system won't be unmounted,
TW_NEVER_UNMOUNT_SYSTEM := true
TW_NO_SCREEN_BLANK := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
#TW_INCLUDE_FASTBOOTD := true
#TW_FORCE_USE_BUSYBOX := true
TW_CUSTOM_POWER_BUTTON := 116
#TW_FORCE_CPUINFO_FOR_DEVICE_ID := true
#TW_OVERRIDE_SYSTEM_PROPS := "ro.build.fingerprint"
# See here : https://github.com/omnirom/android_b...ndroid.mk#L435
#TARGET_RECOVERY_DEVICE_MODULES := tzdata
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/system/usr/share/zoneinfo/tzdata 
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/vendor/bin/hw/android.hardware.gatekeeper@1.0-service
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/vendor/bin/hw/android.hardware.keymaster@3.0-service
#TW_RECOVERY_ADDITIONAL_RELINK_FILES += $(TARGET_OUT)/vendor/bin/vndservicemanager
#TW_NO_HAPTICS := true
TW_LOAD_VENDOR_FIRMWARE := "sf_trusty.elf"
# Libresetprop & resetprop
#TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

# Storage
TW_NO_USB_STORAGE := false
TW_DEFAULT_EXTERNAL_STORAGE := true
#TW_EXTERNAL_STORAGE_PATH := "/sdcard"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_INTERNAL_STORAGE_PATH := "/data"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "dm-0"
# Fuse
#TW_INCLUDE_NTFS_3G    := true
# exFAT FS Support
#TW_INCLUDE_FUSE_EXFAT := true
# NTFS Support
#TW_INCLUDE_FUSE_NTFS := true    

# Exludes
# don't include default init.recovery.usb.rc, provide your own or use needed defines inside init.recovery.$DEVICE.rc
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

# Show build time on the splash screen
TW_DEVICE_VERSION=$(shell date '+%Y%m%d') by vados-dev
# Hack: prevent anti rollback
PLATFORM_VERSION := 16.1.0
#PLATFORM_SECURITY_PATCH := 2099-12-31
#VENDOR_SECURITY_PATCH := 2099-12-31
### orig
#PLATFORM_SECURITY_PATCH := 2018-09-05                
# Encryption Depesh
PLATFORM_SECURITY_PATCH := 2025-12-31
#VENDOR_SECURITY_PATCH := 2025-12-31
#TW_INCLUDE_CRYPTO := true

# ORIG
#VENDOR_SECURITY_PATCH := 2018-09-05
# TWRPDGEN
#VENDOR_SECURITY_PATCH := 2021-08-01

#PIE
PLATFORM_SDK_VERSION := 28
#

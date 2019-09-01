#
# Copyright 2016 The Android Open Source Project
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

# OTA Assert
TARGET_OTA_ASSERT_DEVICE := gts210vewifi

# Bootloader
TARGET_NO_BOOTLOADER 			    := true
TARGET_BOOTLOADER_BOARD_NAME 	:= msm8952

# Platform
TARGET_BOARD_PLATFORM 		:= msm8952
TARGET_BOARD_PLATFORM_GPU := qcom-adreno510

# Architecture
TARGET_ARCH 			  := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI 			:= arm64-v8a
TARGET_CPU_ABI2 		:=
TARGET_CPU_VARIANT 	:= cortex-a53

TARGET_2ND_ARCH 		    := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI 		  := armeabi-v7a
TARGET_2ND_CPU_ABI2 	  := armeabi
TARGET_2ND_CPU_VARIANT 	:= cortex-a53.a57

TARGET_USES_64_BIT_BINDER := true

#### Kernel
BOARD_KERNEL_CMDLINE      := \
  console=null \
  androidboot.hardware=qcom \
  androidboot.wificountrycode=00 \
  msm_rtb.filter=0x237 \
  ehci-hcd.park=3 \
  androidboot.bootdevice=7824900.sdhci \
  lpm_levels.sleep_disabled=1 \
  earlyprintk
BOARD_KERNEL_CMDLINE      += androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE     := 2048
BOARD_KERNEL_BASE 			  := 0x80000000
BOARD_RAMDISK_OFFSET      := 0x02000000
BOARD_KERNEL_TAGS_OFFSET  := 0x01E00000

#### Kernel prebuilt
# TARGET_PREBUILT_KERNEL 	:= device/samsung/gts210vewifi/prebuilt/kernel
# BOARD_CUSTOM_BOOTIMG_MK 	:= device/samsung/gts210vewifi/prebuilt/mkbootimg.mk
# BOARD_MKBOOTIMG_ARGS 		:= \
#    --base 0x80000000 \
#    --ramdisk_offset 0x02000000 \
#    --tags_offset 0x01E00000 \
#    --board FPRPG21W000KU \
#    --dt device/samsung/gts210vewifi/prebuilt/dt.img

#### Kernel build from source
BOARD_KERNEL_IMAGE_NAME 	:= Image.gz
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS 		  := \
  --base $(BOARD_KERNEL_BASE) \
  --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
  --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
  --board FPRPG21W000KU
BOARD_CUSTOM_BOOTIMG 		  := true
BOARD_CUSTOM_BOOTIMG_MK 	:= device/samsung/gts210vewifi/mkbootimg.mk
TARGET_KERNEL_SOURCE 		  := kernel/samsung/msm8976
TARGET_KERNEL_CONFIG 		  := gts210vewifi_defconfig

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE 		  := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE 	  := 209715200
BOARD_PERSISTIMAGE_PARTITION_SIZE 	:= 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE 	:= 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 4404019200
BOARD_USERDATAIMAGE_PARTITION_SIZE 	:= 26268905472
BOARD_FLASH_BLOCK_SIZE 				      := 131072

# Init
TARGET_PLATFORM_DEVICE_BASE := /dev/block/platform/soc.0/

# Full disk encryption
TARGET_CRYPTFS_HW_PATH 		:= vendor/qcom/opensource/commonsys/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO 			  := true
PLATFORM_SECURITY_PATCH 	:= 2025-12-31

# Recovery
RECOVERY_VARIANT 				      := twrp
TARGET_USERIMAGES_USE_EXT4 		:= true
TARGET_USERIMAGES_USE_F2FS 		:= true
TARGET_RECOVERY_PIXEL_FORMAT  := RGBA_8888
 
# TWRP
TW_USE_TOOLBOX                  := true
TW_THEME                        := landscape_hdpi
RECOVERY_TOUCHSCREEN_SWAP_XY    := true
RECOVERY_TOUCHSCREEN_FLIP_Y     := true
TW_BRIGHTNESS_PATH              := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS               := 354
TW_DEFAULT_BRIGHTNESS           := 160
TW_INPUT_BLACKLIST              := "hbtp_vm"
TW_CUSTOM_CPU_TEMP_PATH         := /sys/devices/virtual/thermal/thermal_zone1/temp
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
TARGET_RECOVERY_QCOM_RTC_FIX    := true
RECOVERY_SDCARD_ON_DATA         := true
TW_DEFAULT_EXTERNAL_STORAGE     := true
TW_HAS_DOWNLOAD_MODE            := true
TW_NO_REBOOT_BOOTLOADER         := true
TW_EXTRA_LANGUAGES 				      := true
TW_EXCLUDE_TWRPAPP 				      := true
BOARD_SUPPRESS_SECURE_ERASE     := true
TW_INCLUDE_NTFS_3G 				      := true
TW_NEW_ION_HEAP                 := true

# Debug
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD 	  := true

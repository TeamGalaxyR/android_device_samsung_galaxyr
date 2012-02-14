# Copyright (C) 2007 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_BOARD_PLATFORM_GPU := tegra
TARGET_BOOTLOADER_BOARD_NAME := n1

# Make sure that AOSP/CM7 sees this kernel
TARGET_PREBUILT_KERNEL := device/samsung/galaxyr/kernel

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

BOARD_HAVE_BLUETOOTH := true

# OpenGL drivers config file path
BOARD_EGL_CFG := device/samsung/galaxyr/egl.cfg

# BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00480000
# BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00780000
# BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0cf80000
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0d020000
# BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_OTA_ASSERT_DEVICE := galaxyr,GT-I9103

# I HAS CORRECTED TEH VALUES, except the flash block size

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 102400
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 527433728
BOARD_USERDATAIMAGE_PARTITION_SIZE := 212860928

# Releasetools, should be okay now
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./build/tools/releasetools/ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./build/tools/releasetools/img_from_target_files

BOARD_HAS_SDCARD_INTERNAL := true

BOARD_VOLD_MAX_PARTITIONS := 12
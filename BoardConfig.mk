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

# If you are working on ICS uncomment this
TARGET_ARCH_VARIANT := armv7-a

TARGET_BOARD_PLATFORM_GPU := tegra
TARGET_BOOTLOADER_BOARD_NAME := n1

TARGET_NO_BOOTLOADER := true

BOARD_HAVE_BLUETOOTH := true

# OpenGL drivers config file path
BOARD_EGL_CFG := device/samsung/galaxyr/egl.cfg

# BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00480000
# BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00780000
# BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0cf80000
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0d020000
# BOARD_FLASH_BLOCK_SIZE := 131072

# I HAS CORRECTED TEH VALUES, except the flash block size

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 204800
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 527433728
BOARD_USERDATAIMAGE_PARTITION_SIZE := 212860928

BOARD_VOLD_MAX_PARTITIONS := 12
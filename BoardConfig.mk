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
#USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/I9103/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_ARCH_VARIANT_CPU := cortex-a9
# DO NOT change the following line to vfpv3 as it is not supported on our device!
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_HAVE_TEGRA_ERRATA_657451 := true
TARGET_BOARD_PLATFORM := tegra
TARGET_BOARD_PLATFORM_GPU := tegra # Useless for CM7 build
TARGET_BOOTLOADER_BOARD_NAME := n1
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device
# Boot image size is 16384 x 512 bytes = 8388608
# You can double check it with fdisk -l /dev/block/mmcblk0p8
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00800000
# Recovery image size is 10240 x 512 bytes = 5242880
# You can double check it with fdisk -l /dev/block/mmcblk0p8
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
# System image size is 1228800 x 512 bytes = 629145600
# You can double check it with fdisk -l /dev/block/mmcblk0p2
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x25800000
# User data image size is 4194304 x 512 bytes = 2147483648
# You can double check it with fdisk -l /dev/block/mmcblk0p6
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x80000000
BOARD_FLASH_BLOCK_SIZE := 2048

TARGET_PREBUILT_KERNEL := device/samsung/I9103/kernel

TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := false
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

BOARD_HAS_NO_SELECT_BUTTON := true
# Use this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
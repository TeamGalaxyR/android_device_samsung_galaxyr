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


# CPU
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a
TARGET_BOARD_PLATFORM := tegra
TARGET_BOARD_PLATFORM_GPU := tegra
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := n1
NEED_WORKAROUND_CORTEX_A9_745320 := true

BOARD_USES_LIBSECRIL_STUB := true

# Make sure that AOSP/CM7 sees this kernel
TARGET_PREBUILT_KERNEL := device/samsung/galaxyr/kernel

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

BOARD_HAVE_BLUETOOTH := true

# OpenGL drivers config file path
BOARD_EGL_CFG := device/samsung/galaxyr/egl.cfg

# Mobile data
BOARD_MOBILEDATA_INTERFACE_NAME = "smd0"

# FM Radio
#BOARD_HAVE_FM_RADIO := true
#BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
BOARD_FM_DEVICE := si4709

# BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x00480000
# BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00780000
# BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x0cf80000
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0d020000
# BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_OTA_ASSERT_DEVICE := galaxyr,GT-I9103

BOARD_BOOTIMAGE_PARTITION_SIZE     := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 629145600
BOARD_USERDATA_PARTITION_SIZE      := 2147483648
BOARD_FLASH_BLOCK_SIZE := 2048

# I am unsure about this option?
#BOARD_HAS_LARGE_FILESYSTEM := true

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_VENDOR_USE_AKMD := akm8973

#BOARD_HAS_VIBRATOR_IMPLEMENTATION := device/samsung/galaxyr/vibrator/tspdrv.c

#TARGET_USES_OLD_LIBSENSORS_HAL := true

# Wifi related defines
WPA_BUILD_SUPPLICANT        := true
WPA_SUPPLICANT_VERSION      := VER_0_6_X
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_WLAN_DEVICE           := bcm4330
WIFI_DRIVER_MODULE_PATH     := "/lib/modules/dhd.ko"
WIFI_DRIVER_FW_STA_PATH     := "/system/etc/wifi/bcm4330_sta.bin"
WIFI_DRIVER_FW_AP_PATH      := "/system/etc/wifi/bcm4330_aps.bin"
WIFI_DRIVER_FW_MFG_PATH      := "/system/etc/wifi/bcm4330_mfg.bin"
#WIFI_FIRMWARE_LOADER        := "wlandutservice"
WIFI_DRIVER_MODULE_NAME     :=  "dhd"
WIFI_DRIVER_MODULE_ARG      :=  "firmware_path=/system/etc/wifi/bcm4330_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"

# Releasetools, should be okay now
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./build/tools/releasetools/ota_from_target_files
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./build/tools/releasetools/img_from_target_files

BOARD_HAS_SDCARD_INTERNAL := true

BOARD_VOLD_MAX_PARTITIONS := 12
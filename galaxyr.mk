#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).

## Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

#DEVICE_PACKAGE_OVERLAYS := device/samsung/cooper/overlay

# proprietary side of the device
#$(call inherit-product-if-exists, vendor/samsung/galaxyr/device-vendor.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := galaxyr
PRODUCT_DEVICE := galaxyr
PRODUCT_MODEL := GT-I9103

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/galaxyr/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    libOmxCore \
    libOmxVidEnc \
    FM \
    Torch \
    #make_ext4fs \
    brcm_patchram_plus \
    sec_touchscreen.kcm \
    copybit.tegra \
    lights.tegra \
    gralloc.tegra \
    #setup_fs \
    dexpreopt

# Set true if you want .odex files
DISABLE_DEXPREOPT := false    

include $(CLEAR_VARS)

# INIT-scripts
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/init.rc:root/init.rc \
    device/samsung/galaxyr/ueventd.rc:root/ueventd.rc \
    device/samsung/galaxyr/init.n1.rc:root/init.n1.rc \
    device/samsung/galaxyr/ueventd.n1.rc:root/ueventd.n1.rc

include $(CLEAR_VARS)

# Audio and Camera
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/libcamera.so:obj/lib/libcamera.so \
    device/samsung/galaxyr/proprietary/libcamera.so:system/lib/libcamera.so \
    device/samsung/galaxyr/proprietary/libaudio.so:obj/lib/libaudio.so \
    device/samsung/galaxyr/proprietary/libaudio.so:system/lib/libaudio.so \
    device/samsung/galaxyr/proprietary/libaudiopolicy.so:obj/lib/libaudiopolicy.so \
    device/samsung/galaxyr/proprietary/libaudiopolicy.so:system/lib/libaudiopolicy.so

#include $(CLEAR_VARS)

# RIL-stuff
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/libril.so:system/lib/libril.so \
    device/samsung/galaxyr/proprietary/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/galaxyr/proprietary/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/galaxyr/proprietary/apns-conf.xml:system/etc/apns-conf.xml \
    device/samsung/galaxyr/proprietary/rild:system/bin/rild

include $(CLEAR_VARS)

# Prebuilt modules
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/prebuilt/dhd.ko:root/lib/modules/dhd.ko \
    device/samsung/galaxyr/prebuilt/bthid.ko:root/lib/modules/bthid.ko \
    device/samsung/galaxyr/prebuilt/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
    device/samsung/galaxyr/prebuilt/Si4709_driver.ko:root/lib/modules/Si4709_driver.ko

#include $(CLEAR_VARS)

# WIFI-stuff
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/galaxyr/proprietary/wpa_supplicant:system/bin/wpa_supplicant \
    device/samsung/galaxyr/proprietary/wifi.conf:system/etc/wifi/wifi.conf \
    device/samsung/galaxyr/proprietary/wlandutservice:system/bin/wlandutservice \
    device/samsung/galaxyr/proprietary/macloader:system/bin/macloader \
    device/samsung/galaxyr/proprietary/mfgloader:system/bin/mfgloader \
    device/samsung/galaxyr/proprietary/wl:system/etc/wifi/wl \
    device/samsung/galaxyr/proprietary/iwmulticall:system/etc/wifi/iwmulticall \
    device/samsung/galaxyr/proprietary/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    device/samsung/galaxyr/proprietary/nvram_mfg.txt_b0:system/etc/wifi/nvram_mfg.txt_b0 \
    device/samsung/galaxyr/proprietary/nvram_mfg.txt_murata:system/etc/wifi/nvram_mfg.txt_murata \
    device/samsung/galaxyr/proprietary/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    device/samsung/galaxyr/proprietary/nvram_net.txt_b0:system/etc/wifi/nvram_net.txt_b0 \
    device/samsung/galaxyr/proprietary/nvram_net.txt_murata:system/etc/wifi/nvram_net.txt_murata
    
#include $(CLEAR_VARS)

PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/vold:system/bin/vold \
    device/samsung/galaxyr/proprietary/vold.fstab:system/etc/vold.fstab \
    device/samsung/galaxyr/proprietary/libext2fs.so:system/lib/liext2fs.so \
    device/samsung/galaxyr/proprietary/libext2_blkid.so:system/lib/liext2_blkid.so \
    device/samsung/galaxyr/proprietary/libext2_com_err.so:system/lib/liext2_com_err.so \
    device/samsung/galaxyr/proprietary/libext2_e2p.so:system/lib/liext2_e2p.so \
    device/samsung/galaxyr/proprietary/libext2_uuid.so:system/lib/liext2_uuid.so

#include $(CLEAR_VARS)

# All the blobs necessary for galaxyr
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/galaxyr/proprietary/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    device/samsung/galaxyr/proprietary/vold.fstab:system/etc/vold.fstab \
    device/samsung/galaxyr/proprietary/vold:system/bin/vold \
    #device/samsung/galaxyr/proprietary/AudioFilter.csv:system/etc/AudioFilter.csv \
    #device/samsung/galaxyr/proprietary/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    #device/samsung/galaxyr/proprietary/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    #device/samsung/galaxyr/proprietary/hostapd:system/bin/hostapd \
    #device/samsung/galaxyr/proprietary/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/galaxyr/proprietary/media_profiles.xml:system/etc/media_profiles.xml

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

#Kernel Modules
#PRODUCT_COPY_FILES += \
    #device/samsung/galaxyr/prebuilt/modules/fsr.ko:root/lib/modules/fsr.ko \
    #device/samsung/galaxyr/prebuilt/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    #device/samsung/galaxyr/prebuilt/modules/sec_param.ko:root/lib/modules/sec_param.ko \
    #device/samsung/galaxyr/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    #device/samsung/galaxyr/prebuilt/cifs.ko:system/lib/modules/2.6.32.9-perf/cifs.ko \
    #device/samsung/galaxyr/prebuilt/zram.ko:system/lib/modules/2.6.32.9-perf/zram.ko
    
#Kernel Modules for Recovery (RFS)
#PRODUCT_COPY_FILES += \
    #device/samsung/galaxyr/prebuilt/modules/recovery/fsr.ko:recovery/root/lib/modules/fsr.ko \
    #device/samsung/galaxyr/prebuilt/modules/recovery/fsr_stl.ko:recovery/root/lib/modules/fsr_stl.ko \
    #device/samsung/galaxyr/prebuilt/modules/recovery/rfs_fat.ko:recovery/root/lib/modules/rfs_fat.ko \
    #device/samsung/galaxyr/prebuilt/modules/recovery/rfs_glue.ko:recovery/root/lib/modules/rfs_glue.ko \
    #device/samsung/galaxyr/prebuilt/modules/recovery/sec_param.ko:recovery/root/lib/modules/sec_param.ko

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.enable.3g.prefix=1 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.dtm=1 \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hep=1 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.hsxpa=2 \
    rild.libpath=/system/lib/libsec-ril.so \
    rild.libargs="-d /dev/ttys0"

PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.telephony.ril_class=samsung \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=30 \
    ro.com.android.dataroaming=false \
    ro.board.platform=tegra

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=64m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0 \
    media.stagefright.enable-player=false \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-rtsp=false \
    ro.tether.denied=false \
    ro.flash.resolution=1080

PRODUCT_LOCALES += hdpi

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available

#$(call inherit-product-if-exists, vendor/samsung/galaxyr/device-vendor-blobs.mk)

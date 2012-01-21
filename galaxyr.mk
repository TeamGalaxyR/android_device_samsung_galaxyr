#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

#DEVICE_PACKAGE_OVERLAYS := device/samsung/cooper/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := galaxyr
PRODUCT_DEVICE := galaxyr
PRODUCT_MODEL := GT-I9103

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

# proprietary side of the device
$(call inherit-product-if-exists, vendor/samsung/galaxyr/galaxyr-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/galaxyr/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl

# fstab
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/init.n1.rc:root/init.n1.rc \
    device/samsung/galaxyr/ueventd.n1.rc:root/ueventd.n1.rc

# Audio
#PRODUCT_COPY_FILES += \
    #device/samsung/galaxyr/AudioFilter.csv:system/etc/AudioFilter.csv \
    #device/samsung/galaxyr/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
	device/samsung/galaxyr/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    #device/samsung/cooper/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    #device/samsung/cooper/prebuilt/hostapd:system/bin/hostapd \
    #device/samsung/cooper/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf
    


# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
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
PRODUCT_COPY_FILES += \
    #device/samsung/galaxyr/prebuilt/modules/recovery/fsr.ko:recovery/root/lib/modules/fsr.ko \
    #device/samsung/galaxyr/prebuilt/modules/recovery/fsr_stl.ko:recovery/root/lib/modules/fsr_stl.ko \
    #device/samsung/galaxyr/prebuilt/modules/recovery/rfs_fat.ko:recovery/root/lib/modules/rfs_fat.ko \
    #device/samsung/galaxyr/prebuilt/modules/recovery/rfs_glue.ko:recovery/root/lib/modules/rfs_glue.ko \
    #device/samsung/galaxyr/prebuilt/modules/recovery/sec_param.ko:recovery/root/lib/modules/sec_param.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/firmware/bcm4330_aps.bin:system/wifi/bcm4330_aps.bin \
    device/samsung/galaxyr/firmware/bcm4330_mfg.bin:system/wifi/bcm4330_mfg.bin \
    device/samsung/galaxyr/firmware/bcm4330_sta.bin:system/wifi/bcm4330_sta.bin \
    device/samsung/galaxyr/firmware/bcm4330_mfg.bin_b0:system/wifi/bcm4330_mfg.bin_b0 \
    device/samsung/galaxyr/firmware/bcm4330_sta.bin_b0:system/wifi/bcm4330_sta.bin_b0 \
    #device/samsung/galaxyr/firmware/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77
    
#GPU firmware
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/firmware/nvddk_audiofx_core.axf:system/etc/firmware/nvddk_audiofx_core.axf \
    device/samsung/galaxyr/firmware/nvddk_audiofx_transport.axf:system/etc/firmware/nvddk_audiofx_transport.axf \
    device/samsung/galaxyr/firmware/nvmm_aacdec.axf:system/etc/firmware/nvmm_aacdec.axf \
    device/samsung/galaxyr/firmware/nvmm_adtsdec.axf:system/etc/firmware/nvmm_adtsdec.axf \
    device/samsung/galaxyr/firmware/nvmm_audiomixer.axf:system/etc/firmware/nvmm_audiomixer.axf \
    device/samsung/galaxyr/firmware/nvmm_h264dec.axf:system/etc/firmware/nvmm_h264dec.axf \
    device/samsung/galaxyr/firmware/nvmm_jpegdec.axf:system/etc/firmware/nvmm_jpegdec.axf \
    device/samsung/galaxyr/firmware/nvmm_jpegenc.axf:system/etc/firmware/nvmm_jpegenc.axf \
    device/samsung/galaxyr/firmware/nvmm_manager.axf:system/etc/firmware/nvmm_manager.axf \
    device/samsung/galaxyr/firmware/nvmm_mp2dec.axf:system/etc/firmware/nvmm_mp2dec.axf \
    device/samsung/galaxyr/firmware/nvmm_mp3dec.axf:system/etc/firmware/nvmm_mp3dec.axf \
    device/samsung/galaxyr/firmware/nvmm_mpeg4dec.axf:system/etc/firmware/nvmm_mpeg4dec.axf
    device/samsung/galaxyr/firmware/nvmm_reference.axf:system/etc/firmware/nvmm_reference.axf \
    device/samsung/galaxyr/firmware/nvmm_service.axf:system/etc/firmware/nvmm_service.axf \
    device/samsung/galaxyr/firmware/nvmm_sorensondec.axf:system/etc/firmware/nvmm_sorensondec.axf \
    device/samsung/galaxyr/firmware/nvmm_vc1dec.axf:system/etc/firmware/nvmm_vc1dec.axf \
    device/samsung/galaxyr/firmware/nvmm_wavdec.axf:system/etc/firmware/nvmm_wavdec.axf \
    device/samsung/galaxyr/firmware/nvmm_wmadec.axf:system/etc/firmware/nvmm_wmadec.axf \
    device/samsung/galaxyr/firmware/nvmm_wmaprodec.axf:system/etc/firmware/nvmm_wmaprodec.axf \
    device/samsung/galaxyr/firmware/nvrm_avp.bin:system/etc/firmware/nvrm_avp.bin \

#Media profile
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=3 \
    ro.ril.gprsclass=10 \
    #ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0 \
    ro.telephony.ril_class=samsung \
    wifi.interface=wlan0 \
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
    ro.compcache.default=0
    media.stagefright.enable-player=false \
    media.stagefright.enable-meta=false \
    media.stagefright.enable-scan=false \
    media.stagefright.enable-http=true \
    media.stagefright.enable-rtsp=false \
    ro.tether.denied=false \
    ro.flash.resolution=1080
# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/cooper/cooper-vendor-blobs.mk)
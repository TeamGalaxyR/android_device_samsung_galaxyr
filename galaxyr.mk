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
    Gallery3d \
    SpareParts \
    Development \
    Term \
    libOmxCore \
    libOmxVidEnc \
    sec_touchscreen.kcm \
    dexpreopt

include $(CLEAR_VARS)

PRODUCT_PACKAGES += \
    sensors.n1 \
    sensors.tegra \
    lights.tegra \
    gps.n1 \
    gralloc.tegra \
    overlay.tegra

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

# Camera
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/libcamera.so:obj/lib/libcamera.so \
    device/samsung/galaxyr/proprietary/libcamera.so:system/lib/libcamera.so

include $(CLEAR_VARS)

# RIL-stuff
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/galaxyr/proprietary/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/galaxyr/proprietary/rild:system/bin/rild

include $(CLEAR_VARS)

# Prebuilt modules
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/prebuilt/dhd.ko:root/lib/modules/dhd.ko \
    device/samsung/galaxyr/prebuilt/bthid.ko:root/lib/modules/bthid.ko \
    device/samsung/galaxyr/prebuilt/scsi_wait_scan.ko:root/lib/modules/scsi_wait_scan.ko \
    device/samsung/galaxyr/prebuilt/Si4709_driver.ko:root/lib/modules/Si4709_driver.ko

include $(CLEAR_VARS)

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

include $(CLEAR_VARS)

# GPS-stuff
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/sirfgps.conf:system/etc/sirfgps.conf \
    device/samsung/galaxyr/proprietary/gps.conf:system/etc/gps.conf

include $(CLEAR_VARS)

# Sensors
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/libakm.so:system/lib/libakm.so   
#    device/samsung/galaxyr/proprietary/libmpl.so:system/lib/libmpl.so \
#    device/samsung/galaxyr/proprietary/libmllite.so:system/lib/libmllite.so \
#    device/samsung/galaxyr/proprietary/libmlplatform.so:system/lib/libmlplatform.so   

include $(CLEAR_VARS)

# VOLD
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/vold:system/bin/vold \
    device/samsung/galaxyr/proprietary/vold.fstab:system/etc/vold.fstab \
    device/samsung/galaxyr/proprietary/libext2fs.so:system/lib/libext2fs.so \
    device/samsung/galaxyr/proprietary/libext2_blkid.so:system/lib/libext2_blkid.so \
    device/samsung/galaxyr/proprietary/libext2_com_err.so:system/lib/libext2_com_err.so \
    device/samsung/galaxyr/proprietary/libext2_e2p.so:system/lib/libext2_e2p.so \
    device/samsung/galaxyr/proprietary/libext2_uuid.so:system/lib/libext2_uuid.so

include $(CLEAR_VARS)

PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/immvibed_n1:system/bin/immvibed_n1 \
    device/samsung/galaxyr/proprietary/drexe:system/bin/drexe \
    device/samsung/galaxyr/proprietary/npsmobex:system/bin/npsmobex \
    device/samsung/galaxyr/proprietary/libsisodrm.so:system/lib/libsisodrm.so

include $(CLEAR_VARS)

# Keychars
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/proprietary/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/galaxyr/proprietary/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    device/samsung/galaxyr/proprietary/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/galaxyr/proprietary/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/samsung/galaxyr/proprietary/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/samsung/galaxyr/proprietary/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \
    device/samsung/galaxyr/proprietary/sec_touchscreen.kcm:system/usr/keychars/sec_touchscreen.kcm \
    device/samsung/galaxyr/proprietary/sec_touchscreen.kcm.bin:system/usr/keychars/sec_touchscreen.kcm.bin \
    device/samsung/galaxyr/proprietary/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
    device/samsung/galaxyr/proprietary/sec_jack.kl:system/usr/keychars/sec_jack.kl

include $(CLEAR_VARS)

# All the blobs necessary for galaxyr
PRODUCT_COPY_FILES += \
    device/samsung/galaxyr/prebuilt/su:system/xbin/su \
    device/samsung/galaxyr/prebuilt/su:system/bin/su \
    device/samsung/galaxyr/prebuilt/LatinIME.apk:system/app/LatinIME.apk \
    device/samsung/galaxyr/prebuilt/Superuser.apk:system/app/Superuser.apk \
    device/samsung/galaxyr/apns-conf.xml:system/etc/apns-conf.xml \
    device/samsung/galaxyr/proprietary/media_profiles.xml:system/etc/media_profiles.xml

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
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

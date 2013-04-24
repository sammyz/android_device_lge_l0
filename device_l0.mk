#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Kernel Modules
ifeq ($(TARGET_PREBUILT_KERNEL),)
PRODUCT_COPY_FILES += $(shell \
    find $(LOCAL_PATH)prebuilt -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')
endif

LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# NFC
# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt)

# NFC EXTRAS add-on API
PRODUCT_PACKAGES += \
    com.android.nfc_extras
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFCEE access control
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/nfcee_access.xml:system/etc/nfcee_access.xml

PRODUCT_PACKAGES += \
    nfc.msm8960 \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

# OMX
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libstagefrighthw

# hostapd
PRODUCT_PACKAGES += \
    hostapd

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# MSM8960 firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/firmware/a225p5_pm4.fw:/system/etc/firmware/a225p5_pm4.fw \
    $(LOCAL_PATH)/prebuilt/etc/firmware/a225_pfp.fw:/system/etc/firmware/a225_pfp.fw \
    $(LOCAL_PATH)/prebuilt/etc/firmware/a225_pm4.fw:/system/etc/firmware/a225_pm4.fw \
    $(LOCAL_PATH)/prebuilt/etc/firmware/cyttsp_8960_cdp.hex:/system/etc/firmware/cyttsp_8960_cdp.hex \
    $(LOCAL_PATH)/prebuilt/etc/firmware/leia_pfp_470.fw:/system/etc/firmware/leia_pfp_470.fw \
    $(LOCAL_PATH)/prebuilt/etc/firmware/leia_pm4_470.fw:/system/etc/firmware/leia_pm4_470.fw \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc.b00:/system/etc/firmware/vidc.b00 \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc.b01:/system/etc/firmware/vidc.b01 \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc.b02:/system/etc/firmware/vidc.b02 \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc.b03:/system/etc/firmware/vidc.b03 \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc.mdt:/system/etc/firmware/vidc.mdt \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidc_1080p.fw:/system/etc/firmware/vidc_1080p.fw \
    $(LOCAL_PATH)/prebuilt/etc/firmware/vidcfw.elf:/system/etc/firmware/vidcfw.elf

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/firmware/wlan/prima/WCNSS_cfg.dat:/system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/prebuilt/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/prebuilt/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/lib/modules/wlan.ko:system/lib/modules/wlan.ko

# Video (Temp)
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxVdec.so:/obj/lib/libOmxVdec.so \
#    $(LOCAL_PATH)/prebuilt/lib/libOmxVdec.so:/system/lib/libOmxVdec.so

# Audio
PRODUCT_PACKAGES += \
    alsa.msm8960 \
    audio.a2dp.default \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    libalsa-intf \
    libaudioutils

# Graphics
PRODUCT_PACKAGES += \
    lights.msm8960 \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    libmemalloc \
    liboverlay \
    libQcomUI \
    libtilerenderer

# LTE on CDMA
PRODUCT_PACKAGES += \
    Stk

# Qualcomm scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/init.lge_dut.bt.sh:/system/etc/init.lge_dut.bt.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.bt.sh:/system/etc/init.qcom.bt.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.coex.sh:/system/etc/init.qcom.coex.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.fm.sh:/system/etc/init.qcom.fm.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.ftm_module.sh:/system/etc/init.qcom.ftm_module.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.ftm_module_out.sh:/system/etc/init.qcom.ftm_module_out.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.mdm_links.sh:/system/etc/init.qcom.mdm_links.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.modem_links.sh:/system/etc/init.qcom.modem_links.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.post_boot.sh:/system/etc/init.qcom.post_boot.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.sdio.sh:/system/etc/init.qcom.sdio.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.qcom.wifi.sh:/system/etc/init.qcom.wifi.sh \
    $(LOCAL_PATH)/prebuilt/etc/init.wlan-on-off.sh:/system/etc/init.wlan-on-off.sh

# 2nd-init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/xbin/2nd-init:/system/xbin/2nd-init \
    $(LOCAL_PATH)/prebuilt/xbin/cm10.sh:/system/xbin/cm10.sh \
    $(LOCAL_PATH)/prebuilt/xbin/cm10.tar:/system/xbin/cm10.tar \
    $(LOCAL_PATH)/prebuilt/xbin/mksh2:/system/xbin/mksh2 \
    $(LOCAL_PATH)/prebuilt/xbin/recovery.sh:/system/xbin/recovery.sh \
    $(LOCAL_PATH)/prebuilt/xbin/recovery.tar:/system/xbin/recovery.tar \
    $(LOCAL_PATH)/prebuilt/xbin/taskset:/system/xbin/taskset

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# GPS config
PRODUCT_COPY_FILES += device/common/gps/gps.conf_AS:system/etc/gps.conf

# Media config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/featureset.xml:system/etc/featureset.xml \
    $(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/etc/settings.xml:system/etc/settings.xml \
    $(LOCAL_PATH)/prebuilt/etc/telephony.xml:system/etc/telephony.xml

# vold config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab

# thermald config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/thermald.conf:/system/etc/thermald.conf

# apn config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/apns-conf.xml:/system/etc/apns-conf.xml

# Sound configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/DL_REC:/system/etc/snd_soc_msm/DL_REC \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/DL_REC_2x:/system/etc/snd_soc_msm/DL_REC_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/FM_A2DP_REC:/system/etc/snd_soc_msm/FM_A2DP_REC \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/FM_A2DP_REC_2x:/system/etc/snd_soc_msm/FM_A2DP_REC_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/FM_Digital_Radio:/system/etc/snd_soc_msm/FM_Digital_Radio \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/FM_Digital_Radio_2x:/system/etc/snd_soc_msm/FM_Digital_Radio_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/FM_REC:/system/etc/snd_soc_msm/FM_REC \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/FM_REC_2x:/system/etc/snd_soc_msm/FM_REC_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/HiFi:/system/etc/snd_soc_msm/HiFi \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/HiFi_2x:/system/etc/snd_soc_msm/HiFi_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/HiFi_Low_Power:/system/etc/snd_soc_msm/HiFi_Low_Power \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/HiFi_Low_Power_2x:/system/etc/snd_soc_msm/HiFi_Low_Power_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/HiFi_Rec:/system/etc/snd_soc_msm/HiFi_Rec \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/HiFi_Rec_2x:/system/etc/snd_soc_msm/HiFi_Rec_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/snd_soc_msm:/system/etc/snd_soc_msm/snd_soc_msm \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/snd_soc_msm_2x:/system/etc/snd_soc_msm/snd_soc_msm_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/UL_DL_REC:/system/etc/snd_soc_msm/UL_DL_REC \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/UL_DL_REC_2x:/system/etc/snd_soc_msm/UL_DL_REC_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/Voice_Call:/system/etc/snd_soc_msm/Voice_Call \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/Voice_Call_2x:/system/etc/snd_soc_msm/Voice_Call_2x \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/Voice_Call_IP:/system/etc/snd_soc_msm/Voice_Call_IP \
    $(LOCAL_PATH)/prebuilt/etc/snd_soc_msm/Voice_Call_IP_2x:/system/etc/snd_soc_msm/Voice_Call_IP_2x

# Keylayouts and Keychars
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/MHLRCP.kl:system/usr/keylayout/MHLRCP.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/l0-keypad.kl:system/usr/keylayout/l0-keypad.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/osp3-input.kl:system/usr/keylayout/osp3-input.kl

# Input device config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/idc/keypad-8960.idc:system/usr/idc/keypad-8960.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/melfas-ts.idc:system/usr/idc/melfas-ts.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/osp3-input.idc:system/usr/idc/osp3-input.idc

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lib/libacdbloader.so:obj/lib/libacdbloader.so \
    $(LOCAL_PATH)/prebuilt/lib/libv8.so:obj/lib/libv8.so

# Prebuilt libraries that are needed
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bin/atd:system/bin/atd \
    $(LOCAL_PATH)/prebuilt/bin/ATFWD-daemon:system/bin/ATFWD-daemon \
    $(LOCAL_PATH)/prebuilt/bin/bridgemgrd:system/bin/bridgemgrd \
    $(LOCAL_PATH)/prebuilt/bin/btnvtool:system/bin/btnvtool \
    $(LOCAL_PATH)/prebuilt/bin/cnd:system/bin/cnd \
    $(LOCAL_PATH)/prebuilt/bin/ds_fmc_appd:system/bin/ds_fmc_appd \
    $(LOCAL_PATH)/prebuilt/bin/ftm_ptt:system/bin/ftm_ptt \
    $(LOCAL_PATH)/prebuilt/bin/gsiff_daemon:system/bin/gsiff_daemon \
    $(LOCAL_PATH)/prebuilt/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
    $(LOCAL_PATH)/prebuilt/bin/hdmid:system/bin/hdmid \
    $(LOCAL_PATH)/prebuilt/bin/hostapd:system/bin/hostapd \
    $(LOCAL_PATH)/prebuilt/bin/mm-pp-daemon:system/bin/mm-pp-daemon \
    $(LOCAL_PATH)/prebuilt/bin/mm-qcamera-daemon:system/bin/mm-qcamera-daemon \
    $(LOCAL_PATH)/prebuilt/bin/mpdecision:system/bin/mpdecision \
    $(LOCAL_PATH)/prebuilt/bin/netmgrd:system/bin/netmgrd \
    $(LOCAL_PATH)/prebuilt/bin/nl_listener:system/bin/nl_listener \
    $(LOCAL_PATH)/prebuilt/bin/port-bridge:system/bin/port-bridge \
    $(LOCAL_PATH)/prebuilt/bin/qmiproxy:system/bin/qmiproxy \
    $(LOCAL_PATH)/prebuilt/bin/qmuxd:system/bin/qmuxd \
    $(LOCAL_PATH)/prebuilt/bin/qseecomd:system/bin/qseecomd \
    $(LOCAL_PATH)/prebuilt/bin/quipc_igsn:system/bin/quipc_igsn \
    $(LOCAL_PATH)/prebuilt/bin/quipc_main:system/bin/quipc_main \
    $(LOCAL_PATH)/prebuilt/bin/radish:system/bin/radish \
    $(LOCAL_PATH)/prebuilt/bin/rild:system/bin/rild \
    $(LOCAL_PATH)/prebuilt/bin/rmt_storage:system/bin/rmt_storage \
    $(LOCAL_PATH)/prebuilt/bin/sensors.qcom:system/bin/sensors.qcom \
    $(LOCAL_PATH)/prebuilt/bin/thermald:system/bin/thermald \
    $(LOCAL_PATH)/prebuilt/bin/time_daemon:system/bin/time_daemon \
    $(LOCAL_PATH)/prebuilt/bin/usbhub:system/bin/usbhub \
    $(LOCAL_PATH)/prebuilt/bin/usbhub_init:system/bin/usbhub_init \
    $(LOCAL_PATH)/prebuilt/bin/v4l2-qcamera-app:system/bin/v4l2-qcamera-app \
    $(LOCAL_PATH)/prebuilt/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    $(LOCAL_PATH)/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    $(LOCAL_PATH)/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    $(LOCAL_PATH)/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    $(LOCAL_PATH)/prebuilt/lib/egl/libGLESv2S3D_adreno200.so:system/lib/egl/libGLESv2S3D_adreno200.so \
    $(LOCAL_PATH)/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    $(LOCAL_PATH)/prebuilt/lib/hw/camera.msm8960.so:system/lib/hw/camera.msm8960.so \
    $(LOCAL_PATH)/prebuilt/lib/hw/gps.default.so:system/lib/hw/gps.default.so \
    $(LOCAL_PATH)/prebuilt/lib/hw/nfc.msm8960.so:system/lib/hw/nfc.msm8960.so \
    $(LOCAL_PATH)/prebuilt/lib/hw/sensors.msm8960.so:system/lib/hw/sensors.msm8960.so \
    $(LOCAL_PATH)/prebuilt/lib/libacdbloader.so:system/lib/libacdbloader.so \
    $(LOCAL_PATH)/prebuilt/lib/libami306.so:system/lib/libami306.so \
    $(LOCAL_PATH)/prebuilt/lib/libaudcal.so:system/lib/libaudcal.so \
    $(LOCAL_PATH)/prebuilt/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
    $(LOCAL_PATH)/prebuilt/lib/libc2d2_z180.so:system/lib/libc2d2_z180.so \
    $(LOCAL_PATH)/prebuilt/lib/libC2D2.so:system/lib/libC2D2.so \
    $(LOCAL_PATH)/prebuilt/lib/libcamera_client.so:system/lib/libcamera_client.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx074_default_video.so:system/lib/libchromatix_imx074_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx074_preview.so:system/lib/libchromatix_imx074_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx074_video_hd.so:system/lib/libchromatix_imx074_video_hd.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx074_zsl.so:system/lib/libchromatix_imx074_zsl.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx091_default_video.so:system/lib/libchromatix_imx091_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx091_preview.so:system/lib/libchromatix_imx091_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx091_video_hd.so:system/lib/libchromatix_imx091_video_hd.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx111_default_video.so:system/lib/libchromatix_imx111_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx111_preview.so:system/lib/libchromatix_imx111_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx111_zsl.so:system/lib/libchromatix_imx111_zsl.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx119_default_video.so:system/lib/libchromatix_imx119_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx119_preview.so:system/lib/libchromatix_imx119_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_imx119_vt.so:system/lib/libchromatix_imx119_vt.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_ov2720_default_video.so:system/lib/libchromatix_ov2720_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_ov2720_preview.so:system/lib/libchromatix_ov2720_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_default_video.so:system/lib/libchromatix_s5k3l1yx_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_hfr_60fps.so:system/lib/libchromatix_s5k3l1yx_hfr_60fps.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_hfr_90fps.so:system/lib/libchromatix_s5k3l1yx_hfr_90fps.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_hfr_120fps.so:system/lib/libchromatix_s5k3l1yx_hfr_120fps.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_preview.so:system/lib/libchromatix_s5k3l1yx_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_video_hd.so:system/lib/libchromatix_s5k3l1yx_video_hd.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k3l1yx_zsl.so:system/lib/libchromatix_s5k3l1yx_zsl.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k4e1_default_video.so:system/lib/libchromatix_s5k4e1_default_video.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k4e1_preview.so:system/lib/libchromatix_s5k4e1_preview.so \
    $(LOCAL_PATH)/prebuilt/lib/libchromatix_s5k4e1_zsl.so:system/lib/libchromatix_s5k4e1_zsl.so \
    $(LOCAL_PATH)/prebuilt/lib/libCommandSvc.so:system/lib/libCommandSvc.so \
    $(LOCAL_PATH)/prebuilt/lib/libconfigdb.so:system/lib/libconfigdb.so \
    $(LOCAL_PATH)/prebuilt/lib/libdiag.so:system/lib/libdiag.so \
    $(LOCAL_PATH)/prebuilt/lib/libDivxDrm.so:system/lib/libDivxDrm.so \
    $(LOCAL_PATH)/prebuilt/lib/libdl.so:system/lib/libdl.so \
    $(LOCAL_PATH)/prebuilt/lib/libdrmdiag.so:system/lib/libdrmdiag.so \
    $(LOCAL_PATH)/prebuilt/lib/libdrmfs.so:system/lib/libdrmfs.so \
    $(LOCAL_PATH)/prebuilt/lib/libdsi_netctrl.so:system/lib/libdsi_netctrl.so \
    $(LOCAL_PATH)/prebuilt/lib/libdsprofile.so:system/lib/libdsprofile.so \
    $(LOCAL_PATH)/prebuilt/lib/libdss.so:system/lib/libdss.so \
    $(LOCAL_PATH)/prebuilt/lib/libdsucsd.so:system/lib/libdsucsd.so \
    $(LOCAL_PATH)/prebuilt/lib/libdsutils.so:system/lib/libdsutils.so \
    $(LOCAL_PATH)/prebuilt/lib/libgemini.so:system/lib/libgemini.so \
    $(LOCAL_PATH)/prebuilt/lib/libgps.so:system/lib/libgps.so \
    $(LOCAL_PATH)/prebuilt/lib/libgps.utils.so:system/lib/libgps.utils.so \
    $(LOCAL_PATH)/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
    $(LOCAL_PATH)/prebuilt/lib/libI420colorconvert.so:system/lib/libI420colorconvert.so \
    $(LOCAL_PATH)/prebuilt/lib/libidl.so:system/lib/libidl.so \
    $(LOCAL_PATH)/prebuilt/lib/libimage-jpeg-dec-omx-comp.so:system/lib/libimage-jpeg-dec-omx-comp.so \
    $(LOCAL_PATH)/prebuilt/lib/libimage-jpeg-enc-omx-comp.so:system/lib/libimage-jpeg-enc-omx-comp.so \
    $(LOCAL_PATH)/prebuilt/lib/libimage-omx-common.so:system/lib/libimage-omx-common.so \
    $(LOCAL_PATH)/prebuilt/lib/liblgftmitem.so:system/lib/liblgftmitem.so \
    $(LOCAL_PATH)/prebuilt/lib/libllvm-a3xx.so:system/lib/libllvm-a3xx.so \
    $(LOCAL_PATH)/prebuilt/lib/libloc_adapter.so:system/lib/libloc_adapter.so \
    $(LOCAL_PATH)/prebuilt/lib/libloc_api_v02.so:system/lib/libloc_api_v02.so \
    $(LOCAL_PATH)/prebuilt/lib/libloc_eng.so:system/lib/libloc_eng.so \
    $(LOCAL_PATH)/prebuilt/lib/libloc_ext.so:system/lib/libloc_ext.so \
    $(LOCAL_PATH)/prebuilt/lib/liblog.so:system/lib/liblog.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmcamera_faceproc.so:system/lib/libmmcamera_faceproc.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmcamera_frameproc.so:system/lib/libmmcamera_frameproc.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmcamera_statsproc30.so:system/lib/libmmcamera_statsproc30.so \
    $(LOCAL_PATH)/prebuilt/lib/libmm-color-convertor.so:system/lib/libmm-color-convertor.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmipl.so:system/lib/libmmipl.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmjps.so:system/lib/libmmjps.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmmpo.so:system/lib/libmmmpo.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmmpod.so:system/lib/libmmmpod.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmosal.so:system/lib/libmmosal.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmparser.so:system/lib/libmmparser.so \
    $(LOCAL_PATH)/prebuilt/lib/libmmstillomx.so:system/lib/libmmstillomx.so \
    $(LOCAL_PATH)/prebuilt/lib/libnetmgr.so:system/lib/libnetmgr.so \
    $(LOCAL_PATH)/prebuilt/lib/liboemcamera.so:system/lib/liboemcamera.so \
    $(LOCAL_PATH)/prebuilt/lib/libOlaFaceDetector.so:system/lib/libOlaFaceDetector.so \
    $(LOCAL_PATH)/prebuilt/lib/libOlaLGECameraJNI.so:system/lib/libOlaLGECameraJNI.so \
    $(LOCAL_PATH)/prebuilt/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    $(LOCAL_PATH)/prebuilt/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    $(LOCAL_PATH)/prebuilt/lib/libOpenCL.so:system/lib/libOpenCL.so \
    $(LOCAL_PATH)/prebuilt/lib/libOpenVG.so:system/lib/libOpenVG.so \
    $(LOCAL_PATH)/prebuilt/lib/libqc-opt.so:system/lib/libqc-opt.so \
    $(LOCAL_PATH)/prebuilt/lib/libqdi.so:system/lib/libqdi.so \
    $(LOCAL_PATH)/prebuilt/lib/libqdp.so:system/lib/libqdp.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmi.so:system/lib/libqmi.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmi_cci.so:system/lib/libqmi_cci.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmi_common_so.so:system/lib/libqmi_common_so.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmi_csi.so:system/lib/libqmi_csi.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmi_encdec.so:system/lib/libqmi_encdec.so \
    $(LOCAL_PATH)/prebuilt/lib/libqmiservices.so:system/lib/libqmiservices.so \
    $(LOCAL_PATH)/prebuilt/lib/libQSEEComAPI.so:system/lib/libQSEEComAPI.so \
    $(LOCAL_PATH)/prebuilt/lib/libreference-ril.so:system/lib/libreference-ril.so \
    $(LOCAL_PATH)/prebuilt/lib/libril.so:system/lib/libril.so \
    $(LOCAL_PATH)/prebuilt/lib/libril-qc-qmi-1.so:system/lib/libril-qc-qmi-1.so \
    $(LOCAL_PATH)/prebuilt/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    $(LOCAL_PATH)/prebuilt/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    $(LOCAL_PATH)/prebuilt/lib/libsc-a3xx.so:system/lib/libsc-a3xx.so \
    $(LOCAL_PATH)/prebuilt/lib/libsensor1.so:system/lib/libsensor1.so \
    $(LOCAL_PATH)/prebuilt/lib/libsensor_reg.so:system/lib/libsensor_reg.so \
    $(LOCAL_PATH)/prebuilt/lib/libsensor_test.so:system/lib/libsensor_test.so \
    $(LOCAL_PATH)/prebuilt/lib/libsensor_user_cal.so:system/lib/libsensor_user_cal.so \
    $(LOCAL_PATH)/prebuilt/lib/libtcpfinaggr.so:system/lib/libtcpfinaggr.so \
    $(LOCAL_PATH)/prebuilt/lib/libxml.so:system/lib/libxml.so \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/libpn544_fw.so:system/vendor/firmware/libpn544_fw.so \
    $(LOCAL_PATH)/prebuilt/lib/hw/lights.msm8960.so:system/lib/hw/lights.msm8960.so

# Camera
PRODUCT_PACKAGES += \
    libcameraservice

# Torch
PRODUCT_PACKAGES += \
    Torch

# Kernel modules
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lib/modules/wlan.ko:/system/lib/modules/wlan.ko \

# Extra properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y

# We have enough space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# call the proprietary setup
$(call inherit-product-if-exists, vendor/lge/l0/l0-vendor.mk)

# call dalvik heap config
#$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

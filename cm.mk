# Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := l0

TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lge/l0/device_l0.mk)

# Device naming
PRODUCT_DEVICE := l0
PRODUCT_NAME := cm_l0
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-MS770
PRODUCT_MANUFACTURER := lge

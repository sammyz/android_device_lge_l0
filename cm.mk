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

    CDMA_CARRIER_ALPHA := MetroPCS
    CDMA_CARRIER_NUMERIC := 311660

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC) \

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="lge/l0_MPCS_US/l0:4.0.4/IMM76I/MS77010f.1360114527:user/release-keys" \
    PRIVATE_BUILD_DESC="l0_MPCS_US-user 4.0.4 IMM76I MS77010f.1360114527 release-keys"

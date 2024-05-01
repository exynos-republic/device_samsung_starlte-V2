#
# Copyright (C) 2021 The LineageOS Project
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

# Inherit from the common tree
$(call inherit-product, device/samsung/exynos9810-common/common.mk)

# Inherit proprietary files
$(call inherit-product, vendor/samsung/starlte/starlte-vendor.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Prebuilt kernel
TARGET_KERNEL_DIR ?= device/samsung/starlte-kernel
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/Image
BOARD_KERNEL_PREBUILT_DT := $(TARGET_KERNEL_DIR)/dt.img

PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel

PRODUCT_COPY_FILES += \
	$(BOARD_KERNEL_PREBUILT_DT):dt.img

# Displayconfig
PRODUCT_COPY_FILES += \
    device/samsung/starlte/config/display/display_id_4633128631561747585.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4633128631561747585.xml
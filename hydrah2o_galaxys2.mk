# Copyright (C) 2012 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Release name
PRODUCT_RELEASE_NAME := SGS2

#PRODUCT_VERSION_MAINTENANCE := 0

$(call inherit-product, vendor/hydrah2o/products/asian.mk)

$(call inherit-product, vendor/hydrah2o/products/high_telephony_device.mk)

$(call inherit-product, vendor/hydrah2o/products/themes_common.mk)

$(call inherit-product, device/samsung/galaxys2/full_galaxys2.mk)

$(call inherit-product, device/samsung/galaxys2/all_locale.mk)

#test in ICS-RC
PRODUCT_PACKAGES += \
    ROMControl \
    ContactsWidget


PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=240 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.fast.dormancy.timeout=3 \
    ro.ril.enable.sbm.feature=1 \
    ro.ril.enable.sdr=0 \
    ro.ril.qos.maxpdps=2 \
    ro.ril.hsxpa=2 \
    ro.ril.hsdpa.category=14 \
    ro.ril.hsupa.category=7 \
    ro.ril.hep=1 \
    ro.ril.enable.dtm=0 \
    ro.ril.gprsclass=12 \
    ro.ril.avoid.pdp.overlap=1 \
    ro.ril.enable.prl.recognition=0 \
    ro.ril.def.agps.mode=2 \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.enable.enhance.search=0 \
    ro.ril.fast.dormancy.rule=1 \
    ro.ril.fd.scron.timeout=30 \
    ro.ril.fd.scroff.timeout=10 \
    ro.ril.emc.mode=2 \
    ro.ril.att.feature=0  \
    debug.composition.type=gpu \
    ro.FOREGROUND_APP_ADJ=0 \
    ro.VISIBLE_APP_ADJ=1 \
    ro.SECONDARY_SERVER_ADJ=2 \
    ro.BACKUP_APP_ADJ=2 \
    ro.HOME_APP_ADJ=-17 \
    ro.HIDDEN_APP_MIN_ADJ=7 \
    ro.CONTENT_PROVIDER_ADJ=14 \
    ro.EMPTY_APP_ADJ=15 \
    pm.sleep_mode=1 \
    ro.ril.disable.power.collapse=0 \
    debug.sf.hw=1 \
    persist.sys.use_dithering=0 \
    video.accelerate.hw=1 \
    debug.performance.tuning=1 \
    windowsmgr.max_events_per_sec=90 \
    ro.lge.proximity.delay=25 \
    mot.proximity.delay=25 \
    ro.camera.sound.forced=0 \
    dalvik.vm.execution-mode=int:jit \
    ro.telephony.call_ring.delay=0 \
    ro.mot.buttonlight.timeout=8 \
    ro.media.enc.hprof.vid.bps=8000000 \
    dalvik.vm.dexopt-flags=v=n,o=v,u=y \
    ro.media.enc.jpeg.quality=100


# Specific hdpi files
PRODUCT_COPY_FILES += \
	device/samsung/galaxys2/prebuilt/bootanimation.zip:system/media/bootanimation.zip

DEVICE_PACKAGE_OVERLAYS += device/samsung/galaxys2/overlay/hdpi



# Discard inherited values and use our own instead.
PRODUCT_NAME := hydrah2o_galaxys2
PRODUCT_DEVICE := galaxys2
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9100

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9100 BUILD_FINGERPRINT=samsung/GT-I9100/GT-I9100:4.0.3/IML74K/XXLPQ:user/release-keys PRIVATE_BUILD_DESC="GT-I9100-user 4.0.3 IML74K XXLPQ release-keys"

# Inherit Flash Player	
# -include vendor/hydrah2o/products/flashplayer.mk

# Inherit drm blobs
-include vendor/hydrah2o/products/drm.mk

# Inherit Facelock blobs
-include vendor/hydrah2o/products/facelock.mk

# Inherit Gapps blobs
-include vendor/hydrah2o/products/common_gapps.mk

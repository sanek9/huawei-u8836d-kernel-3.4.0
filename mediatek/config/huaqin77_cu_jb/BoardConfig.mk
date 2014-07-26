# Copyright Statement:
#
# This software/firmware and related documentation ("MediaTek Software") are
# protected under relevant copyright laws. The information contained herein
# is confidential and proprietary to MediaTek Inc. and/or its licensors.
# Without the prior written permission of MediaTek inc. and/or its licensors,
# any reproduction, modification, use or disclosure of MediaTek Software,
# and information contained herein, in whole or in part, shall be strictly prohibited.

# MediaTek Inc. (C) 2010. All rights reserved.
#
# BY OPENING THIS FILE, RECEIVER HEREBY UNEQUIVOCALLY ACKNOWLEDGES AND AGREES
# THAT THE SOFTWARE/FIRMWARE AND ITS DOCUMENTATIONS ("MEDIATEK SOFTWARE")
# RECEIVED FROM MEDIATEK AND/OR ITS REPRESENTATIVES ARE PROVIDED TO RECEIVER ON
# AN "AS-IS" BASIS ONLY. MEDIATEK EXPRESSLY DISCLAIMS ANY AND ALL WARRANTIES,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NONINFRINGEMENT.
# NEITHER DOES MEDIATEK PROVIDE ANY WARRANTY WHATSOEVER WITH RESPECT TO THE
# SOFTWARE OF ANY THIRD PARTY WHICH MAY BE USED BY, INCORPORATED IN, OR
# SUPPLIED WITH THE MEDIATEK SOFTWARE, AND RECEIVER AGREES TO LOOK ONLY TO SUCH
# THIRD PARTY FOR ANY WARRANTY CLAIM RELATING THERETO. RECEIVER EXPRESSLY ACKNOWLEDGES
# THAT IT IS RECEIVER'S SOLE RESPONSIBILITY TO OBTAIN FROM ANY THIRD PARTY ALL PROPER LICENSES
# CONTAINED IN MEDIATEK SOFTWARE. MEDIATEK SHALL ALSO NOT BE RESPONSIBLE FOR ANY MEDIATEK
# SOFTWARE RELEASES MADE TO RECEIVER'S SPECIFICATION OR TO CONFORM TO A PARTICULAR
# STANDARD OR OPEN FORUM. RECEIVER'S SOLE AND EXCLUSIVE REMEDY AND MEDIATEK'S ENTIRE AND
# CUMULATIVE LIABILITY WITH RESPECT TO THE MEDIATEK SOFTWARE RELEASED HEREUNDER WILL BE,
# AT MEDIATEK'S OPTION, TO REVISE OR REPLACE THE MEDIATEK SOFTWARE AT ISSUE,
# OR REFUND ANY SOFTWARE LICENSE FEES OR SERVICE CHARGE PAID BY RECEIVER TO
# MEDIATEK FOR SUCH MEDIATEK SOFTWARE AT ISSUE.
#
# The following software/firmware and/or related documentation ("MediaTek Software")
# have been modified by MediaTek Inc. All revisions are subject to any receiver's
# applicable license agreements with MediaTek Inc.


# config.mk
#
# Product-specific compile-time definitions.
#
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_CPU_SMP := true

# eMMC support
ifeq ($(MTK_EMMC_SUPPORT),yes)
TARGET_USERIMAGES_USE_EXT4:=true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
endif

USE_CAMERA_STUB := true

TARGET_NO_FACTORYIMAGE := true

# for migrate build system
# temporarily open this two options
HAVE_HTC_AUDIO_DRIVER := true
BOARD_USES_YUSU_AUDIO := true

BOARD_EGL_CFG := $(BOARD_CONFIG_DIR)/egl.cfg

BOARD_MTK_LIBSENSORS_NAME :=
BOARD_MTK_LIB_SENSOR :=

# MTK, Baochu Wang, 20101130, Add A-GPS {
ifeq ($(MTK_AGPS_APP), yes)
   BOARD_AGPS_SUPL_LIBRARIES := true
else
   BOARD_AGPS_SUPL_LIBRARIES := false
endif
# MTK, Baochu Wang, 20101130, Add A-GPS }

ifeq ($(MTK_GPS_SUPPORT), yes)
  BOARD_GPS_LIBRARIES := true
else
  BOARD_GPS_LIBRARIES := false
endif

# MTK, Infinity, 20090720, Add WiFi {
ifeq ($(MTK_WLAN_SUPPORT), yes)
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
BOARD_P2P_SUPPLICANT_DRIVER := NL80211
HAVE_CUSTOM_WIFI_DRIVER_2 := true
HAVE_INTERNAL_WPA_SUPPLICANT_CONF := true
HAVE_CUSTOM_WIFI_HAL := mediatek
WPA_SUPPLICANT_VERSION := VER_0_6_X
P2P_SUPPLICANT_VERSION := VER_0_8_X
endif
# MTK, Infinity, 20090720, Add WiFi }

TARGET_KMODULES := true

TARGET_ARCH_VARIANT := armv7-a-neon

ifeq ($(strip $(MTK_NAND_PAGE_SIZE)), 4K)
  BOARD_NAND_PAGE_SIZE := 4096 -s 128
else
  BOARD_NAND_PAGE_SIZE := 2048 -s 64   # default 2K
endif

# include all config files
include $(BOARD_CONFIG_DIR)/configs/*.mk


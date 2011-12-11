LOCAL_PATH:=$(call my-dir)
include $(CLEAR_VARS)

LOCAL_ARM_MODE:=arm

LOCAL_MODULE:=orcc

LOCAL_MODULE_TAGS:=eng debug

LOCAL_SRC_FILES := \
	orcc.c

LOCAL_SHARED_LIBRARIES:=\
	liborc-0.4 \
	liborc-test-0.4

LOCAL_LDFLAGS:=\
	-version-info\
	-no-undefined\
	-export-symbols-regex

LOCAL_CFLAGS := \
	-Wall \
	-I$(LOCAL_PATH)/../ \
	-DORC_ENABLE_UNSTABLE_API \
	-DHAVE_CONFIG_H

LOCAL_PRELINK_MODULE := false
include $(BUILD_EXECUTABLE)


LOCAL_PATH := $(call my-dir)

# InstallBenzoBlock (smaller AdAway)
include $(CLEAR_VARS)
LOCAL_MODULE := BenzoBlock
LOCAL_SRC_FILES := BenzoBlock/BenzoBlock.apk
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_PATH := $(TARGET_OUT)/app
LOCAL_MODULE_TAGS := optional
LOCAL_PREBUILT_JNI_LIBS_arm := \
	@lib/armeabi/libblank_webserver_exec.so \
	@lib/armeabi/libtcpdump_exec.so
include $(BUILD_PREBUILT)

# Chromium Browser 49.0.2571.0
include $(CLEAR_VARS)
LOCAL_MODULE := Chromium
LOCAL_SRC_FILES := Chromium/Chromium.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := Browser
LOCAL_MULTILIB := both
include $(BUILD_PREBUILT)

# Install Layers Manager
include $(CLEAR_VARS)
LOCAL_MODULE := LayersManager
LOCAL_SRC_FILES := LayersManager/LayersManager.apk
LOCAL_MODULE_SUFFIX := .apk
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_PATH := $(TARGET_OUT)/app
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

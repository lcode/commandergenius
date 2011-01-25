LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := fluidsynth

APP_SUBDIRS := $(patsubst $(LOCAL_PATH)/%, %, $(shell find $(LOCAL_PATH)/src -type d))

LOCAL_CFLAGS := -O3 $(foreach D, $(APP_SUBDIRS), -I$(LOCAL_PATH)/$(D)) \
				-I$(LOCAL_PATH)/include -DHAVE_CONFIG_H -include stdint.h -I$(LOCAL_PATH)/../sdl-$(SDL_VERSION)/include \
				-Werror=implicit -D__sF=__SDL_fake_stdout



LOCAL_CPP_EXTENSION := .cpp

LOCAL_SRC_FILES := $(foreach F, $(APP_SUBDIRS), $(addprefix $(F)/,$(notdir $(wildcard $(LOCAL_PATH)/$(F)/*.cpp))))
LOCAL_SRC_FILES += $(foreach F, $(APP_SUBDIRS), $(addprefix $(F)/,$(notdir $(wildcard $(LOCAL_PATH)/$(F)/*.c))))

LOCAL_SHARED_LIBRARIES := sdl-$(SDL_VERSION)

LOCAL_STATIC_LIBRARIES := 

LOCAL_LDLIBS := 

include $(BUILD_SHARED_LIBRARY)

ifeq ($(call my-dir),$(call project-path-for,qcom-audio))

# TODO:  Find a better way to separate build configs for ADP vs non-ADP devices
ifneq ($(TARGET_BOARD_AUTO),true)
  ifneq ($(filter msm8960 msm8226 msm8x26 msm8974 msm8x74 msm8x84 msm8084 msm8992 msm8994 msm8996,$(TARGET_BOARD_PLATFORM)),)

    MY_LOCAL_PATH := $(call my-dir)

    ifeq ($(BOARD_USES_LEGACY_ALSA_AUDIO),true)
      include $(MY_LOCAL_PATH)/legacy/Android.mk
    else
      include $(MY_LOCAL_PATH)/hal/Android.mk
      include $(MY_LOCAL_PATH)/voice_processing/Android.mk
      include $(MY_LOCAL_PATH)/visualizer/Android.mk
      include $(MY_LOCAL_PATH)/post_proc/Android.mk
    endif
  else
    ifneq ($(filter msm8909 ,$(TARGET_BOARD_PLATFORM)),)
      #For msm8909 target
      include $(call all-named-subdir-makefiles,msm8909)
    endif

  endif
endif

endif

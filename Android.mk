LOCAL_PATH := $(call my-dir)
# prebuilt libssl
include $(CLEAR_VARS)

LOCAL_MODULE := ssl
LOCAL_SRC_FILES := ../../android-openssl/libs/$(TARGET_ARCH_ABI)/libssl.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include/

include $(PREBUILT_SHARED_LIBRARY)

# prebuilt libcrypto
include $(CLEAR_VARS)

LOCAL_MODULE := crypto
LOCAL_SRC_FILES := ../../android-openssl/libs/$(TARGET_ARCH_ABI)/libcrypto.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include/

include $(PREBUILT_SHARED_LIBRARY)

# prebuilt libncurses
include $(CLEAR_VARS)

LOCAL_MODULE := ncurses
LOCAL_SRC_FILES := ../../android-libncurses/libs/$(TARGET_ARCH_ABI)/libncurses.so
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../include/

include $(PREBUILT_SHARED_LIBRARY)

#======================= tnftp =====================
include $(CLEAR_VARS)
L_DEFS := -UHAVE_TIMEGM
L_CFLAGS := $(L_DEFS)
L_USE_CPU_SOURCE := netcpu_none.c

INCLUDES += $(LOCAL_PATH)
INCLUDES += $(LOCAL_PATH)/libedit/
INCLUDES += $(LOCAL_PATH)/tnftp/src/
INCLUDES += $(LOCAL_PATH)/libnetbsd/

LOCAL_SRC_FILES := src/complete.c \
	src/main.c \
	src/cmdtab.c \
	src/util.c \
	src/progressbar.c \
	src/cmds.c \
	src/domacro.c \
	src/ftp.c \
	src/fetch.c \
	src/getpass.c \
	src/ruserpass.c \
	src/ssl.c \
	libedit/sig.c \
	libedit/chared.c \
	libedit/map.c \
	libedit/refresh.c \
	libedit/hist.c \
	libedit/emacs.c \
	libedit/fcns.c \
	libedit/tty.c \
	libedit/read.c \
	libedit/tokenizer.c \
	libedit/el.c \
	libedit/prompt.c \
	libedit/term.c \
	libedit/common.c \
	libedit/parse.c \
	libedit/history.c \
	libedit/help.c \
	libedit/search.c \
	libedit/vi.c \
	libedit/key.c \
	libnetbsd/setprogname.c \
	libnetbsd/sl_init.c \
	libnetbsd/strlcat.c \
	libnetbsd/strlcpy.c \
	libnetbsd/fgetln.c \
	libnetbsd/glob.c \
	libnetbsd/strvis.c \
	libnetbsd/strunvis.c \
	libnetbsd/timegm.c

LOCAL_MODULE := tnftp
LOCAL_MODULE_TAGS := eng
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_CFLAGS := $(L_CFLAGS)
LOCAL_C_INCLUDES := $(INCLUDES)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../../android-openssl/jni/include/
LOCAL_SHARED_LIBRARIES := libc libm libcutils libncurses crypto ssl
include $(BUILD_EXECUTABLE)



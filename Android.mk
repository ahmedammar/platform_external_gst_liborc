LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

liborc_TOP := $(LOCAL_PATH)

liborc_BUILT_SOURCES :=	\
	orc/Android.mk \
	orc-test/Android.mk

liborc_BUILT_SOURCES := $(patsubst %, $(abspath $(liborc_TOP))/%, $(liborc_BUILT_SOURCES))

.PHONY: liborc-configure
liborc-configure:
	cd $(liborc_TOP) ; \
	NOCONFIGURE=1 \
	cp ../config.sub . && \
	autoreconf && \
	CC="$(CONFIGURE_CC)" \
	CFLAGS="$(CONFIGURE_CFLAGS)" \
	LD=$(TARGET_LD) \
	LDFLAGS="$(CONFIGURE_LDFLAGS)" \
	CPP=$(CONFIGURE_CPP) \
	CPPFLAGS="$(CONFIGURE_CPPFLAGS)" \
	PKG_CONFIG_LIBDIR="$(CONFIGURE_PKG_CONFIG_LIBDIR)" \
	PKG_CONFIG_TOP_BUILD_DIR=/ \
	$(abspath $(liborc_TOP))/configure --host=arm-linux-androideabi \
	--prefix=/system --enable-backend=neon --disable-gtk-doc PACKAGE=liborc && \
	for file in $(liborc_BUILT_SOURCES); do \
		rm -f $$file && \
		make -C $$(dirname $$file) $$(basename $$file) ; \
	done

CONFIGURE_TARGETS += liborc-configure

-include $(liborc_TOP)/orc/Android.mk
-include $(liborc_TOP)/orc-test/Android.mk

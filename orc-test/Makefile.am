
pkgincludedir = $(includedir)/orc-@ORC_MAJORMINOR@/orc-test

lib_LTLIBRARIES = liborc-test-@ORC_MAJORMINOR@.la

liborc_test_@ORC_MAJORMINOR@_la_LIBADD = $(ORC_LIBS)
liborc_test_@ORC_MAJORMINOR@_la_LDFLAGS = \
	-version-info $(ORC_LIBVERSION) \
	-no-undefined -export-symbols-regex 'orc_'
liborc_test_@ORC_MAJORMINOR@_la_CFLAGS = $(ORC_CFLAGS) \
	-DORC_ENABLE_UNSTABLE_API

liborc_test_@ORC_MAJORMINOR@_la_SOURCES = \
	orctest.c \
	orcarray.c \
	orcrandom.c \
	orcprofile.c

pkginclude_HEADERS = \
	orctest.h \
	orcarray.h \
	orcrandom.h \
	orcprofile.h

Android.mk: Makefile.am
	androgenizer \
	-:PROJECT liborc-test -:SHARED liborc-test-@ORC_MAJORMINOR@ \
	 -:TAGS user eng debug \
         -:REL_TOP $(top_srcdir) -:ABS_TOP $(abs_top_srcdir) \
	 -:SOURCES $(liborc_test_@ORC_MAJORMINOR@_la_SOURCES) \
	 -:CFLAGS $(liborc_test_@ORC_MAJORMINOR@_la_CFLAGS) $(DEFS) $(INCLUDES) \
	 -:LDFLAGS $(liborc_test_@ORC_MAJORMINOR@_la_LDFLAGS) \
	           $(liborc_test_@ORC_MAJORMINOR@_la_LIBADD) \
	 -:PASSTHROUGH LOCAL_ARM_MODE:=arm \
		       LOCAL_MODULE_PATH:='$$(TARGET_OUT)/lib' \
	> $@

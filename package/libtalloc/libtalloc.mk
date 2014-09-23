################################################################################
#
# libtalloc
#
################################################################################

LIBTALLOC_VERSION = 2.1.1
LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
LIBTALLOC_INSTALL_STAGING = YES
LIBTALLOC_DEPENDENCIES = \
	host-pkgconf \
	host-python
#	host-vala \
#	host-python

define LIBTALLOC_CONFIGURE_CMDS
	(cd $(@D); \
		$(TARGET_CONFIGURE_OPTS)	\
		$(HOST_DIR)/usr/bin/python2 ./buildtools/bin/waf configure \
		--prefix=/usr			\
       )
endef

define LIBTALLOC_BUILD_CMDS
       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./buildtools/bin/waf build -j $(PARALLEL_JOBS))
endef

define LIBTALLOC_INSTALL_STAGING_CMDS
       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./buildtools/bin/waf --destdir=$(STAGING_DIR) install)
endef

define LIBTALLOC_INSTALL_TARGET_CMDS
       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./buildtools/bin/waf --destdir=$(TARGET_DIR) install)
endef

$(eval $(generic-package))

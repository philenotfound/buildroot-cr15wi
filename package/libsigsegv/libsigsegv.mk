#############################################################
#
# libsigsegv
#
#############################################################

LIBSIGSEGV_VERSION = 2.10
LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
LIBSIGSEGV_INSTALL_STAGING = YES
LIBSIGSEGV_LICENSE = GPLv2+
LIBSIGSEGV_LICENSE_FILES = COPYING

$(eval $(autotools-package))

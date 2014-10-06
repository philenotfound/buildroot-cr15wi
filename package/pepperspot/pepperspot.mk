################################################################################
#
# pepperspot
#
################################################################################

PEPPERSPOT_VERSION = 0.4
PEPPERSPOT_SOURCE = pepperspot-$(PEPPERSPOT_VERSION).tar.bz2
PEPPERSPOT_SITE = http://downloads.sourceforge.net/project/pepperspot
PEPPERSPOT_LICENSE = GPLv2
PEPPERSPOT_LICENSE_FILES = LICENSE

$(eval $(autotools-package))

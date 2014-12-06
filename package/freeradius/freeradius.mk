################################################################################
#
# freeradius
#
################################################################################

FREERADIUS_VERSION = 2.2.5
FREERADIUS_SOURCE = freeradius-server-$(FREERADIUS_VERSION).tar.bz2
FREERADIUS_SITE = ftp://ftp.freeradius.org/pub/freeradius/
FREERADIUS_LICENSE = GPLv2
FREERADIUS_LICENSE_FILES = LICENSE
FREERADIUS_DEPENDENCIES = openssl libtalloc host-automake host-autoconf host-libtool host-pkgconf host-m4
# freeradius doesn't respect DESTDIR, it uses a variable named R instead
#FREERADIUS_TMP_INSTALL_DIR = `mktemp -d`
#FREERADIUS_MAKE_ENV = R=$(FREERADIUS_TMP_INSTALL_DIR)
FREERADIUS_MAKE_ENV = R=$(TARGET_DIR)


FREERADIUS_CONF_OPT = --with-raddbdir=/etc/freeradius \
--without-edir \
--without-snmp \
--with-experimental-modules \
--without-rlm_attr-rewrite \
--without-rlm_caching \
--without-rlm_checkval \
--without-rlm_counter \
--without-rlm_dbm \
--with-rlm_eap \
--without-rlm_eap_sim \
--without-rlm_example \
--without-rlm_ippool \
--without-rlm_krb5 \
--without-rlm_otp \
--without-rlm_pam \
--without-rlm_perl \
--without-rlm_python \
--with-rlm_radutmp \
--without-rlm_smb \
--with-rlm_sql \
--with-rlm_sqlcounter \
--without-rlm_sql_db2 \
--without-rlm_sql_freetds \
--without-rlm_sql_iodbc \
--without-rlm_sql_oracle \
--without-rlm_sql_sybase \
--without-rlm_sql_unixodbc \
--without-rlm_sql_log \
--with-rlm_unix \
--without-rlm_ldap \
--without-rlm_sql_mysql \
--without-rlm_sql_postgresql

define FREERADIUS_POST_INSTALL_FIXUP
	echo $(FREERADIUS_TMP_INSTALL_DIR)
endef

#FREERADIUS_POST_INSTALL_TARGET_HOOKS += FREERADIUS_POST_INSTALL_FIXUP

$(eval $(autotools-package))

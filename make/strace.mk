#############################################################
#
# strace
#
# Maintainer: Ken Restivo <ken@246gt.com>
#
#############################################################
#$Id: strace.mk,v 1.1 2002/05/23 19:21:23 andersen Exp $

# TARGETS
STRACE_SITE:=http://prdownloads.sourceforge.net/strace
STRACE_SOURCE:=strace_4.4-1.tar.gz 
STRACE_DIR:=$(BUILD_DIR)/strace-4.4

$(DL_DIR)/$(STRACE_SOURCE):
	wget -P $(DL_DIR) --passive-ftp $(STRACE_SITE)/$(STRACE_SOURCE)

strace-source: $(DL_DIR)/$(STRACE_SOURCE)

$(STRACE_DIR)/.dist: $(DL_DIR)/$(STRACE_SOURCE)
	zcat $(DL_DIR)/$(STRACE_SOURCE) | tar -C $(BUILD_DIR) -xvf -
	touch  $(STRACE_DIR)/.dist

$(STRACE_DIR)/Makefile: $(STRACE_DIR)/.dist
	(cd ${STRACE_DIR}; \
	export PATH="${TARGET_PATH}"; \
	./configure --with-shared --prefix=$(STAGING_DIR)/usr --target=arm-linux \
	--host=arm-linux )

$(STRACE_DIR)/strace: $(STRACE_DIR)/Makefile
	make -C $(STRACE_DIR)  CC="${TARGET_CC}" LD="${TARGET_LD}"\
	AS="${TARGET_AS}"

$(STAGING_DIR)/usr/bin/strace: $(STRACE_DIR)/strace
	-mkdir -p $(STAGING_DIR)/usr/man/man1
	make -C $(STRACE_DIR) install
	rm -rf $(STAGING_DIR)/usr/man/man1

$(TARGET_DIR)/usr/bin/strace: $(STAGING_DIR)/usr/bin/strace
	install -c $(STAGING_DIR)/usr/bin/strace $(TARGET_DIR)/usr/bin/strace

strace-clean: 
	make -C $(STRACE_DIR) clean

strace-dirclean: 
	rm -rf $(STRACE_DIR) 

strace: uclibc $(TARGET_DIR)/usr/bin/strace 


DIST   ?= /base/
TARGET ?= /host/
CLOUD_INIT ?= /etc/cloudposse/cloud-init.yml

install:
	rsync -av $(DIST) $(TARGET)
	find $(TARGET) -type f -name '*.erb' | xargs -n 1 rewrite 
	find $(TARGET) -type f -name '*.erb' | xargs rm

cloud-init: install
	chroot $(TARGET) /usr/bin/coreos-cloudinit -from-file=$(CLOUD_INIT)

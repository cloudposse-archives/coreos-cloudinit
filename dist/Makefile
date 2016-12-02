DIST   ?= /base/
TARGET ?= /host/
CLOUD_CONFIG ?= /etc/cloudposse/cloud-config.yml

install:
	find $(DIST) -type f -name '*.erb' | xargs -n 1 rewrite 
	rsync -av --exclude '*.erb' $(DIST) $(TARGET)

cloud-init: install
	chroot $(TARGET) /usr/bin/coreos-cloudinit -from-file=$(CLOUD_CONFIG)

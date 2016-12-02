DIST   ?= /base/
TARGET ?= /host/
CLOUD_CONFIGS ?= /etc/cloud-configs/

install:
	find $(DIST) -type f -name '*.erb' | xargs -n 1 rewrite 
	rsync -av --exclude '*.erb' $(DIST) $(TARGET)

build: install
	chroot $(TARGET) find $(CLOUD_CONFIGS) -name '*.yml' -exec /usr/bin/coreos-cloudinit -from-file={} \;

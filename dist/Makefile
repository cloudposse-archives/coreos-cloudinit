PATH_PATH   ?= /base/
INSTALL_PATH ?= /host/
CLOUD_CONFIG_PATH ?= /etc/cloud-configs/

## Render templates
build:
	find $(DIST_PATH) -type f -name '*.erb' | xargs -n 1 rewrite 

## Install base system
install: build
	rsync -av --exclude '*.erb' $(DIST_PATH) $(INSTALL_PATH)

## Run cloudinit
run: install
	chroot $(INSTALL_PATH) find $(CLOUD_CONFIG_PATH) -name '*.yml' -exec /usr/bin/coreos-cloudinit -from-file={} \;

## Display a list of required environment variables
required-envs:
	@grep -E -o "ENV\['.*?'\]" -R dist/base/ | \
    cut -d\' -f2 |\
    sort -u | \
    sed 's/$$/=/g'

# coreos-cloudinit
Easily Bootstrap CoreOS Host Machine Using Docker Containers

## Usage

This should be considered as a `FROM` base image for use with more advanced bootstrapping configurations.

Run `docker run cloudposse/coreos-cloudinit required-envs > /etc/cloud-configs/env` to generate a list of required environment variables.

Sample systemd unit:

```
[Unit]                                                                                                                                                                                                                     
Description=CoreOS Cloud Init Service
Requires=early-docker.service
After=early-docker.service

[Service]
User=root
Environment=DOCKER_HOST="unix:///var/run/early-docker.sock
ExecStartPre=/usr/bin/mkdir -p /etc/cloud-configs
ExecStart=/usr/bin/docker run --env-file=/etc/cloud-configs/env --volume=/:/host cloudposse/coreos-cloudinit run
RemainAfterExit=yes
Type=oneshot
```

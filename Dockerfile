FROM ubuntu:14.04

ENV PATH=$PATH:/opt/bin
ENV VERSION=1.0.0

RUN apt-get update && \
    apt-get -y install ruby make rsync && \
    mkdir /host

VOLUME ["/host"]

WORKDIR /

ADD dist/ /

ENTRYPOINT ["/usr/bin/make"]

# cd .. && docker build  -f fprime/Dockerfile .
FROM ubuntu:20.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y \
	git \
	cmake \
	default-jre \
	python3 \
	python3-pip \
 && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade fprime-tools fprime-gds
COPY fprime /opt/fprime
RUN cd /opt/fprime/Ref/ && fprime-util generate && fprime-util build

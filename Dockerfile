FROM adoptopenjdk:11-jre-hotspot-focal

ENV TRACCAR_VERSION 5.6
ENV TZ=Asia/Shanghai
EXPOSE 8082
EXPOSE 5055
EXPOSE 5000-5150
EXPOSE 5000-5150/udp 

WORKDIR /opt/traccar

RUN set -ex && \
    apt-get update &&\
    TERM=xterm DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends unzip wget && \
    wget -qO /tmp/traccar.zip https://github.com/traccar/traccar/releases/download/v5.6/traccar-linux-64-5.6.zip && \
    unzip -qo /tmp/traccar.zip -d /opt/traccar && \
    apt-get autoremove --yes unzip wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

ENTRYPOINT ["/opt/traccar/traccar.run"]

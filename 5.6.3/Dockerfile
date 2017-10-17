FROM openjdk:8-jre-slim

LABEL maintainer "chhuang@gmail.com"

ENV LOGSTASH_VERSION=5.6.3 \
    LOGSTASH_SHA512=18e9ecf879f0583759977838ee94a3f03ea9655179fe0edea1fc05ef80aa7dd99ac7f63db2a2e01724b4db69a59070d5b1f52a8a316dcfc2fcce810a352daadb

RUN set -x && \
    apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    cd /opt && \
    wget https://artifacts.elastic.co/downloads/logstash/logstash-${LOGSTASH_VERSION}.tar.gz && \
    echo "${LOGSTASH_SHA512} logstash-${LOGSTASH_VERSION}.tar.gz" | sha512sum -c - && \
    tar xzvf "logstash-${LOGSTASH_VERSION}.tar.gz" && \
    ln -s logstash-${LOGSTASH_VERSION} logstash && \
    rm -rf /opt/logstash/config/* /opt/*.gz

COPY opt/logstash/config /opt/logstash/config
COPY /entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-f", "/opt/logstash/config"]

FROM openjdk:8-jre-slim

LABEL maintainer "chhuang@gmail.com"

ENV LOGSTASH_VERSION=5.5.2 \
    LOGSTASH_SHA1=2961489ccf8bef2bf9ae6c4eaaeeeb65b2ccd109

RUN set -x && \
    apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    cd /opt && \
    wget https://artifacts.elastic.co/downloads/logstash/logstash-${LOGSTASH_VERSION}.tar.gz && \
    echo "${LOGSTASH_SHA1} logstash-${LOGSTASH_VERSION}.tar.gz" | sha1sum -c - && \
    tar xzvf "logstash-${LOGSTASH_VERSION}.tar.gz" && \
    ln -s logstash-${LOGSTASH_VERSION} logstash && \
    rm -rf /opt/logstash/config/* /opt/*.gz

COPY opt/logstash/config /opt/logstash/config
COPY /entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-f", "/opt/logstash/config"]

FROM openjdk:8-jre-slim

LABEL maintainer "chhuang@gmail.com"

ENV LOGSTASH_VERSION=5.6.4 \
    LOGSTASH_SHA512=ec5540449fef1f6bb25313fc7d72f4c792480e26fa4529c3d35894c3de5b783cc24c40261f268658a8631687d7d7316a9b9c6ef9b69635c80a0fe4d5c542d4c5

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

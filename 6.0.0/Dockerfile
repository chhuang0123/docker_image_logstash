FROM openjdk:8-jre-slim

LABEL maintainer "chhuang@gmail.com"

ENV LOGSTASH_VERSION=6.0.0 \
    LOGSTASH_SHA512=0b35057a7308152de43927f06fbe0198c5c3135d9fa0dec1b48feeea084ecc04b3f6852c9c0239f6f854f5ea0a7a2cd33432a9faddbd6b523f2de336c8b21aaf

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

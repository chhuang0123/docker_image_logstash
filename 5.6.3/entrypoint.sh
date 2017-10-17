#!/bin/bash

set -e

LOGSTASH_BASE=/opt/logstash

if [ "${1:0:1}" = '-' ]; then
  set -- ${LOGSTASH_BASE}/bin/logstash  "$@"
fi

exec "$@"

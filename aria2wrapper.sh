#!/bin/sh

ARIA_OPTS="\
  --enable-rpc\
  --log=-\
  --log-level=notice\
  --quiet\
  --rpc-listen-all=true\
  --rpc-save-upload-metadata=false\
  "

[ -n "${ARIA_RPC_PORT}" ] && ARIA_OPTS="${ARIA_OPTS} --rpc-listen-port=${ARIA_RPC_PORT}"
[ -n "${ARIA_RPC_SECRET}" ] && ARIA_OPTS="${ARIA_OPTS} --rpc-secret=${ARIA_RPC_SECRET}"
[ -n "${ARIA_ENABLE_DHT}" ] && ARIA_OPTS="${ARIA_OPTS} --enable-dht=${ARIA_ENABLE_DHT}"
[ -n "${ARIA_MAX_CONCURRENT_DOWNLOADS}" ] && ARIA_OPTS="${ARIA_OPTS} --max-concurrent-downloads=${ARIA_MAX_CONCURRENT_DOWNLOADS}"

if [ -n "${ARIA_DIR}" ];
then
  ARIA_OPTS="${ARIA_OPTS} --dir=${ARIA_DIR}"
  mkdir -p "${ARIA_DIR}"
else
  echo "Need at least the ARIA_DIR" >&2
  exit 1
fi

aria2c ${ARIA_OPTS} $@


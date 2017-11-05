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
[ -n "${ARIA_DIR}" ] && ARIA_OPTS="${ARIA_OPTS} --dir=${ARIA_DIR}"
[ -n "${ARIA_ENABLE_DHT}" ] && ARIA_OPTS="${ARIA_OPTS} --enable-dht=${ARIA_ENABLE_DHT}"
[ -n "${ARIA_MAX_CONCURRENT_DOWNLOADS}" ] && ARIA_OPTS="${ARIA_OPTS} --max-concurrent-downloads=${ARIA_MAX_CONCURRENT_DOWNLOADS}"

aria2c ${ARIA_OPTS} $@


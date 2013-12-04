#!/bin/sh

set +e

BIN_DIR=$(cd $(dirname $0); pwd)
PIDFILE="$BIN_DIR/../pid"

if [ -f "$PIDFILE" ]; then
    kill $(cat "$PIDFILE") || exit 0
fi

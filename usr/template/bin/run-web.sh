#!/bin/sh
# Called like: run-web.sh -i IP -p PORT

set -e

BIN_DIR=$(cd $(dirname $0); pwd)

while getopts "i:p:" OPTION; do
    case $OPTION in
        i) IP="$OPTARG" ;;
        p) PORT="$OPTARG" ;;
    esac
done

if [[ -z $IP ]] || [[ -z $PORT ]]; then
    echo "IP and port arguments are required!"
    exit 1
fi

cd "$BIN_DIR/../www"
"$BIN_DIR/httpd.py" "$PORT" "$IP" &> "$BIN_DIR/../log" &

echo $! > "$BIN_DIR/../pid"

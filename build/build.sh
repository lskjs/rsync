#!/usr/bin/env bash
set -euo pipefail

command -v docker >/dev/null 2>&1 || {
    echo >&2 "This script requires the docker to be installed"
    exit 1
}

SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t lskjs/rsync:3.1 "$SCRIPT_ROOT/../3.1"
docker build -t lskjs/rsync:3.6 "$SCRIPT_ROOT/../3.6"
docker build -t lskjs/rsync:3.9 "$SCRIPT_ROOT/../3.9"
docker build -t lskjs/rsync:latest "$SCRIPT_ROOT/.."

docker rmi -f $(docker images -q --filter "dangling=true")
#! /usr/bin/env bash

if [[ "$OSTYPE" == *darwin* ]]; then
  READLINK_CMD='readlink'
else
  READLINK_CMD='readlink -f'
fi

dot="$(cd "$(dirname "$([ -L "$0" ] && $READLINK_CMD "$0" || echo "$0")")"; pwd)"

source $dot/radar-base.sh

fetch;

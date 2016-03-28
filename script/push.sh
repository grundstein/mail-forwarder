#!/bin/bash
#
# maintainer: Zhuohuan LI <zixia@zixia.net>
#

OWNER=${OWNER:-"zixia"}
NAME=${NAME:-"simple-mail-forwarder"}
IMAGE_NAME="$OWNER/$NAME"

TAG='' && [ -n "$1" ] && TAG=":$1" && shift

docker push "${IMAGE_NAME}${TAG}"

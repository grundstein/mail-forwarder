#!/bin/bash
#
# maintainer: Zhuohuan LI <zixia@zixia.net>
#

OWNER=${OWNER:-"zixia"}
NAME=${NAME:-"simple-mail-forwarder"}
IMAGE_NAME="$OWNER/$NAME"

[ -n "$1" ] || {
    echo ">> ERROR: Dev Shell must specify a TAG"
    exit 1
}

if [[ $1 =~ : ]]
then
    IMAGE_NAME=${1%%:*}
    TAG=":${1##*:}"
else
    TAG=":$1"
fi

shift # TAG

CMD="docker run --rm --name ${NAME} -it --entrypoint /bin/bash -v `pwd`:/app.out ${IMAGE_NAME}${TAG}"

echo $CMD && exec $CMD

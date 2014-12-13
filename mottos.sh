#!/usr/bin/env sh

function error {
    echo -n "$*" &>/dev/stderr
    exit 1
}

if ! which fortune &>/dev/null; then
    error "fortune not found"
fi

MOTTOS_DIR=~/.mottos
MOTTOS_SOURCE=${MOTTOS_DIR}/mottos
MOTTOS_OUTPUT=${MOTTOS_DIR}/mottos.dat

if [ ! -r ${MOTTOS_SOURCE} ]; then
    error "mottos source ( ${MOTTOS_SOURCE} ) not found"
fi

if [ ! -r ${MOTTOS_OUTPUT} \
    -o ${MOTTOS_SOURCE} -nt ${MOTTOS_OUTPUT} ]; then
    strfile -s ${MOTTOS_SOURCE} ${MOTTOS_OUTPUT}
fi

OPT=
if [ $# -gt 1 ]; then
    OPT="-n $1"
fi

MOTTOS_STRING=`fortune ${OPT} ${MOTTOS_SOURCE}`

if [ -z ${MOTTOS_STRING} ]; then
    error "fortune meets error"
else
    echo -n ${MOTTOS_STRING}
fi

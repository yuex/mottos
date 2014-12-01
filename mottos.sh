#!/usr/bin/env sh

ECHO="echo -n"

if ! which fortune &>/dev/null; then
    ${ECHO} "fortune not found"
    exit
fi

MOTTOS_DIR=~/.mottos
MOTTOS_SOURCE=${MOTTOS_DIR}/mottos
MOTTOS_OUTPUT=${MOTTOS_DIR}/mottos.dat

if [ ! -r ${MOTTOS_SOURCE} ]; then
    ${ECHO} "mottos source ${MOTTOS_SOURCE} not found"
    exit
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

${ECHO} ${MOTTOS_STRING:="fortune meets error"}

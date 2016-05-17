#!/bin/bash
DIR=`dirname $0`/
TRANSLATED=${DIR}/temp/
mkdir ${TRANSLATED}
# $1 contains the input filename (the name of the TLSF-file).
INPUT_FILE=$1
COMMAND="${DIR}binary/syfco -f acacia-specs -o ${TRANSLATED}${INPUT_FILE}.ltl -pf ${TRANSLATED}${INPUT_FILE}.part ${INPUT_FILE}"
echo "executing: " ${COMMAND}
$COMMAND
# we can now feed the files to acacia and determine if it is realizable or not
COMMAND="python ${DIR}binary/acacia_plus.py --ltl ${TRANSLATED}${INPUT_FILE}.ltl --part ${TRANSLATED}${INPUT_FILE}.part --player 1 --check REAL --syn COMP --nbw COMP"
res=$?
if [[ $res == 10 ]]; then
    echo "REALIZABLE"
else
    echo "UNREALIZABLE"
fi
exit $res

#!/bin/bash
DIR=`dirname $0`/
TRANSLATED=${DIR}temp/
mkdir ${TRANSLATED}
# $1 contains the input filename (the name of the TLSF-file).
# we need to call syfco to create the ltl and part files for acacia
INPUT_FILE=$1
BASE_FILE=(basename $INPUT_FILE)
COMMAND="${DIR}binary/syfco -f acacia-specs -o ${TRANSLATED}${BASE_FILE}.ltl -pf ${TRANSLATED}${BASE_FILE}.part ${INPUT_FILE}"
$COMMAND
# we can now feed the files to acacia and determine if it is realizable or not
COMMAND="python ${DIR}binary/acacia_plus.py --ltl ${TRANSLATED}${BASE_FILE}.ltl --part ${TRANSLATED}${BASE_FILE}.part --player 1 --check REAL --syn COMP --nbw COMP --v 0"
$COMMAND
res=$?
if [[ $res == 10 ]]; then
    echo "REALIZABLE"
else
    echo "UNREALIZABLE"
fi
exit $res

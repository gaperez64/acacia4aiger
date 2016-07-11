#!/bin/bash
DIR=`dirname $0`/
TRANSLATED=${DIR}temp/
mkdir -p ${TRANSLATED}
# $1 contains the input filename (the name of the TLSF-file).
# we need to call syfco to create the ltl and part files for acacia
INPUT_FILE=$1
BASE_FILE=$(basename $INPUT_FILE)
BASE_FILE_NOEXT="${BASE_FILE%.*}"
COMMAND="${DIR}binary/syfco -f acacia-specs -o ${TRANSLATED}${BASE_FILE}.ltl -pf ${TRANSLATED}${BASE_FILE}.part ${INPUT_FILE}"
$COMMAND
# we can now feed the files to acacia and determine if it is realizable or not
COMMAND="python ${DIR}binary/acacia_plus.py --ltl ${TRANSLATED}${BASE_FILE} --part ${TRANSLATED}${BASE_FILE}.part --player 1 --check REAL --syn COMP --nbw COMP --v 0 --kbound 5000 --kstep 1"
$COMMAND
res=$?
if [[ $res == 10 ]]; then
    #echo "REALIZABLE"
    COMMAND="${DIR}binary/acacia2aig.native ${TRANSLATED}${BASE_FILE_NOEXT}.txt"
    $COMMAND
elif [[ $res == 20 ]]; then
    echo "UNREALIZABLE"
elif [[ $res == 15 ]]; then
    echo "Acacia does not know :("
else
    echo "Strange exit code ${res}"
fi
exit $res

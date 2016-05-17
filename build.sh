#!/bin/bash
DIR=`dirname $0`
# create the binary folder
mkdir ${DIR}/binary
# Let us prepare the cooked up version of syfco first
cd ${DIR}/source/syfco
make
cd ../..
cp ${DIR}/source/syfco/syfco ${DIR}/binary/syfco
#
#cd ${DIR}/source
#tar -zxvf cudd-2.5.1.tar.gz
#cd cudd-2.5.1
#make objlib
#cd ..
#make
#cd ..
#mkdir ${DIR}binary
#cp ${DIR}source/abssynthe ${DIR}binary/abssynthe

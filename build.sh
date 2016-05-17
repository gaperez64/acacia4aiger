#!/bin/bash
DIR=`dirname $0`
# create the binary folder
mkdir ${DIR}/binary
# Let us prepare the cooked up version of syfco first
cd ${DIR}/source/syfco
make
cd ../..
cp ${DIR}/source/syfco/syfco ${DIR}/binary/syfco
# for acacia, we need a tools and lib subfolder in binary
mkdir ${DIR}/binary/lib
mkdir ${DIR}/binary/tools
mkdir ${DIR}/binary/tools/ltl2ba-1.1/
# Let us now prepare the acacia+ scripts and libraries
cd ${DIR}/source/acacia_plus
make install
cd ../..
cp ${DIR}/source/acacia_plus/*.py ${DIR}/binary/
cp ${DIR}/source/acacia_plus/lib/acacia_plus.so ${DIR}/binary/lib/acacia_plus.so
cp ${DIR}/source/acacia_plus/tools/ltl2ba-1.1/ltl2ba ${DIR}/binary/tools/ltl2ba-1.1/ltl2ba
# Finally, we prepare the Speculoos lib and deps
cd ${DIR}/source/ocaml-aiger 
make
cd ../..
cd ${DIR}/source/ocaml-cudd
/bin/bash install_cudd.sh
make
cd ../..
cd ${DIR}/source/Speculoos
make acacia2aig.native
cd ../..
cp ${DIR}/source/Speculoos/acacia2aig.native ${DIR}/binary/acacia2aig.native

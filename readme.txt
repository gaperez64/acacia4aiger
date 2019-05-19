Acacia 4 Aiger - is a framework which prepares TLSF input for the 
LTL synthesis tool Acacia+ and processes its output to, when possible,
generate an AIGER circuit satisfying the TLSF specification.

Authors = Romain Brenguier, Ocan Sankur, Guillermo A. Perez, Jean-Francois Raskin
Insitute = Universite Libre de Bruxelles
Version = 1.1

Some dependencies (and overview of the framework):
The tool uses a modified version of the syfco tool provided by the SYNTCOMP
organizing team (https://github.com/reactive-systems/syfco). More specifically,
syfco has been modified to generate spec unit annotations in the LTL
specification it generates from the original TLSF input. The latter greatly
increases the capability of Acacia (and, internally, of ltl2ba) to deal with big
specifications. Acacia+ is also included as part of the framework, together
with its dependencies. Finally, in order to transform Acacia+ explicit Mealy
machine output format into AIGER, an OCaml script using the Speculoos tools
(https://github.com/romainbrenguier/Speculoos) is used. This last script depends
on ocaml-cudd and ocaml-aiger.

Acacia4aiger also uses the python-graph library
(https://github.com/Shoobx/python-graph) which is included for convenience.

Note:
You will have to install some python and OCaml things before you can set up
the Acacia 4 Aiger framework. To work with Acacia+ you need to the Speculoos
library. For that, you will need OCaml and OCamlbuild. You can, for instance,
run the following in ubuntu or debian

apt-get install ocaml
apt-get install ocamlbuild

GIT-related note:
If you cloned the source from github, be advised that you should update
the submodules as well. It would be good to execute

git pull && git submodule init && git submodule update

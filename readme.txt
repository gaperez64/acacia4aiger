Acacia 4 Aiger - is a framework which prepares TLSF input for the 
LTL synthesis tool Acacia+ and processes its output to, when possible,
generate an AIGER circuit satisfying the TLSF specification.

Authors = Romain Brenguier, Ocan Sankur, Guillermo A. Perez, Jean-Francois Raskin
Insitute = Universite Libre de Bruxelles
Version = 1.0

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

Note:
You will have to install some python and OCaml things before you can set up the
Acacia 4 Aiger framework. First of all, to work with Acacia+ you need to

1) Install pygraph 1.8.0 or higher
	python-graph is a library for working with graphs in Python. It 
	provides a suitable data structure for representing graphs and a 
	whole set of important algorithms.
	python-graph is available at http://code.google.com/p/python-graph/. 
	The dot module is not required to use Acacia+.
	You can install it using easy_install:
		> easy_install python-graph-core

2) Install pygraphviz 1.1 or higher
	PyGraphviz is a Python interface to the Graphviz graph layout and 
	visualization package.
	It is used by Acacia+ to write strategies in DOT and PNG.
	PyGraphviz is available at http://networkx.lanl.gov/pygraphviz/.
	You can install it using easy_install:
		> easy_install pygraphviz

also, for the Speculoos library you will need OCaml and OCamlbuild. You can, for
instance, run the following in ubuntu or debian

apt-get install ocaml
apt-get install ocamlbuild

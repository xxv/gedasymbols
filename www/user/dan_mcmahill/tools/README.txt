
run

mkdir symbols
./make_syms components.txt

and the short awk program will take the symbol templates in symbol_templates/
and produce heavy parts that have the correct footprint and pinout for that package
for all the parts defined in components.txt.

I could easily envision having more hidden attributes that control how the 
heavy symbols each netlist for spice or gnucap or whatever else too.  Seems like
a good way to build up a large library which is more foolproof.  I for one don't
want to have to check that the symbol pinout for an npn matches the pinout of
a SOT-23 everytime I use a particular transistor.


The script is covered by the GPL, version 2.  The symbols are GPL for distribution,
unlimited use.

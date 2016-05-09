data a1;
set sas.gnsczzgcs;
proc gplot data=a1;
plot x2*date x3*date x6*date/overlay;
symbol1 v=dot i=join c=black l=1 w=2 pointlabel;
symbol2 v=plus i=join c=black l=2 w=3 pointlabel;
symbol3 v=star i=join c=black l=3 w=3 pointlabel;
run;

%let d1=sas.gnsczzgcs;
%let plot
=%str(proc gplot;
plot x2*date;
symbol v=dot i=join c=black;
run;);

data a1;
set &d1;
if x2<30;
run;
proc print; 
&plot;
run;



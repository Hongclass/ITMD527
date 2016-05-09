%let d1=sas.gnsczzgc2;
%let c1=x3;

%macro plot;
proc gplot;
plot &c1*date=c/cframe=black;
symbol1 v=dot i=none c=white;
symbol2 v=square i=none c=white;
symbol3 v=triangle i=none c=white;
run;
%mend;

data a1;
set &d1;
run;
%plot

data a2;
set &d1;
if &c1>44;
run;
%plot

data a3;
set &d1;
if c=1 or c=3;
run;
%plot

:



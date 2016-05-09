%let d1=sas.gnsczzgcs;

data f1;
set &d1;
if x2<30 & x3>25 & x6>23;
run;
proc print;
run;



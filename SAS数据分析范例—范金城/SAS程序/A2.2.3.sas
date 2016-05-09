%let d1=sas.gnsczzgc2;
%let c1=x3;

%macro print;
proc print;
run;
%mend;


data a1;
set &d1;
if c=2;
run;
%print

data a2;
set &d1;
if &c1>30 & c=1;
run;
%print

data a3;
set &d1;
proc sort data=a3 out=out;
by &c1;
run;
%print

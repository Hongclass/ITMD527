%let d1=sas.dqnlmy2;
%let c1=x1 x2 x3 x4 x5;
%let i1=d;

data f1;
set &d1;
if c=3 & x3>35;
run;
proc print;
var &c1;
id &i1;
run;

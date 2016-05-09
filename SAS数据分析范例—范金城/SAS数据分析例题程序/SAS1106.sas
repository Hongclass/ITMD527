%let d1=fjc.c7d31;
%let c1=x;
%let lag1=48;



%macro model;
%do i=1 %to 1;
data f&i;
set &&d&i;
run;
title "y=&&d&i lag=&&lag&i";
proc model data=f&i;
endo &&c&i;
exo date;
&&c&i=a0+a1*date;
fit &&c&i/fiml outs=s outest=r;
%ar(&&c&i,&&lag&i);
solve satisfy=&&c&i/static out=out1 sdata=s estdata=r random=100 seed=123;
id date;
run;
proc sort data=out1;
by date;
run;
proc univariate data=out1 noprint;
var &&c&i;
by date;
output out=out2 mean=for std=std p95=p95 p5=p5;
run;
data b&i;
merge f&i out2;
res=&&c&i-for;
run;
proc print data=b&i(keep=date &&c&i for p95 p5 res);
run;
proc gplot data=b&i;
plot &&c&i*date=1 for*date=2 p95*date=3 p5*date=3 /overlay cframe=pink;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
run;
proc gplot data=b&i;
plot res*date/cframe=yellow;
symbol v=dot i=needle c=blue;
run;
%end;
%mend;



%model;







                 

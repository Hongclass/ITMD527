%let d1=fjc.dqnlmy1;
%let d2=fjc.dqnlmy1;
%let d3=fjc.dqnlmy1;
%let d4=fjc.dqnlmy1;
%let d5=fjc.dqnlmy1;
%let c1=x1;
%let c2=x2;
%let c3=x3;
%let c4=x4;
%let c5=x5;
%let lag1=5;
%let lag2=5;
%let lag3=10;
%let lag4=5;
%let lag5=8;
%let b1=x2 x3 x4 x5;
%let b2=x1 x3 x4 x5;
%let b3=x1 x2 x4 x5;
%let b4=x1 x2 x3 x5;
%let b5=x1 x2 x3 x4;



%macro model;
%do i=1 %to 1;
data f&i;
set &&d&i;
t=_n_; 
run;
title "&&d&i y=&&c&i lag=&&lag&i";
proc model data=f&i;
endo &&c&i;
exo t &&b&i;
x1=c0+c2*x2+c3*x3+c4*x4+c5*x5+g1*t;
x2=b0+b1*x1+b3*x3+b4*x4+b5*x5+h1*t;
x3=d0+d1*x1+d2*x2+d4*x4+d5*x5+k1*t;
x4=a0+a1*x1+a2*x2+a3*x3+a5*x5+l1*t;
x5=e0+e1*x1+e2*x2+e3*x3+e4*x4+m1*t;
fit &&c&i/fiml outs=s outest=r;
%ar(&&c&i,&&lag&i);
solve satisfy=&&c&i /static out=out1 sdata=s estdata=r random=100 seed=123;
id t;
run;
proc sort data=out1;
by t;
run;
proc univariate data=out1 noprint;
var &&c&i;
by t;
output out=out2 mean=for std=std p95=p95 p5=p5;
run;
data b&i;
merge f&i out2;
res=&&c&i-for;
run;
proc print data=b&i(keep=d &&c&i for p95 p5 res);
run;
proc gplot data=b&i;
plot d*&&c&i=1 d*for=2 d*p95=3 d*p5=3 /overlay cframe=pink;
symbol1 v=dot i=none c=red pointlabel;
symbol2 v=star i=none c=green;
symbol3 v=point i=none c=blue;
run;proc gplot data=b&i;
plot res*t/cframe=yellow;
symbol v=dot i=needle c=blue;
run;
%end;
%mend;



%model;







                 

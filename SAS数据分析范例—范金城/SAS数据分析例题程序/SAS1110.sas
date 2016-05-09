%let d1=fjc.zyncpcl1s;
%let d2=fjc.zyncpcl1s;
%let d3=fjc.zyncpcl1s;
%let d4=fjc.zyncpcl1s;
%let d5=fjc.zyncpcl1s;
%let d6=fjc.zyncpcl1s;
%let c1=x1;
%let c2=x2;
%let c3=x3;
%let c4=x4;
%let c5=x5;
%let c6=x6;
%let lag1=3;
%let lag2=3;
%let lag3=3;
%let lag4=3;
%let lag5=3;
%let lag6=3;
%let b1=x2 x3 x4 x5 x6 x7 x8;
%let b2=x1 x3 x4 x5 x6 x7 x8;
%let b3=x1 x2 x4 x5 x6 x7 x8;
%let b4=x1 x2 x3 x5 x6 x7 x8;
%let b5=x1 x2 x3 x4 x6 x7 x8;
%let b6=x1 x2 x3 x4 x5 x7 x8;



%macro model;
%do i=1 %to 6;
data f&i;
set &&d&i; 
run;
title "&&d&i y=&&c&i lag=&&lag&i";
proc model data=f&i;
endo &&c&i;
exo date &&b&i;
x1=c0+c2*x2+c3*x3+c4*x4+c5*x5+c6*x6+c7*x7+c8*x8+g1*date;
x2=b0+b1*x1+b3*x3+b4*x4+b5*x5+b6*x6+b7*x7+b8*x8+h1*date;
x3=d0+d1*x1+d2*x2+d4*x4+d5*x5+d6*x6+d7*x7+d8*x8+k1*date;
x4=a0+a1*x1+a2*x2+a3*x3+a5*x5+a6*x6+a7*x7+a8*x8+l1*date;
x5=e0+e1*x1+e2*x2+e3*x3+e4*x4+e6*x6+e7*x7+e8*x8+m1*date;
x6=f0+f1*x1+f2*x2+f3*x3+f4*x4+f5*x5+f7*x7+f8*x8+n1*date;
fit &&c&i/fiml outs=s outest=r;
%ar(&&c&i,&&lag&i);
solve satisfy=&&c&i /static out=out1 sdata=s estdata=r random=100 seed=123;
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
run;proc gplot data=b&i;
plot res*date/cframe=yellow;
symbol v=dot i=needle c=blue;
run;
%end;
%mend;



%model;







                 

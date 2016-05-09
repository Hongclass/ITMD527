%let d1=fjc.sczzs;
%let d2=fjc.sczzs;
%let d3=fjc.sczzs;
%let c1=x1;
%let c2=x2;
%let c3=x3;
%let lag1=15;
%let lag2=15;
%let lag3=15;
%let b1=x2 x3;
%let b2=x1 x3;
%let b3=x1 x2;




%macro model;
%do i=1 %to 3;
data f&i;
set &&d&i; 
run;
title "&&d&i y=&&c&i lag=&&lag&i";
proc model data=f&i;
endo &&c&i;
exo date &&b&i;
x1=c0+c1*date+c2*x2+c3*x3+c22*x2**2+c23*x2*x3+c33*x3**2;
x2=b0+b1*date+b2*x1+b3*x3+b11*x1**2+b13*x1*x3+b33*x3**2;
x3=d0*d1*date+d2*x1+d3*x2+d11*x1**2+d12*x1*x2+d22*x2**2;
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







                 

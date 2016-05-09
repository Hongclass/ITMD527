%let d1=fjc.sanmao;
%let d2=fjc.sanmao0;
%let lag1=70;
%let lag2=30;

%macro model;
%do i=1 %to 2;
proc model data=&&d&i;
endog y;
parms c1 c2 p1 p2 p4 p11 p12 p22 q1 q2 q3 q11 q12;
if zlag3(y)<=2.95 then
y=c1+p1*zlag1(y)+p2*zlag2(y)+p4*zlag4(y)+p11*zlag1(y)*zlag1(y)
+p12*zlag1(y)*zlag2(y)+p22*zlag2(y)*zlag2(y);
if zlag3(y)>2.95 then
y=c2+q1*zlag1(y)+q2*zlag2(y)+q3*zlag3(y)+q11*zlag1(y)*zlag1(y)
+q12*zlag1(y)*zlag2(y);
fit y/fiml outs=s outest=r;
%ar(y,&&lag&i);
solve satisfy=y/static out=out1
sdata=s estdata=r random=500 seed=1239;
id date;
run;
proc sort data=out1;
by date;
run;
proc univariate data=out1 noprint;
var y;
by date;
output out=m0 mean=fory p5=p5y p95=p95y std=std;
run;
data sanmaos;
merge m0 &&d&i;
residy=y-fory;
forx=10**fory-3;
p95x=10**p95y-3;
p5x=10**p5y-3;
residx=x-forx;
run;
proc print data=sanmaos(drop=_obstat_);
run;
data m1;
set sanmaos;
run;
proc gplot data=m1;
plot y*date=1 fory*date=2 p5y*date=3 p95y*date=3 /overlay cframe=pink;
plot x*date=1 forx*date=2 p5x*date=3 p95x*date=3 /overlay cframe=yellow;
symbol1 i=spline v=dot c=red;
symbol2 i=spline v=star c=blue;
symbol3 i=spline v=diamond c=green;
run;
%end;
%mend;

%model;

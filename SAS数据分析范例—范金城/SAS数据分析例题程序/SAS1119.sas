%let d1=fjc.tyxz0;
%let lag1=10;

%macro model;
%do i=1 %to 1;
proc model data=&&d&i;
endog y;
parms p0 p1-p10 p11 p12 p22 q0 q1-q9 q11 q12;
if zlag9(y)<=7.1 then
y=p0+p1*zlag1(y)+p2*zlag2(y)+p3*zlag3(y)+p4*zlag4(y)+p5*zlag5(y)+p6*zlag6(y)
+p7*zlag7(y)+p8*zlag8(y)+p9*zlag9(y)+p10*zlag10(y)+p11*zlag1(y)*zlag1(y)
+p12*zlag1(y)*zlag2(y)+p22*zlag2(y)*zlag2(y);
if zlag9(y)>7.1 then
y=q0+q1*zlag1(y)+q2*zlag2(y)+q3*zlag3(y)+q4*zlag4(y)+q5*zlag5(y)+q6*zlag6(y)
+q7*zlag7(y)+q8*zlag8(y)+q9*zlag9(y)+q11*zlag1(y)*zlag1(y)+q12*zlag1(y)*zlag2(y);
fit y/fiml outs=s0 outest=r0;
%ar(y,&&lag&i);
solve satisfy=y/static out=out1 sdata=s0 estdata=r0 random=100 seed=3864;
id date;
run;
proc sort data=out1;
by date;
run;
proc sort data=out1;
by date;
run;
proc univariate data=out1 noprint;
var y;
by date;
output out=m0 mean=fory p5=p5y p95=p95y std=std;
run;
data tyxzs;
merge m0 &&d&i;
residy=y-fory;
forx=fory**2-1.9;
p95x=p95y**2-1.9;
p5x=p5y**2-1.9;
residx=x-forx;
run;
proc print data=tyxzs;
run;
proc gplot data=tyxzs;
plot y*date=1 fory*date=2 p5y*date=3 p95y*date=3 /overlay cframe=pink;
plot x*date=1 forx*date=2 p5x*date=3 p95x*date=3 /overlay cframe=yellow;
symbol1 i=spline v=dot c=red;
symbol2 i=spline v=star c=blue;
symbol3 i=spline v=diamond c=green;
run;
%end;
%mend;

%model;

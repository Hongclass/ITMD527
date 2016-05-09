%let d1=fjc.meiqi;
%let d2=fjc.meiqi;
%let c1=y;
%let c2=x;
%let b1=x;
%let b2=y;



%macro model;
%do i=1 %to 2;
%do nlag=20 %to 40 %by 10;
title "model &&d&i u=&&c&i nlag=&nlag";
proc model data=&&d&i;
endog &&c&i;
exog t &&b&i;
&&c&i=a0+p1*zlag1(&&c&i)+p2*zlag2(&&c&i)+p3*zlag3(&&c&i)
+p12*zlag12(&&c&i)+p24*zlag24(&&c&i)+q11*zlag1(&&c&i)**2+q12*zlag1(&&c&i)*zlag12(&&c&i)+q22*zlag12(&&c&i)**2
+s1*zlag1(&&b&i)+s2*zlag2(&&b&i)+s3*zlag3(&&b&i)+s12*zlag12(&&b&i)+s24*zlag24(&&b&i)
+t11*zlag1(&&b&i)**2;
fit &&c&i/fiml outs=s outest=r;
%ar(&&c&i,&nlag);
solve satisfy=&&c&i/static out=u1 sdata=s estdata=r random=100 seed=123;
id t;
run;
proc sort data=u1;
by t;
run;
proc univariate data=u1 noprint;
var &&c&i;
by t;
output out=u2 mean=for p95=p95 p5=p5 std=std;
run;
data c;
merge &&d&i u2;
res=&&c&i-for;
run;
proc print data=c(keep=&&c&i for p95 p5 std res);
run;
proc gplot data=c;
plot &&c&i*t=1 for*t=2 p95*t=3 p5*t=3/overlay cframe=pink;
plot res*t=4/cframe=yellow;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
symbol4 i=needle width=2 c=blue;
run;
%end;
%end;
%mend;

%model;




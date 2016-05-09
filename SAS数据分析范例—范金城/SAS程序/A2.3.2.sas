%let d1=sas.gnsczzgc2;
%let d2=sas.dqnlmy2;
%let c1=x2;
%let c2=x3;
%let i1=date;
%let i2=d;

%macro plot(d,c,i);
proc gplot data=&d;
plot &i*&c=c/cframe=black;
symbol1 v=dot i=none c=white;
symbol2 v=square i=none c=white;
symbol3 v=triangle i=none c=white;
run;
%mend;

%plot(&d1,&c1,&i1)

%plot(&d2,&c2,&i2)

data a1;
set &d1;
if c=2;
run;
%plot(a1,&c1,&i1)

data a2;
set &d2;
if c=3;
run;
%plot(a2,&c2,&i2)


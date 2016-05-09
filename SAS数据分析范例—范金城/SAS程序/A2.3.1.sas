%let d1=sas.gnsczzgc2;
%let c1=date x2 x3 x6 c;
%let d2=sas.dqnlmy2(drop=y1 y2 y3 y4 y5);
%let c2=d x1 x2 x3 c;

%macro print(d,c);
proc print data=&d;
var &c;
run;
%mend;

%print(&d1,&c1)

%print(&d2,&c2)

data a1;
set &d1;
if c=2;
run;
%print(a1,&c1)

data a2;
set &d2;
if c=2 & x2<30;
run;
%print(a2,&c2)


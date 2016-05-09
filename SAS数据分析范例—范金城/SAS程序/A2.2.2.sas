%let d1=sas.dqnlmy2;
%let d2=sas.gnsczzgc2;
%let c1=x3;
%let c2=x2;
%let i1=d;
%let i2=date;

%macro plot;
data a1;
set &d1;
if c=3;
run;
proc gplot data=a1;
plot &i1*&c1=c;
symbol1 v=dot i=none c=black pointlabel;
symbol2 v=dot i=none c=ligr pointlabel;
symbol3 v=dot i=none c=grey pointlabel;
run;
data a2;
set &d2;
if &c2<30;
run;
proc gplot data=a2;
plot &i2*&c2=c;
symbol1 v=dot i=none c=black pointlabel;
symbol2 v=dot i=none c=ligr pointlabel;
symbol3 v=dot i=none c=grey pointlabel;
run;
%mend;

%plot




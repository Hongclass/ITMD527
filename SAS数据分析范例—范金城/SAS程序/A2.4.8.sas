%let d1=sas.dqnlmy2;
%let d2=sas.gnsczzgc2;
%let c1=x3;
%let c2=x2;
%let i1=d;
%let i2=date;

%macro plot(c);
%do i=1 %to 2;
data a&i;
set &&d&i;
if &&c&i<&c;
run;
proc gplot data=a&i;
plot &&i&i*&&c&i=c/cframe=ligr;
symbol1 v=dot i=none c=white pointlabel;
symbol2 v=square i=none c=white pointlabel;
symbol3 v=triangle i=none c=white pointlabel;
title "&&d&i &&c&i<&c";
run;
%end;
%mend;

%plot(20)
%plot(30)
%plot(40)
%plot(50)



%let d1=sas.nlmyzzs;
%let d2=sas.nlmyzzs;
%let d3=sas.nlmyzzs;
%let d4=sas.nlmyzzs;
%let d5=sas.nlmyzzs;
%let y1=x1;
%let y2=x2;
%let y3=x3;
%let y4=x4;
%let y5=x5;
%let x1=x2 x3 x4 x5;
%let x2=x1 x3 x4 x5;
%let x3=x1 x2 x4 x5;
%let x4=x1 x2 x3 x5;
%let x5=x1 x2 x3 x4;

%macro rsreg;
%do i=1 %to 5;
title "&&d&i y=&&y&i x=&&x&i";
proc rsreg data=&&d&i out=a&i;
model &&y&i=&&x&i/actual predict l95 u95; 
id date;
proc print data=a&i;
run;
symbol1 v=dot i=none c=black;
symbol3 v=star i=join c=black;
symbol2 v=none i=join c=black;
symbol4 v=none i=join c=black;
proc gplot data=a&i;
plot &&y&i*date=_type_/cframe=ligr;
run;
%end;
%mend;

%rsreg;



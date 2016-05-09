%let d1=sas.xucps;
%let d2=sas.xucps;
%let d3=sas.xucps;
%let d4=sas.xucps;
%let d5=sas.xucps;
%let d6=sas.xucps;
%let d7=sas.xucps;
%let c1=x1;
%let c2=x2;
%let c3=x3;
%let c4=x4;
%let c5=x5;
%let c6=x6;
%let c7=x7;
%let b1=x2 x3 x4 x5 x6 x7;
%let b2=x1 x3 x4 x5 x6 x7;
%let b3=x1 x2 x4 x5 x6 x7;
%let b4=x1 x2 x3 x5 x6 x7;
%let b5=x1 x2 x3 x4 x6 x7;
%let b6=x1 x2 x3 x4 x5 x7;
%let b7=x1 x2 x3 x4 x5 x6;

%macro reg(selection);
%do i=1 %to 7;
data f&i;
set &&d&i;
run;
title "&&d&i y=&&c&i selection=&selection";
proc reg data=f&i;
model &&c&i=&&b&i/ selection=&selection;
output out=a&i p=p r=r student=student l95=l95 u95=u95 l95m=l95m
u95m=u95m cookd=cookd h=h press=press dffits=dffits;
proc gplot data=a&i;
symbol1 v=dot c=black;
symbol1 v=dot c=black;
symbol2 v=star c=black i=join;
symbol3 v=none c=black i=join;
plot &&c&i*date=1 p*date=2 l95*date=3 u95*date=3/overlay cframe=ligr;
proc print data=a&i(keep=date &&c&i p l95 u95);
%end;
run;
%mend;


%reg(stepwise);
%reg(forward);
%reg(backward);





%let d1=fjc.ms4d2s;
%let d2=fjc.ms4d2s;
%let y1=y1;
%let y2=y2;
%let x1=x1 x2 x3 x4 x5;
%let x2=x1 x2 x3 x4 x5;

%macro reg(selection);
%do i=1 %to 2;
data f&i;
set &&d&i;
t=_n_;
run;
title "&&d&i y=&&y&i selection=&selection";
proc reg data=f&i;
model &&y&i=&&x&i/ selection=&selection;
output out=a&i p=p r=r student=student l95=l95 u95=u95 l95m=l95m
u95m=u95m cookd=cookd h=h press=press dffits=dffits;
proc gplot data=a&i;
symbol1 v=dot c=red;
symbol2 v=star c=blue i=join;
symbol3 v=none c=blue i=join;
plot &&y&i*t=1 p*t=2 l95*t=3 u95*t=3/cframe=yellow overlay;
plot &&y&i*date=1 p*date=2 l95*date=3 u95*date=3/cframe=pink overlay;
proc print data=a&i(keep=&&y&i year p l95 u95);
run;
%end;
%mend;

%reg(forward);
%reg(backward);
%reg(stepwise);





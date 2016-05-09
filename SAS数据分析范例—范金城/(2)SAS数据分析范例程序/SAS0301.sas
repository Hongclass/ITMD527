%let d1=fjc.sczz;
%let d2=fjc.sczz;
%let d3=fjc.sczz;
%let d4=fjc.sczz;
%let y1=x3;
%let y2=x2;
%let y3=x1;
%let y4=x1;
%let x1=x1 x2;
%let x2=x1 x3;
%let x3=x2 x3;
%let x4=x2 x3 x;


%macro reg1;
%do i=1 %to 4;
data f&i;
set &&d&i;
run;
title "&&d&i y=&&y&i x=&&x&i";
proc reg data=f&i;
model &&y&i=&&x&i/ corrb covb;
output out=a&i p=p r=r student=student l95=l95 u95=u95;
proc gplot data=a&i;
symbol1 v=dot c=red;
symbol2 v=star c=blue;
symbol3 v=none c=blue i=spline;
plot &&y&i*t=1 p*t=2 l95*t=3 u95*t=3/cframe=yellow overlay;
proc gplot data=a&i;
plot &&y&i*t=1 p*t=2 l95*t=3 u95*t=3/cframe=pink overlay;
symbol1 v='1' c=red i=none;
symbol2 v='2' c=blue;
symbol3 v=none c=blue i=spline;
proc print data=a&i(keep=t &&y&i p u95 l95);
%end;
run;
%mend;

%reg1;





%let d1=fjc.nlmyzzs;
%let d2=fjc.nlmyzzs;
%let y1=x1;
%let x1=x2-x5;
%let y2=x1;
%let x2=x2 x4;
%let z1=x2;
%let z2=x4;


%macro reg1;
%do i=1 %to 2;
data f&i;
set &&d&i;
run;
title "&&d&i y=&&y&i x=&&x&i";
proc reg data=f&i;
model &&y&i=&&x&i;
output out=a&i p=p r=r student=student l95=l95 u95=u95;
proc gplot data=a&i;
symbol1 v=dot c=red;
symbol2 v=star c=blue;
symbol3 v=none c=blue i=spline;
plot &&y&i*date=1 p*date=2 l95*date=3 u95*date=3/cframe=yellow overlay;
proc gplot data=a&i;
plot &&y&i*date=1 p*date=2l95*date=3 u95*date=3/cframe=pink overlay;
symbol1 v='1' c=red i=none;
symbol2 v='2' c=blue;
symbol3 v=none c=blue i=spline;
proc print data=a&i(keep=date &&y&i p l95 u95);
%end;
run;
%mend;

%reg1;





%let d1=sas.sczz;
%let d2=sas.sczz;
%let d3=sas.sczz;
%let d4=sas.sczz;
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
plot &&y&i*t=1 p*t=2 l95*t=3 u95*t=3/overlay cframe=grey;
symbol1 v='1' c=white font=Italic i=none;
symbol2 v='2' c=white font=Italic i=none;
symbol3 v=none c=white i=spline;
proc print data=a&i(keep=t &&y&i p u95 l95);
%end;
run;
%mend;

%reg1;


                      




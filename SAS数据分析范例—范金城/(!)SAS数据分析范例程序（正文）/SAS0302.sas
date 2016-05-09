%let d1=sas.zyncpcl1s;
%let d2=sas.zyncpcl2;
%let d3=sas.zyncpcl3;
%let y1=x1;
%let x1=x2-x8;
%let y2=x1;
%let x2=x2-x8;
%let y3=x1;
%let x3=x2-x11;
%let z1=x2;
%let z2=x3;
%let z3=x4;


%macro reg1;
%do i=1 %to 3;
data f&i;
set &&d&i;
run;
title "&&d&i y=&&y&i x=&&x&i";
proc reg data=f&i;
model &&y&i=&&x&i/ corrb covb;
output out=a&i p=p r=r student=student l95=l95 u95=u95;
proc gplot data=a&i;
plot &&y&i*date=1 p*date=2 l95*date=3 u95*date=3/overlay cframe=grey;
symbol1 v='1' c=white font=Italic i=none;
symbol2 v='2' c=white font=Italic i=none;
symbol3 v=none c=white i=spline;
proc print data=a&i(keep=t &&y&i p u95 l95);
%end;
run;
%mend;

%reg1;

                                  


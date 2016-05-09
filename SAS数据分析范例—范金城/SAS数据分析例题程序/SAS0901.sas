%let d1=fjc.sczz;
%let d2=fjc.sczz;
%let d3=fjc.sczz;
%let c1=x1(1);
%let c2=x2(1);
%let c3=x3(1);
%let b1=x1;
%let b2=x2;
%let b3=x3;

%macro arima(method,cframe);
%do i=1 %to 3;
data f&i;
set &&d&i;
run;
%do p=8 %to 8;
%do q=3 %to 3;
proc arima data=f&i;
title "arima &&d&i var=&&c&i p=&p q=&q method=&method cframe=&cframe";
identify var=&&c&i nlag=24 noprint;
estimate p=&p q=&q method=&method plot;
forecast out=out lead=10;
run;
data g&i;
set out;
t=1951+_n_;
run;
proc gplot data=g&i;
plot &&b&i*t=1 forecast*t=2 l95*t=3 u95*t=3 /overlay cframe=&cframe;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
run;
%end;
%end;
%end;
%mend;

%arima(ml,yellow);




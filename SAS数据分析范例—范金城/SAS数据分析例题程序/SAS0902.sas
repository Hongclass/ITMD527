%let d1=fjc.sczzgc1;
%let d2=fjc.sczzgc1;
%let d3=fjc.sczzgc1;
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
%do p=10 %to 16;
%do q=2  %to 6;
proc arima data=f&i;
title "arima &&d&i var=&&c&i  method=&method p=&p q=&q cframe=&cframe";
identify var=&&c&i nlag=24 noprint;
estimate p=&p q=&q method=&method plot;
forecast out=out lead=10;
run;
data g&i;
merge &&d&i out;
run;
proc gplot data=g&i;
plot &&b&i*date=1 forecast*date=2 l95*date=3 u95*date=3 /overlay cframe=&cframe;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
run;
%end;
%end;
%end;
%mend;


%arima(cls,pink);




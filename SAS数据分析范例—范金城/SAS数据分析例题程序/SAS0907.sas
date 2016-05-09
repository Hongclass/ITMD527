%let d1=fjc.seriesj;
%let d2=fjc.seriesj;
%let c1=x(1);
%let c2=y(1);
%let b1=x;
%let b2=y;
%let a1=y;
%let a2=x;
%let p1=20;
%let p2=30;
%let q1=6;
%let q2=8;



%macro arima(method,cframe);
%do i=1 %to 2;
data f&i;
set &&d&i;
run;
%let k=1;
%let n=%scan(&&p&i,&k);
%do %while(&n ne);
proc arima data=f&i;
title "var=&&c&i p=&n q=&&q&i cross=(&&a&i) method=&method";
identify var=&&c&i nlag=24 crosscorr=(&&a&i);
estimate p=&n q=&&q&i method=&method plot;
forecast out=out lead=24;
run;
data g&i;
merge f&i out;
t=_n_;
run;
proc print data=g&i(keep=t &&b&i forecast l95 u95 residual);
run;
proc gplot data=g&i;
plot &&b&i*t=1 forecast*t=2 l95*t=3 u95*t=3 /overlay cframe=&cframe;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
run;
 %let k=%eval(&k+1);
 %let n=%scan(&&p&i,&k);
%end;
%end;
%mend;

%arima(ml,yellow);
%arima(cls,pink);
%arima(uls,orange);






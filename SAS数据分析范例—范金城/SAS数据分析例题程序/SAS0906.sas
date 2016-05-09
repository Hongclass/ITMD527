%let d1=fjc.spls0;
%let d2=fjc.spls0;
%let c1=x(12);
%let c2=x(1,12);
%let b1=x;
%let b2=x;
%let p1=5 6 8 11;
%let p2=6 7 9 12;
%let q1=(12);
%let q2=(1,12);



%macro arima(method,cframe);
%do i=1 %to 2;
data f&i;
set &&d&i;
run;
%let k=1;
%let n=%scan(&&p&i,&k);
%do %while(&n ne);
proc arima data=f&i;
title "arima &&d&i var=&&c&i p=&n q=&&q&i method=&method cframe=&cframe";
identify var=&&c&i nlag=24;
estimate p=&n q=&&q&i method=&method plot;
forecast out=out lead=24;
run;
data g&i;
merge &&d&i out;
t=_n_;
run;
proc gplot data=g&i;
plot &&b&i*date=1 forecast*date=2 l95*date=3 u95*date=3 /overlay cframe=&cframe;
plot &&b&i*t=1 forecast*t=2 l95*t=3 u95*t=3 /overlay cframe=&cframe;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
run;
proc print data=g&i(drop=_obstat_);
run;
 %let k=%eval(&k+1);
 %let n=%scan(&&p&i,&k);
%end;
%end;
%mend;


%arima(cls,yellow);




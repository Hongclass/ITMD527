%let d1=fjc.rjsrs;
%let d2=fjc.rjsrs;
%let c1=c1(1);
%let c2=c2(1);
%let b1=c1;
%let b2=c2;
%let a1=x1 x2 y1 y2 c2;
%let a2=x1 x2 y1 y2 c1;
%let p1=3 5 7;
%let p2=4 6 8;
%let q1=2;
%let q2=3;
%let t1=year;
%let t2=year;



%macro arima(method,cframe);
%do i=1 %to 2;
data f&i;
set &&d&i;
run;
%let k=1;
%let n=%scan(&&p&i,&k);
%do %while(&n ne);
proc arima data=f&i;
title "var=&&c&i p=&n q=&&q&i method=&method crosscorr=(&&a&i)";
identify var=&&c&i nlag=6 crosscorr=(&&a&i);
estimate p=&n q=&&q&i method=&method plot;
forecast id=date interval=&&t&i out=out lead=4;
run;
data g&i;
merge f&i out;
t=_n_;
run;
proc print data=g&i(keep=date &&b&i forecast l95 u95 residual);
run;
proc gplot data=g&i;
plot &&b&i*date=1 forecast*date=2 l95*date=3 u95*date=3 /overlay cframe=&cframe;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
run;
 %let k=%eval(&k+1);
 %let n=%scan(&&p&i,&k);
%end;
%end;
%mend;

%arima(cls,yellow);
%arima(uls,pink);
%arima(ml,orange);






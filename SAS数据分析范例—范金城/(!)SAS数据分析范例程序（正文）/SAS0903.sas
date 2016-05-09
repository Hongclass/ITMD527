%let d1=sas.dead0;
%let d2=sas.dead0;
%let c1=x(12);
%let c2=x(1,12);
%let b1=x;
%let b2=x;
%let p1=8 10 15;
%let p2=9 12 16;
%let q1=8;
%let q2=9;
%let t1=month;
%let t2=month;

%macro arima(method);
%do i=1 %to 2;
data f&i;
set &&d&i;
run;
%let k=1;
%let n=%scan(&&p&i,&k);
%do %while(&n ne);
proc arima data=f&i;
title "var=&&c&i p=&n q=&&q&i method=&method";
identify var=&&c&i nlag=16;
estimate p=&n q=&&q&i method=&method plot;
forecast id=date interval=&&t&i out=out lead=12;
run;
data g&i;
merge f&i out;
run;
proc print data=g&i(keep=date &&b&i forecast l95 u95 residual);
run;
proc gplot data=g&i;
plot &&b&i*date=1 forecast*date=2 l95*date=3 u95*date=3 /overlay cframe=black;
symbol1 v=dot i=none c=white;
symbol2 v=plus i=join c=white;
symbol3 v=none i=join c=ligr;
run;
 %let k=%eval(&k+1);
 %let n=%scan(&&p&i,&k);
%end;
%end;
%mend;

%arima(cls);
%arima(uls);



%let d1=fjc.jmxfsp0;
%let d2=fjc.jmxfsp0;
%let d3=fjc.jmxfsp0;
%let d4=fjc.jmxfzs0;
%let d5=fjc.jmxfzs0;
%let d6=fjc.jmxfzs0;
%let c1=x1(1);
%let c2=x2(1);
%let c3=x(1);
%let c4=x1(1);
%let c5=x2(1);
%let c6=x(1);
%let b1=x1;
%let b2=x2;
%let b3=x;
%let b4=x1;
%let b5=x2;
%let b6=x;
%let a1=x2 x;
%let a2=x1 x;
%let a3=x1 x2;
%let a4=x2 x;
%let a5=x1 x;
%let a6=x1 x2;
%let p1=7;
%let p2=8;
%let p3=7;
%let p4=8;
%let p5=7;
%let p6=8;
%let q1=2;
%let q2=4;
%let q3=2;
%let q4=4;
%let q5=2;
%let q6=4;


%macro arima(method);
%do i=1 %to 6;
data f&i;
set &&d&i;
run;
%let k=1;
%let n=%scan(&&p&i,&k);
%do %while(&n ne);
proc arima data=f&i;
title "arima &&d&i var=&&c&i p=&n q=&&q&i method=&method";
identify var=&&c&i nlag=18 crosscorr=(&&a&i);
estimate p=&n q=&&q&i method=&method plot;
forecast id=date out=out interval=qtr lead=8;
run;
data g&i;
set out;
run;
proc print data=g&i(keep=date &&b&i forecast l95 u95 residual);
run;
proc gplot data=g&i;
plot &&b&i*date=1 forecast*date=2 l95*date=3 u95*date=3 /overlay cframe=pink;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
run;
 %let k=%eval(&k+1);
 %let n=%scan(&&p&i,&k);
%end;
%end;
%mend;

%arima(uls);





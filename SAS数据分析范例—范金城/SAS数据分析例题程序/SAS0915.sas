%let d1=fjc.dianyins;
%let d2=fjc.dianyins;
%let d3=fjc.dianyins;
%let c1=x1(1);
%let c2=x2(1);
%let c3=x3(1);
%let b1=x1;
%let b2=x2;
%let b3=x3;
%let a1=x2 x3 x4 x5;
%let a2=x1 x3 x4 x5;
%let a3=x1 x2 x4 x5;
%let e1=x1 x2 x3 x4 x5;
%let e2=x1 x2 x3 x4 x5;
%let e3=x1 x2 x3 x4 x5;
%let p1=4 7 14;
%let p2=8 12;
%let p3=4 7 14;
%let q1=2;
%let q2=4;
%let q3=2;
%let t1=qtr;
%let t2=qtr;
%let t3=qtr;

%macro arima;
%do i=1 %to 3;
title "&&d&i to=&&t&i out=out&i";
proc expand data=&&d&i out=out&i to=&&t&i;
convert &&e&i/observed=average;
id date;
proc print data=out&i;
run;
%let k=1;
%let n=%scan(&&p&i,&k);
%do %while(&n ne);
title "arima &&d&i to=&&t&i var=&&c&i p=&n q=&&q&i";
proc arima data=out&i;
identify var=&&c&i nlag=10 crosscorr=(&&a&i);
estimate p=&n q=&&q&i method=cls plot;
forecast id=date out=a&i interval=&&t&i lead=5;
run;
proc print data=a&i(keep=date &&b&i forecast l95 u95 residual);
run;
proc gplot data=a&i;
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

%arima;





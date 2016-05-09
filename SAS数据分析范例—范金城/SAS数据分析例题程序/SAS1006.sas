%let d1=fjc.seriesj;
%let d2=fjc.seriesj;
%let c1=x;
%let c2=y;
%let b1=t y;
%let b2=t x;

%macro autoreg(nlag);
%do i=2 %to 2;
%let k=1;
%let n=%scan(&nlag,&k);
%do %while(&n ne);
data f&i;
set &&d&i;
t=_n_;
run;
title "autoreg &&d&i nlag=&n";
proc autoreg data=f&i;
model &&c&i=&&b&i/nlag=&n method=ml dw=4 dwprob backstep;
output out=out&i p=p r=r lcl=l ucl=u pm=pm rm=rm lclm=lm uclm=um;
proc print data=out&i(keep=t &&c&i p l u r);
proc gplot data=out&i;
plot &&c&i*t=1 p*t=2 l*t=3 u*t=3/overlay cframe=pink;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
proc gplot data=out&i;
plot r*t/cframe=yellow;
symbol v=dot i=needle c=blue;
run;
%let k=%eval(&k+1);
   %let n=%scan(&nlag,&k);
%end;
%end;
%mend;

%autoreg(24 36 48);



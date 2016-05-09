%let d1=fjc.spls0;
%let c1=x;
%let b1=date;

%macro autoreg(nlag);
%do i=1 %to 1;
%let k=1;
%let n=%scan(&nlag,&k);
%do %while(&n ne);
data f&i;
set &&d&i;
run;
title "autoreg &&d&i nlag=&n";
proc autoreg data=f&i;
model &&c&i=&&b&i/nlag=&n method=ml dw=4 dwprob backstep;
output out=out&i p=p r=r lcl=l ucl=u pm=pm rm=rm lclm=lm uclm=um;
proc print data=out&i(keep=date &&c&i p l u r);
proc gplot data=out&i;
plot &&c&i*date=1 p*date=2 l*date=3 u*date=3/overlay cframe=pink;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
proc gplot data=out&i;
plot r*date/cframe=yellow;
symbol v=dot i=needle c=blue;
run;
%let k=%eval(&k+1);
   %let n=%scan(&nlag,&k);
%end;
%end;
%mend;

%autoreg(12 16 24);



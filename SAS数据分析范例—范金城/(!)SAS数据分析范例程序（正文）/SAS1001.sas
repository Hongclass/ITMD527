%let d1=sas.sczz06s;
%let d2=sas.sczz06s;
%let d3=sas.sczz06s;
%let c1=x3;
%let c2=x4;
%let c3=x7;
%let b1=x4 x7 date;
%let b2=x3 x7 date;
%let b3=x3 x4 date;

%macro autoreg(nlag);
%do i=1 %to 3;
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
plot &&c&i*date=1 p*date=2 l*date=3 u*date=3/overlay cframe=ligr;
symbol1 v=dot i=none c=black;
symbol2 v=plus i=join c=black;
symbol3 v=none i=join c=grey;
proc gplot data=out&i;
plot r*date/cframe=ligr;
symbol v=dot i=needle c=black;
run;
%let k=%eval(&k+1);
   %let n=%scan(&nlag,&k);
%end;
%end;
%mend;
%autoreg(10 13 18);

 



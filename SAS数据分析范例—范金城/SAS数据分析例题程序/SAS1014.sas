%let d1=fjc.czflzc0;
%let d2=fjc.czflzc0;
%let d3=fjc.czflzc0;
%let y1=x1;
%let y2=x2;
%let y3=x3;
%let x1=date x2 x3;
%let x2=date x1 x3;
%let x3=date x1 x2;




%macro autoreg(nlag);
%do i=1 %to 3;
%let k=1;
%let n=%scan(&nlag,&k);
%do %while(&n ne);
data f&i;
set &&d&i;
run;
title "autoreg &&d&i &&y&i nlag=&n";
proc autoreg data=f&i;
model &&y&i=&&x&i/nlag=&n method=yw dw=4 dwprob backstep;
output out=out&i p=p r=r lcl=lcl ucl=ucl pm=pm rm=rm lclm=lm uclm=um;
data g&i;
merge f&i out&i;
run;
proc print data=g&i(keep=date &&y&i p r lcl ucl);
proc gplot data=g&i;
plot &&y&i*date=1 p*date=2 lcl*date=3 ucl*date=3/overlay cframe=pink;
symbol1 v=dot i=none c=red;
symbol2 v=plus i=join c=green;
symbol3 v=none i=join c=blue;
run;
proc gplot data=out&i;
plot r*date/cframe=yellow;
symbol v=dot i=needle c=blue;
%let k=%eval(&k+1);
   %let n=%scan(&nlag,&k);
%end;
%end;
%mend;

%autoreg(10 15 20);



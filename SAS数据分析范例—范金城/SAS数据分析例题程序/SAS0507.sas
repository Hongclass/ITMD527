%let d1=fjc.xucpcl1s;
%let d2=fjc.xucpcl2s;
%let c1=x1-x7;
%let c2=x1-x7;


%macro factor(method,x);
%do i=1 %to 2;
title "factor &&d&i method=&method nfactors=&x";
proc factor data=&&d&i method=&method  rotate=varimax nfactors=&x out=a&i;
var &&c&i;
proc sort data=a&i out=b&i;
by factor1;
proc print data=b&i(keep=date factor1 factor2);
run;
proc gplot data=b&i;
plot factor1*date/cframe=cyan;
plot factor2*factor1/cframe=yellow;
symbol v=dot c=red i=none;
run;
%end;
%mend;


%factor(prin,5);

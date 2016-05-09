%let d1=fjc.zyncpcl1s;
%let d2=fjc.zyncpcl2;
%let d3=fjc.zyncpcl3;
%let c1=x1-x8;
%let c2=x1-x8;
%let c3=x1-x11;


%macro factor(method,x);
%do i=1 %to 3;
title "factor &&d&i method=&method nfactors=&x";
proc factor data=&&d&i method=&method  rotate=varimax nfactors=&x out=a&i;
var &&c&i;
proc print data=a&i(keep=date factor1 factor2);
proc gplot data=a&i;
plot factor1*date/cframe=orange;
plot factor2*factor1/cframe=yellow;
symbol v=dot c=red i=none;
run;
%end;
%mend;


%factor(prin,5);

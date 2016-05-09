%let d1=fjc.jmcxcks;
%let c1=x1 x2 x3 y1 y2 y3;
%let i1=date;


%macro factor(method,rotate,x);
%do i=1 %to 1;
title "factor &&d&i method=&method rotate=&rotate nfactors=&x";
proc factor data=&&d&i method=&method  nfactors=&x scree
rotate=&rotate out=a&i;
var &&c&i;
proc print data=a&i(keep=date factor1 factor2);
run;
%let plotitop=gopts=cback=blue, color=white, cframe=yellow;
%plotit(data=a&i, labelvar=&&i&i,
        plotvars=factor2 factor1,colors=magenta);
%end;
%mend;

%factor(prin,equamax,2);
%factor(prin,varimax,3);



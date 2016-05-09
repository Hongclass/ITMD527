%let d1=fjc.dqlyrs;
%let d2=fjc.dqlyrs;
%let c1=x1-x4;
%let c2=y1-y4;



%macro factor(method,r,x);
%do i=2 %to 2;
title "factor &&d&i method=&method c=&&c&i rotate=&r nfactors=&x";
proc factor data=&&d&i method=&method nfactors=&x
rotate=&r out=a&i;
var &&c&i;
proc sort data=a&i out=b&i;
by factor1;
proc print data=b&i(keep=d factor1 factor2);
run;
%let plotitop=gopts=cback=blue, color=white, cframe=yellow;
%plotit(data=b&i, labelvar=x1,
        plotvars=factor1 x1,colors=magenta);
%plotit(data=b&i, labelvar=d,
        plotvars=factor1 x1,colors=magenta);
%plotit(data=b&i, labelvar=d,
        plotvars=factor2 factor1,colors=magenta);
run;
%end;
%mend;

%factor(p,v,2);


%let d1=fjc.dqrjsr;
%let c1=x1 x2 x3 x4 x5 x6;
%let i1=d;


%macro factor(method,rotate,x);
%do i=1 %to 1;
title "factor &&d&i method=&method rotate=&rotate nfactors=&x";
proc factor data=&&d&i method=&method  nfactors=&x
rotate=&rotate out=a&i;
var &&c&i;
proc sort data=a&i out=b&i;
by factor1;
proc print data=b&i(keep=d factor1 factor2 factor3);
run;
%let plotitop=gopts=cback=blue, color=white, cframe=yellow;
%plotit(data=b&i, labelvar=x1,
        plotvars=factor1 x1,colors=magenta);
%plotit(data=b&i, labelvar=&&i&i,
        plotvars=factor1 x1,colors=magenta);
%end;
%mend;


%factor(prin,varimax,3);



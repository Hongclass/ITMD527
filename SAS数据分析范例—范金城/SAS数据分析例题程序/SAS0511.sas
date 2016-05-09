%let d1=fjc.dqsczz0;
%let d2=fjc.dqsczz0;
%let c1=x1-x11;
%let c2=x1 x2 x3 x6;
%let i1=d;
%let i2=d;

%macro factor(method,rotate,x);
%do i=1 %to 2;
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
%plotit(data=b&i, labelvar=&&i&i,
        plotvars=factor2 factor1,colors=magenta);
%end;
%mend;


%factor(prin,varimax,3);



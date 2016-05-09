%let d1=fjc.ms10d1;
%let c1=x1 x2;
%let b1=y1 y2;

%macro cancorr;
%do i=1 %to 1;
title "cancorr &&d&i";
proc cancorr data=&&d&i out=a&i;
var &&c&i;
with &&b&i;
run;
proc print data=a&i(keep=v1 w1 v2 w2);
run;
%let plotitop=gopts=cback=blue, color=white, cframe=yellow;
%plotit(data=a&i, labelvar=x1,
        plotvars=w1 v1, colors=red);
%plotit(data=a&i, labelvar=y1,
        plotvars=w1 v1, colors=magenta);
%end;
%mend;

%cancorr; 


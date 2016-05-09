%let d1=fjc.iris;
%let c1=sepalwidth sepallength;
%let b1=petallength petalwidth;
%let i1=species;

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
%plotit(data=a&i, labelvar=&&i&i,
        plotvars=&&c&i, colors=red);
%plotit(data=a&i, labelvar=&&i&i,
        plotvars=w1 v1, colors=magenta);
%end;
%mend;

%cancorr; 


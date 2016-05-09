%let d1=fjc.dqsczz0;
%let c1=x1-x11;
%let b1=x19;


%macro cancorr;
%do i=1 %to 1;
title "cancorr &&d&i";
proc cancorr data=&&d&i out=a&i;
var &&c&i;
with &&b&i;
run;
proc sort data=a&i out=b&i;
by v1;
proc print data=b&i(keep=d v1 w1);
run;
proc gplot data=a&i;
plot d*v1/cframe=yellow;
plot d*w1/cframe=cyan;
symbol v=dot c=red pointlabel;
run;
%let plotitop=gopts=cback=blue, color=white, cframe=yellow;
%plotit(data=b&i, labelvar=d,
        plotvars=v1 x1, colors=red);
%end;
%mend;

%cancorr; 


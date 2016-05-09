%let d1=fjc.dqlyrs;
%let c1=x1-x4;
%let b1=y1-y4;


%macro cancorr;
%do i=1 %to 1;
title "cancorr &&d&i";
proc cancorr data=&&d&i out=a&i;
var &&c&i;
with &&b&i;
run;
proc print data=a&i(keep=d v1 w1 v2 w2);
run;
proc gplot data=a&i;
plot d*v1/cframe=yellow;
plot d*w1/cframe=cyan;
plot d*v2/cframe=pink;
plot d*w2/cframe=orange;
symbol v=dot c=red pointlabel;
run;
%end;
%mend;

%cancorr; 


%let d1=fjc.dqgz;
%let d2=fjc.dqgz;
%let y1=x1;
%let y2=x6;
%let x1=x2 x3 x4 x5 x6;
%let x2=x1 x2 x3 x4 x5;


%macro rsreg;
%do i=2 %to 2;
title "&&d&i y=&&y&i x=&&x&i";
proc rsreg data=&&d&i out=a&i;
model &&y&i=&&x&i/actual predict; 
proc print data=a&i(keep=_TYPE_ &&y&i);
run;
%let plotitop=gopts=cback=green, color=white, cframe=yellow;
%plotit(data=&&d&i, plotvars=x1 x5,
        labelvar=&&y&i, colors=blue);
%plotit(data=&&d&i, plotvars=x1 x5,
        labelvar=d, colors=blue);
title "a&i y=&&y&i x=&&x&i";
%let plotitop=gopts=cback=orange, color=white, cframe=yellow;
%plotit(data=a&i, plotvars=x1 x5,
        labelvar=d, typevar=_type_);
%end;
%mend;

%rsreg;

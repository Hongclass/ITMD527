%let d1=fjc.dqrk;
%let d2=fjc.dqrk;
%let y1=x2;
%let y2=x3;
%let x1=x1 x3 x4;
%let x2=x1 x2 x4;


%macro rsreg;
%do i=1 %to 1;
title "&&d&i y=&&y&i x=&&x&i";
proc rsreg data=&&d&i out=a&i;
model &&y&i=&&x&i/actual predict l95 u95; 
run;
%let plotitop=gopts=cback=green, color=white, cframe=yellow;
%plotit(data=&&d&i, plotvars=x2 x1,
        labelvar=d, colors=blue);
data f&i;
merge &&d&i a&i;
proc print data=f&i(keep=&&y&i _TYPE_);
run;
title "f&i y=&&y&i x=&&x&i";
%let plotitop=gopts=cback=orange, color=white, cframe=yellow;
%plotit(data=f&i, plotvars=x2 x1,
        labelvar=x1, typevar=_type_);
run;
%end;
%mend;

%rsreg;

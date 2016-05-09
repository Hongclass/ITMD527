%let d1=fjc.weisenjgs;
%let d2=fjc.weisenjgs;
%let d3=fjc.weisenjgs;
%let y1=x1;
%let y2=x2;
%let y3=x3;
%let x1=date x2 x3 x4 x5;
%let x2=date x1 x3 x4 x5;
%let x3=date x1 x2 x4 x5;


%macro rsreg;
%do i=1 %to 3;
title "&&d&i y=&&y&i x=&&x&i";
proc rsreg data=&&d&i out=a&i;
model &&y&i=&&x&i/actual predict l95 u95; 
run;
%let plotitop=gopts=cback=red, color=white, cframe=yellow;
%plotit(data=a1, plotvars=x2 x1,
        labelvar=date, typevar=_type_);
run;
%end;
%mend;

%rsreg;

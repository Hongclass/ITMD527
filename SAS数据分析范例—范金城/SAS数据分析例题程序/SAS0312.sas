%let d1=fjc.zylcpcls;
%let d2=fjc.zylcpcls;
%let d3=fjc.zylcpcls;
%let y1=x1;
%let y2=x2;
%let y3=x3;
%let x1=date x2 x3 x4 x5 x6;
%let x2=date x1 x3 x4 x5 x6;
%let x3=date x1 x2 x4 x5 x6;


%macro rsreg;
%do i=1 %to 3;
title "&&d&i y=&&y&i x=&&x&i";
proc rsreg data=&&d&i out=a&i;
model &&y&i=&&x&i/actual predict l95 u95; 
proc print data=a&i(keep=date &&y&i _type_);
run;
%let plotitop=gopts=cback=blue, color=white, cframe=yellow;
%plotit(data=a&i, plotvars=x3 x1,
        labelvar=date, typevar=_type_);
run;
%end;
%mend;

%rsreg;

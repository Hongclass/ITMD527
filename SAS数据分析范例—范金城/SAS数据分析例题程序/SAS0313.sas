%let d1=fjc.xxbyss;
%let d2=fjc.xxbyss;
%let y1=x1;
%let y2=x2;
%let x1=date x2 x3 x4 x5 x6 x7;
%let x2=date x1 x3 x4 x5 x6 x7;


%macro rsreg;
%do i=1 %to 1;
title "&&d&i y=&&y&i x=&&x&i";
proc rsreg data=&&d&i out=a&i;
model &&y&i=&&x&i/actual predict l95 u95; 
proc print data=a&i(keep=date &&y&i _type_);
run;
title "a&i y=&&y&i x=&&x&i";
%let plotitop=gopts=cback=orange, color=white, cframe=yellow;
%plotit(data=a&i, plotvars=x1 x6,
        labelvar=date, typevar=_type_);
run;
%end;
%mend;

%rsreg;

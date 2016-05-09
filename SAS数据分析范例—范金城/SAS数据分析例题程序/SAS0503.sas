%let d1=fjc.zyncpcl1s;
%let c1=x1-x6;
%let i1=date;

%macro princomp;
%do i=1 %to 1;
title "princomp &&d&i var=&&c&i";
proc princomp data=&&d&i out=a&i;
var &&c&i;
run;
proc sort data=a&i;
by prin1;
proc print;
id &&i&i;
var prin1;
run;
title "princomp &&d&i var=&&c&i";
%let plotitop=gopts=cback=green, color=white, cframe=yellow;
%plotit(data=a&i, labelvar=&&i&i,
        plotvars=Prin2 Prin1, colors=blue);
%plotit(data=a&i, labelvar=Prin1,
        plotvars=Prin1 Date, colors=blue);
run;
%end;
%mend;

%princomp;










%let d1=fjc.princomp1;
%let c1=july january;
%let i1=city;


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
proc gplot data=a&i;
plot prin1*&&i&i / cframe=brown;
plot prin1*prin2 / cframe=blue;
symbol v=dot c=yellow;
%let plotitop=gopts=cback=green, color=white, cframe=yellow;
%plotit(data=&&d&i, labelvar=&&i&i,
        plotvars=&&c&i, colors=blue);
%plotit(data=a&i, labelvar=Prin1,
        plotvars=Prin2 Prin1, colors=blue);
run;
%end;
%mend;

%princomp;









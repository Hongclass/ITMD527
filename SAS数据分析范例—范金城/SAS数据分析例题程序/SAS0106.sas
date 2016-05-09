%let d1=fjc.njcp2;
%let d2=fjc.njcp3;
%let c1=x1;
%let c2=x1;
%let b1=c;
%let b2=c;
%let e1=green;
%let e2=blue;

%macro gchart;
%do i=1 %to 2;
goptions reset=global colors=(&&e&i)
         gunit=pct cback=white border
         ftext=zapf htitle=4 htext=3;
proc gchart data=&&d&i;
vbar &&c&i;
hbar &&c&i;
pie &&c&i;
donut &&c&i;
vbar &&c&i/subgroup=&&b&i freq inside=freq outside=cfreq;
hbar &&c&i/subgroup=&&b&i;
pie &&c&i/subgroup=&&b&i;
donut &&c&i/subgroup=&&b&i;
vbar &&c&i/ sumvar=&&c&i type=mean inside=freq outside=cfreq;
title c=blue h=5pct "&&d&i group=&&b&i";
run;
%end;
%mend;

%gchart;

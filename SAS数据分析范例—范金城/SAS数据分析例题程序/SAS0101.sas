%let d1=fjc.jmxfsp1;
%let d2=fjc.jmxfsp2;
%let c1=x x1 x2;
%let c2=x x1 x2;
%let b1=y;
%let b2=y;

%macro gchart;
%do i=1 %to 2;
proc gchart data=&&d&i;
vbar &&c&i/subgroup=&&b&i freq inside=freq outside=cfreq;
hbar &&c&i/subgroup=&&b&i percent;
pie &&c&i/subgroup=&&b&i;
block &&c&i/subgroup=&&b&i;
vbar3d &&c&i/subgroup=&&b&i freq inside=freq outside=cfreq;
hbar3d &&c&i/subgroup=&&b&i percent;
pie3d &&c&i/subgroup=&&b&i;
title c=blue h=5pct "gchart &&d&i group=&&b&i";
run;
%end;
%mend;

%gchart;

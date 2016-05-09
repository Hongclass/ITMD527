%let d1=fjc.dqrk2;
%let d2=fjc.dqrk3;
%let c1=x2;
%let c2=x2;
%let b1=c;
%let b2=c;
%let x1=3;
%let x2=4;


%macro gchart;
%do i=1 %to 2;
goptions reset=all;
proc gchart data=&&d&i;
vbar3d &&c&i/group=&&b&i freq inside=freq outside=cfreq;
vbar3d &&c&i/group=&&b&i percent; 
hbar3d &&c&i/group=&&b&i percent;
pie3d &&c&i/group=&&b&i freq across=&&x&i;
pie3d &&c&i/group=&&b&i slice=arrow percent=inside value=arrow across=&&x&i;
vbar3d &&c&i/subgroup=&&b&i freq inside=freq outside=cfreq;
vbar3d &&c&i/subgroup=&&b&i percent;
hbar3d &&c&i/subgroup=&&b&i percent;
pie3d &&c&i/subgroup=&&b&i freq;
pie3d &&c&i/subgroup=&&b&i slice=arrow percent=inside value=arrow;
title c=blue h=5pct "&&d&i group=&&b&i";
run;
%end;
%mend;

%gchart;

%let d1=fjc.bd3;
%let d2=fjc.bd4;
%let c1=birth death;
%let c2=birth death;



%macro gchart;
%do i=1 %to 2;
goptions reset=all;
proc gchart data=&&d&i;
vbar &&c&i/group=y patternid=group;
hbar &&c&i/group=y patternid=group;
vbar3d &&c&i/group=y patternid=group;
hbar3d &&c&i/group=y patternid=group;
vbar &&c&i/subgroup=y freq;
hbar &&c&i/subgroup=y freq;
vbar3d &&c&i/subgroup=y freq;
hbar3d &&c&i/subgroup=y freq;
pattern1 v=s c=blue;
pattern2 v=s c=red;
pattern3 v=s c=green;
pattern4 v=s c=yellow;
title c=blue h=5pct "&&d&i";
run;
%end;
%mend;

%gchart;

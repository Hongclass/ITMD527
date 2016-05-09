%let d1=sas.bd3;
%let d2=sas.bd4;
%let c1=birth death;
%let c2=birth death;

%macro gchart;
%do i=1 %to 2;
goptions reset=all;
proc gchart data=&&d&i;
vbar3d &&c&i/group=y patternid=group;
hbar3d &&c&i/group=y patternid=group;
vbar3d &&c&i/subgroup=y freq;
hbar3d &&c&i/subgroup=y freq;
pattern1 v=s c=grey;
pattern2 v=s c=ligr;
pattern3 v=s c=black;
pattern4 v=s c=white;
title c=black h=5pct "&&d&i";
run;
%end;
%mend;

%gchart;



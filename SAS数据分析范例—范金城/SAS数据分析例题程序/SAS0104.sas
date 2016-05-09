%let d1=fjc.nlmyzz2;
%let d2=fjc.nlmyzz3;
%let c1=x1;
%let c2=x1;
%let b1=c;
%let b2=c;




%macro gchart;
%do i=1 %to 2;
goptions reset=all;
proc gchart data=&&d&i;
vbar3d &&c&i/group=&&b&i patternid=group;
hbar3d &&c&i/group=&&b&i patternid=group;
vbar3d &&c&i/subgroup=&&b&i freq inside=freq outside=cfreq;
hbar3d &&c&i/subgroup=&&b&i percent; 
pie3d &&c&i/subgroup=&&b&i freq; 
vbar3d &&c&i/subgroup=&&b&i percent;
title c=blue h=5pct "&&d&i group=&&b&i";
run;
%end;
%mend;

%gchart;

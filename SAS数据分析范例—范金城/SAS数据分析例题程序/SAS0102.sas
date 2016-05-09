%let d1=fjc.jmjt051;
%let d2=fjc.jmjt052;
%let d3=fjc.jmjt053;
%let d4=fjc.jmjt054;
%let d5=fjc.jmjt055;
%let c1=x4 x5 x6;
%let c2=x4 x5 x6;
%let c3=x4 x5 x6;
%let c4=x4 x5 x6;
%let c5=x4 x5 x6;
%let b1=c;
%let b2=c;
%let b3=c;
%let b4=c;
%let b5=c;


%macro gchart;
%do i=1 %to 5;
proc gchart data=&&d&i;
vbar &&c&i/subgroup=&&b&i freq inside=freq outside=cfreq;
hbar &&c&i/subgroup=&&b&i percent;
pie &&c&i/subgroup=&&b&i;
title c=blue h=5pct "gchart &&d&i group=&&b&i";
run;
%end;
%mend;

%gchart;

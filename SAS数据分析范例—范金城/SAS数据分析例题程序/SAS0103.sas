%let d1=fjc.nlmyzz3;
%let c1=x1 x2 x3 x4 x5;
%let b1=c;
%let x1=4;
%let x2=4;

%macro gchart(x);
%do i=1 %to 1;
goptions reset=all cpattern=&x;
proc gchart data=&&d&i;
vbar &&c&i/group=&&b&i freq inside=freq outside=cfreq;
hbar &&c&i/group=&&b&i percent;
pie &&c&i/group=&&b&i slice=arrow percent=inside value=arrow across=&&x&i;
donut &&c&i/group=&&b&i slice=arrow percent=inside value=arrow across=&&x&i; 
title c=blue h=5pct "&&d&i group=&&b&i";
run;
%end;
%mend;

%gchart(red);
%gchart(blue);

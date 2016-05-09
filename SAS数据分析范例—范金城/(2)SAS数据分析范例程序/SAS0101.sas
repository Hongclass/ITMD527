%let d1=fjc.sczz;
%let d2=fjc.sczzgc;



%macro gchart;
%do i=1 %to 2;
proc gchart data=&&d&i;
hbar x1 x2 x3;
vbar x1 x2 x3;
hbar3d x1 x2 x3;
vbar3d x1 x2 x3;
pie x1 x2 x3;
pie3d x1 x2 x3;
title c=blue h=7pct "gchart &&d&i";
%end;
%mend;

%gchart;

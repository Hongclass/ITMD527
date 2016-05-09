%let d1=sas.sczz;
%let d2=sas.sczzgc;

%macro gchart;
%do i=1 %to 2;
proc gchart data=&&d&i;
pattern1 color=grey;
hbar x1 x2 x3;
vbar x1 x2 x3;
hbar3d x1 x2 x3;
vbar3d x1 x2 x3;
title c=black h=6pct "gchart &&d&i";
%end;
%mend;

%gchart;

%let d1=sas.modeclu4;
%let d2=sas.poverty;
%let c1=birth death;
%let c2=birth death infantdeath;

%macro gchart;
%do i=1 %to 2;
proc gchart data=&&d&i;
pattern1 color=ligr;
vbar3d &&c&i/type=freq inside=freq outside=cfreq;
hbar3d &&c&i/type=percent;
hbar3d birth/ sumvar=birth type=sum;
vbar3d birth/ sumvar=birth type=sum inside=freq outside=cfreq;
hbar3d &&c&i/freq percent autoref;
vbar3d &&c&i/freq percent autoref;
title c=black h=5pct "&&d&i";
run;
%end;
%mend;

%gchart;


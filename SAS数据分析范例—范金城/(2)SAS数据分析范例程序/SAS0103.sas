%let d1=fjc.modeclu4;
%let d2=fjc.poverty;
%let c1=birth death;
%let c2=birth death infantdeath;


%macro gchart;
%do i=1 %to 2;
proc gchart data=&&d&i;
vbar3d &&c&i/type=freq inside=freq outside=cfreq;
hbar3d &&c&i/type=percent;
hbar3d birth/ sumvar=birth type=sum;
vbar3d birth/ sumvar=birth type=sum inside=freq outside=cfreq;
hbar3d &&c&i/freq percent autoref;
vbar3d &&c&i/freq percent autoref;
title c=green h=5pct "&&d&i";
run;
%end;
%mend;

%gchart;

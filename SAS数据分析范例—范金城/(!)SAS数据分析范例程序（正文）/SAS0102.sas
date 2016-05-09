%let d1=sas.sczz;

%macro gchart;
%do i=1 %to 1;
proc gchart data=&&d&i;
pattern1 color=ligr;
vbar3d x1 x2 x3/type=freq inside=freq outside=cfreq;
vbar3d x1 x2 x3/type=percent inside=percent outside=cpercent;
vbar3d x1/ sumvar=x1 type=sum inside=freq outside=cfreq;
vbar3d x2/ sumvar=x2 type=sum inside=freq outside=cfreq;
vbar3d x3/ sumvar=x3 type=sum inside=freq outside=cfreq;
title c=black h=5pct "&&d&i";
run;
%end;
%mend;

%gchart;

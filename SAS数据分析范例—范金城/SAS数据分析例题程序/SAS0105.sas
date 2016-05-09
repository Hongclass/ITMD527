%let d1=fjc.njcp2;
%let d2=fjc.njcp3;
%let c1=x1 x2 x3 x4 x5 x6;
%let c2=x1 x2 x3 x4 x5 x6;
%let b1=c;
%let b2=c;




%macro gchart;
%do i=1 %to 2;
goptions reset=all;
proc gchart data=&&d&i;
pie &&c&i/type=percent fill=x5 cfill=blue; 
pie &&c&i/type=percent fill=x5 cfill=green slice=arrow percent=inside value=arrow;
pie &&c&i/subgroup=&&b&i freq slice=arrow percent=inside value=arrow; 
pie3d &&c&i/subgroup=&&b&i freq slice=arrow percent=inside value=arrow; 
donut &&c&i/type=percent fill=x5 cfill=blue; 
donut &&c&i/type=percent fill=x5 cfill=green slice=arrow percent=inside value=arrow;
donut &&c&i/subgroup=&&b&i freq slice=arrow percent=inside value=arrow;
title c=blue h=5pct "&&d&i group=&&b&i";
run;
%end;
%mend;

%gchart;

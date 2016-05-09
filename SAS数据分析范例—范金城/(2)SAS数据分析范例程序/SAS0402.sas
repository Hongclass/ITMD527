%let d1=fjc.jmjt052;
%let d2=fjc.jmjt053;
%let d3=fjc.jmjt054;
%let d4=fjc.jmjt055;

%macro glm;
%do i=1 %to 4;
title "&&d&i model x4 x5 x6=c";
proc glm data=&&d&i;
class c;
model x4 x5 x6=c;
manova h=c/printe printh;
manova h=c m=x4-x6,x4+x5+x6/printe printh;
manova h=c m=x4-x5,x4+x5/printe printh;
means c /lsd clm;
run;
%end;
%mend;

%glm;

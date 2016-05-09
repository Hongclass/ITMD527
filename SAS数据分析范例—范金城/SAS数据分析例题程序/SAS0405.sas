%let d1=fjc.dqcxck1;
%let d2=fjc.dqcxck2;
%let d3=fjc.dqcxck3;
%let d4=fjc.dqcxck4;
%let d5=fjc.dqcxck5;


%macro glm;
%do i=1 %to 5;
title "&&d&i model x1 x4 x7=c";
proc glm data=&&d&i;
class c;
model x1 x4 x7=c;
manova h=c/printe printh;
manova h=c m=x1-x7,x4-x1/printe printh;
means c /lsd clm;
run;
%end;
%mend;

%glm;

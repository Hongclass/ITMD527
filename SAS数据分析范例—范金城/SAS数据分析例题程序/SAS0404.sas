%let d1=fjc.whdwd1;
%let d2=fjc.whdwd2;
%let d3=fjc.whdwd3;
%let d4=fjc.whdwd4;
%let d5=fjc.whdwd5;


%macro glm;
%do i=4 %to 4;
title "&&d&i model x1 x2 x3 x4 x5=c";
proc glm data=&&d&i;
class c;
model x1 x2 x3 x4 x5=c;
manova h=c/printe printh;
manova h=c m=x1+x2,x3+x4+x5/printe printh;
means c /lsd clm;
run;
%end;
%mend;

%glm;

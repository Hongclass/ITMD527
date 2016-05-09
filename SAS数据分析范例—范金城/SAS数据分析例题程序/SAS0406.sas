%let d1=fjc.dqnlmy1;
%let d2=fjc.dqnlmy2;
%let d3=fjc.dqnlmy3;
%let d4=fjc.dqnlmy4;
%let d5=fjc.dqnlmy5;


%macro glm;
%do i=1 %to 5;
title "&&d&i model x2 x3 x4 x5=c";
proc glm data=&&d&i;
class c;
model x2 x3 x4 x5=c;
manova h=c/printe printh;
manova h=c m=x2+x3,x4+x5/printe printh;
means c /lsd clm;
run;
%end;
%mend;

%glm;

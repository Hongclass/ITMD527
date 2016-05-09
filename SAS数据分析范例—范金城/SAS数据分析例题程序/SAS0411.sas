%let d1=fjc.yixue2;


%macro anova;
%do i=1 %to 1;
title "&&d&i model y1 y2 y3 y4 y5=fat|sex";
proc anova data=&&d&i;
class fat sex;
model y1 y2 y3 y4 y5=fat|sex;
manova h=fat|sex/printe printh;
means fat sex/lsd clm cldiff;
run;
%end;
%mend;

%anova;

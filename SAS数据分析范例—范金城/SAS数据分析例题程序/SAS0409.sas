%let d1=fjc.tijian;


%macro glm;
%do i=1 %to 1;
title "&&d&i model y1 y2 y3=sex";
proc glm data=&&d&i;
class sex;
model y1 y2 y3=sex;
manova h=sex/printe printh;
means sex/lsd clm;
contrast 'Test:sex eff.'    sex 1 -1;
contrast 'Test:_1 vs _2 eff.'    sex 1 -1;
run;
%end;
%mend;

%glm;

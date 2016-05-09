%let d1=fjc.jmxfsp2;

%macro glm;
%do i=1 %to 1;
title "&&d&i model x x1 x2=y";
proc glm data=&&d&i;
class y;
model x x1 x2=y;
manova h=y/printe printh;
manova h=y m=x-x1,x2-x/printe printh;
means y/lsd clm;
contrast 'Test:y eff.'    y 1 -1 0,
                          y 1 0 -1,
						  y 0 1 -1;
contrast 'Test:y1 vs y2 eff.'    y 1 -1 0;
contrast 'Test:y1 vs y3 eff.'    y 1 0 -1;
contrast 'Test:y2 vs y3 eff.'    y 0 1 -1;
                                
run;
%end;
%mend;

%glm;

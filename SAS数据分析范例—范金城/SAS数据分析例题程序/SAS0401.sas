%let d1=fjc.bd4;

%macro glm;
%do i=1 %to 1;
title "&&d&i model birth death=y";
proc glm data=&&d&i;
class y;
model birth death=y;
manova h=y/printe printh;
contrast 'Test:y eff.'    y 1 -1 0 0,
                          y 1 0 -1 0,
						  y 1 0 0 -1;
contrast 'Test:y1 vs y2 eff.'    y 1 -1 0 0;
contrast 'Test:y1 vs y3 eff.'    y 1 0 -1 0;
contrast 'Test:y1 vs y4 eff.'    y 1 0 0 -1;
contrast 'Test:y2 vs y3 eff.'    y 0 1 -1 0;
run;
%end;
%mend;

%glm;

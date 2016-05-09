%let d1=fjc.yixue1;


%macro glm;
%do i=1 %to 1;
title "&&d&i model gpt got=t s";
proc glm data=&&d&i;
class t s;
model gpt got=t s;
manova h=t/printe printh;
means t/lsd clm;
contrast 'Test:t eff.'    t 1 -1 0,
                          t 1 0 -1,
						  t 0 1 -1;
contrast 'Test:_1 vs _2 eff.'    t 1 -1 0;
contrast 'Test:_1 vs _3 eff.'    t 1 0 -1;
contrast 'Test:_2 vs _3 eff.'    t 0 1 -1;
run;
%end;
%mend;

%glm;

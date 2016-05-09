%let d1=fjc.gnsczzgc2;
%let d2=fjc.gnsczzgc3;
%let d3=fjc.gnsczzgc4;
%let d4=fjc.gnsczzgc5;


%macro glm;
%do i=1 %to 5;
title "&&d&i model x2 x3 x6=c";
proc glm data=&&d&i;
class c;
model x2 x3 x6=c;
manova h=c/printe printh;
means c /lsd clm;
contrast 'Test:c eff.'    c 1 -1 0,
                          c 1 0 -1,
						  c 0 1 -1;
contrast 'Test:_1 vs _2 eff.'    c 1 -1 0;
contrast 'Test:_1 vs _3 eff.'    c 1 0 -1;
contrast 'Test:_2 vs _3 eff.'    c 0 1 -1;
run;
%end;
%mend;

%glm;

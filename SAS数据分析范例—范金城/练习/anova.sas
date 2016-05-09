data prg6_1;
do c=1 to 3;
do i=1 to 8;
input x @@;
output;
end;
end;
cards;
3.53 2.98 4.59 4.00 4.34 3.55 2.66 2.64 
2.42 1.98 3.36 2.63 4.32 2.86 2.34 2.93
2.86 2.66 2.28 2.32 2.39 2.61 2.28 3.64
;
/*proc print;
var x;
run;*/
proc anova;
class c ;
model x=c ;
means c ;
means c/lsd;
run;


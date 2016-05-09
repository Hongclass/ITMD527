data prg8_1;
input x y @@;
cards;
2 54 5 50 7 45 10 37 14 35 19 25 26 20 31 16 
34 18 38 13 45 8 52 11 53 8 60 4 65 6
;
/*proc gplot;
plot y*x;
symbol i=spline v=dot;
run;*/
proc nlin noprint;
parms a=0 b=0;
model y=exp(a+b*x);
output out=prg8_1_1  p=y0;
run;
/*data prg8_1_2;
merge prg8_1  prg8_1_1;
*by x;
run;*/
data a1;
set prg8_1_1;
proc gplot data=a1;
plot y*x=1 y0*x=2/overlay;
/*symbol1 v=dot i=spline c=black l=1 w=2 pointlabel;
symbol2 v='1' i=join c=black l=2 w=3 pointlabel;*/
symbol1 v=dot i=spline l=1 w=1 ;
symbol2 v=plus i=join l=1 w=1 ;
run;
/*proc print data=prg8_1_1;
var x y y0;
run;*/
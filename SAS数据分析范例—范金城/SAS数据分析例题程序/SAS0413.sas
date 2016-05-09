%let d1=fjc.xucpcl1s;
%let d2=fjc.xucpcl1s;
%let d3=fjc.xucpcl1s;
%let d4=fjc.xucpcl1s;
%let d5=fjc.xucpcl1s;
%let d6=fjc.xucpcl1s;
%let d7=fjc.xucpcl1s;
%let y1=x1;
%let y2=x2;
%let y3=x3;
%let y4=x4;
%let y5=x5;
%let y6=x6;
%let y7=x7;
%let b1=x2 x3 x4 x5 x6 x7;
%let b2=x1 x3 x4 x5 x6 x7;
%let b3=x1 x2 x4 x5 x6 x7;
%let b4=x1 x2 x3 x5 x6 x7;
%let b5=x1 x2 x3 x4 x6 x7;
%let b6=x1 x2 x3 x4 x5 x7;
%let b7=x1 x2 x3 x4 x5 x6;

%macro glm;
%do i=1 %to 7;
title "&&d&i model &&y&i=&&b&i";
proc glm data=&&d&i;
model &&y&i=&&b&i/ss3;
output out=a&i p=p r=r stdr=stdr u95=u95 l95=l95;
run;
data b&i;
merge &&d&i a&i;
run;
proc print data=b&i(keep= date &&y&i p r stdr u95 l95);
run;
proc gplot data=b&i;
symbol1 v=dot c=red pointlabel;
symbol2 v=star c=blue;
symbol3 v=point c=green;
plot date*&&y&i=1 date*p=2 date*l95=3 date*u95=3/cframe=pink overlay;
run;
%let plotitop=gopts=cback=cyan, color=black, cframe=yellow;
title "&&d&i model &&y&i=&&b&i labelvar=date";
%plotit(data=b&i, plotvars=x5 x1,
        labelvar=date, colors=blue);
title "&&d&i model &&y&i=&&b&i labelvar=&&y&i";
%plotit(data=b&i, plotvars=x5 x1,
        labelvar=&&y&i, colors=red);
title "&&d&i model &&y&i=&&b&i labelvar=p";
%plotit(data=b&i, plotvars=x5 x1,
        labelvar=p, colors=purple);
%end;
%mend;

%glm;

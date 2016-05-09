%let d1=fjc.dqrk;
%let d2=fjc.dqrk;
%let d3=fjc.dqrk;
%let y1=x2;
%let y2=x3;
%let y3=x4;
%let b1=x1 x3 x4;
%let b2=x1|x2 x4;
%let b3=x1|x2 x3;
%let c1=x2 x1;
%let c2=x2 x1;
%let c3=x2 x1;

%macro glm;
%do i=1 %to 2;
title "&&d&i model &&y&i=&&b&i";
proc glm data=&&d&i;
model &&y&i=&&b&i/ss3;
output out=a&i p=p r=r stdr=stdr u95=u95 l95=l95;
run;
data b&i;
merge &&d&i a&i;
t=_n_;
run;
proc print data=b&i(keep=&&y&i p r stdr u95 l95);
run;
proc gplot data=b&i;
symbol1 v=dot c=red pointlabel;
symbol2 v=star c=blue;
symbol3 v=square c=green;
plot d*&&y&i=1 d*p=2 d*l95=3 d*u95=3/cframe=pink overlay;
run;
%let plotitop=gopts=cback=cyan, color=black, cframe=yellow;
title "&&d&i model &&y&i=&&b&i labelvar=d";
%plotit(data=b&i, plotvars=&&c&i,
        labelvar=d, colors=blue);
title "&&d&i model &&y&i=&&b&i labelvar=&&y&i";
%plotit(data=b&i, plotvars=&&c&i,
        labelvar=&&y&i, colors=red);
title "&&d&i model &&y&i=&&b&i labelvar=p";
%plotit(data=b&i, plotvars=&&c&i,
        labelvar=p, colors=purple);
title "&&d&i model &&y&i=&&b&i labelvar=r";
%plotit(data=b&i, plotvars=&&c&i,
        labelvar=r, colors=black);
%end;
%mend;

%glm;

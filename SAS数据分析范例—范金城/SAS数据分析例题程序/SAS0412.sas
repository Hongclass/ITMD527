%let d1=fjc.jmxfsps;
%let d2=fjc.jmxfsps;
%let d3=fjc.jmxfsps;
%let y1=x1;
%let y2=x2;
%let y3=x;
%let b1=x2|x;
%let b2=x1|x;
%let b3=x1|x2;
%let c1=x x2;
%let c2=x1 x;
%let c3=x1 x2;

%macro glm;
%do i=3 %to 3;
title "&&d&i model &&y&i=&&b&i";
proc glm data=&&d&i;
model &&y&i=&&b&i/ss3;
manova h=&&c&i/printe printh;
output out=a&i p=p r=r stdr=stdr u95=u95 l95=l95;
run;
data b&i;
merge &&d&i a&i;
run;
proc print data=b&i(keep=date &&y&i p r stdr u95 l95);
run;
proc gplot data=b&i;
symbol1 v=dot c=red pointlabel;
symbol2 v=star c=blue;
symbol3 v=point c=green;
plot date*&&y&i=1 date*p=2 date*l95=3 date*u95=3/cframe=pink overlay;
run;
%let plotitop=gopts=cback=blue, color=white, cframe=yellow;
title "&&d&i model &&y&i=&&b&i labelvar=date";
%plotit(data=b&i, plotvars=&&c&i,
        labelvar=date, colors=blue);
title "&&d&i model &&y&i=&&b&i labelvar=&&y&i";
%plotit(data=b&i, plotvars=&&c&i,
        labelvar=&&y&i, colors=red);
title "&&d&i model &&y&i=&&b&i labelvar=p";
%plotit(data=b&i, plotvars=&&c&i,
        labelvar=p, colors=purple);
title "&&d&i model &&y&i=&&b&i labelvar=u95";
%plotit(data=a&i, plotvars=&&c&i,
        labelvar=u95, colors=magenta);
title "&&d&i model &&y&i=&&b&i labelvar=l95";
%plotit(data=a&i, plotvars=&&c&i,
        labelvar=l95, colors=magenta);
%end;
%mend;

%glm;

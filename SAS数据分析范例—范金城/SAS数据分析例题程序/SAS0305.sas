%let d1=fjc.nycpcls;
%let d2=fjc.nycpcls;
%let d3=fjc.nycpcls;
%let d4=fjc.nycpcls;
%let d5=fjc.nycpcls;
%let y1=x1;
%let y2=x2;
%let y3=x3;
%let y4=x4;
%let y5=x5;
%let x1=x2 x3 x4 x5;
%let x2=x1 x3 x4 x5;
%let x3=x1 x2 x4 x5;
%let x4=x1 x2 x3 x5;
%let x5=x1 x2 x3 x4;


%macro reg1;
%do i=1 %to 5;
data f&i;
set &&d&i;
run;
title "&&d&i y=&&y&i x=&&x&i";
proc reg data=f&i;
model &&y&i=&&x&i;
output out=a&i p=p r=r l95=l95 u95=u95;
run;
proc print data=a&i(keep=date &&y&i p r l95 u95);
run;
proc gplot data=a&i;
plot &&y&i*date=1 p*date=2 l95*date=3 u95*date=3/overlay cframe=pink;
symbol1 v=dot c=red;
symbol2 v=star c=blue;
symbol3 v=none c=blue i=spline;
run;
title "&&d&i y=&&y&i x=&&x&i";
%let plotitop=gopts=cback=blue, color=white, cframe=yellow;
title "&&d&i y=&&y&i x=&&x&i labelvar=date";
%plotit(data=a&i, plotvars=x2 x1,
        labelvar=date, colors=blue);
title "&&d&i y=&&y&i x=&&x&i labelvar=&&y&i";
%plotit(data=a&i, plotvars=x2 x1,
        labelvar=&&y&i, colors=red);
title "&&d&i y=&&y&i x=&&x&i labelvar=p";
%plotit(data=a&i, plotvars=x2 x1,
        labelvar=p, colors=purple);
title "&&d&i y=&&y&i x=&&x&i labelvar=r";
%plotit(data=a&i, plotvars=x2 x1,
        labelvar=r, colors=magenta);
run;
%end;
%mend;

%reg1;








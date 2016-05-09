%let d1=fjc.gjxuexiao1s;
%let d2=fjc.gjxuexiao1s;
%let d3=fjc.gjxuexiao1s;
%let d4=fjc.gjxuexiao1s;
%let d5=fjc.gjxuexiao1s;
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
t=_n_;
run;
title "&&d&i y=&&y&i x=&&x&i";
proc reg data=f&i;
model &&y&i=&&x&i;
output out=a&i p=p r=r student=student l95=l95 u95=u95 l95m=l95m
u95m=u95m cookd=cookd h=h press=press dffits=dffits;
run;
title "&&d&i y=&&y&i x=&&x&i";
%let plotitop=gopts=cback=green, color=white, cframe=yellow;
title "&&d&i y=&&y&i x=&&x&i labelvar=date";
%plotit(data=a&i, plotvars=x1 x2,
        labelvar=date, colors=blue);
title "&&d&i y=&&y&i x=&&x&i labelvar=&&y&i";
%plotit(data=a&i, plotvars=x1 x2,
        labelvar=&&y&i, colors=red);
title "&&d&i y=&&y&i x=&&x&i labelvar=p";
%plotit(data=a&i, plotvars=x1 x2,
        labelvar=p, colors=purple);
title "&&d&i y=&&y&i x=&&x&i labelvar=r";
%plotit(data=a&i, plotvars=x1 x2,
        labelvar=r, colors=magenta);
run;
%end;
%mend;

%reg1;




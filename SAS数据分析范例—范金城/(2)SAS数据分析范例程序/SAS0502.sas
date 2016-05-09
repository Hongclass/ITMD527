%let d1=fjc.dqrk;
%let d2=fjc.dqrk;
%let c1=x1 x2 x3;
%let c2=x2 x3;
%let i1=d;
%let i2=d;


%macro princomp(x);
%do i=1 %to 2;
title "princomp &&d&i var=&&c&i";
data f&i;
set &&d&i;
run;
proc princomp data=f&i out=a&i;
var &&c&i;
run;
proc sort data=a&i;
by prin1;
proc print;
id &&i&i;
var prin1;
run;
title "princomp &&d&i var=&&c&i";
proc gplot data=a&i;
plot prin1*&&i&i prin2*&&i&i /overlay caxis=blue ctext=blue cframe=magenta
hminor=0 legend=legend1;
plot prin2*prin1/ caxis=blue ctext=blue cframe=cyan
hminor=0 legend=legend1;
symbol1 v=dot c=yellow;
symbol2 v=circle c=yellow;
symbol3 v=diamond c=yellow;
legend1 down=3 position=(&x) cblock=blue frame value=(f=duplex)
label=(f=duplex h=1.5);
%let plotitop=gopts=cback=orange, color=white, cframe=yellow;
%plotit(data=a&i, labelvar=d,
        plotvars=Prin2 Prin1,colors=blue,cframe=yellow);
run;
%end;
%mend;


%princomp(top);










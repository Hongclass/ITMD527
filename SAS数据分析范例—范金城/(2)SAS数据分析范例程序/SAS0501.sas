%let d1=fjc.dqrjsr;
%let c1=x1 x2 x3 x4 x5 x6;
%let i1=d;

%macro princomp(x);
%do i=1 %to 1;
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
plot prin1*&&i&i prin2*&&i&i prin3*&&i&i/overlay caxis=black ctext=black cframe=magenta
hminor=0 legend=legend1;
plot prin2*prin1/ caxis=blue ctext=blue cframe=green
hminor=0 legend=legend1;
symbol1 v=dot c=yellow;
symbol2 v=circle c=yellow;
symbol3 v=diamond c=yellow;
legend1 down=3 position=(&x) cblock=blue frame value=(f=duplex)
label=(f=duplex h=1.5);
%plotit(data=a&i, labelvar=&&i&i,
        plotvars=Prin1 x1, color=black, colors=blue,cframe=yellow);
run;
%end;
%mend;


%princomp(right);
%princomp(leftt);
%princomp(bottom);








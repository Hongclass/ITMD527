%let d1=sas.dqrk;
%let d2=sas.dqrk;
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
plot prin1*&&i&i prin2*&&i&i/overlay caxis=black ctext=black cframe=ligr
hminor=0 legend=legend1;
plot prin2*prin1/ caxis=black ctext=black cframe=ligr
hminor=0 legend=legend1;
symbol1 v=dot c=black;
symbol2 v=circle c=black;
legend1 down=3 position=(&x) cblock=black frame value=(f=duplex)
label=(f=duplex h=1.5);
%plotit(data=a&i, labelvar=&&i&i,
plotvars=Prin2 Prin1 , color=black, colors=black,font=Italic);
run;
%end;
%mend;

%princomp(bottom);
%princomp(top);
%princomp(right);
%princomp(left);




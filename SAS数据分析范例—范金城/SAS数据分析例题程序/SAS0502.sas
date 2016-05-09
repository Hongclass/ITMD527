%let d1=fjc.nlmyzzs;
%let c1=x1 x2 x3 x4 x5;
%let i1=date;
%let b1=x2 x1;

%macro princomp(x);
%do i=1 %to 1;
title "princomp &&d&i var=&&c&i";
proc princomp data=&&d&i out=a&i;
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
plot prin1*&&i&i prin2*&&i&i/overlay caxis=blue ctext=blue cframe=magenta
hminor=0 legend=legend1;
symbol1 v=dot c=yellow;
symbol2 v=circle c=white;
legend1 down=3 position=(&x) cblock=blue frame value=(f=duplex)
label=(f=duplex h=1.5);
run;
%end;
%mend;


%princomp(left);










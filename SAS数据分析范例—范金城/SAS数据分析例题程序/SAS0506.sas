%let d1=fjc.dqsczz0;
%let c1=x1 x2 x3 x6;

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
id d;
var prin1;
run;
title "princomp &&d&i var=&&c&i";
proc gplot data=a&i;
plot prin1*d prin2*d /overlay caxis=blue ctext=blue cframe=magenta
hminor=0 legend=legend1;
plot prin1*x1 prin2*x1 /overlay caxis=blue ctext=blue cframe=orange
hminor=0 legend=legend1;
symbol1 v=dot c=blue;
symbol2 v=circle c=blue;
symbol3 v=diamond c=blue;
legend1 down=3 position=(&x) cblock=blue frame value=(f=duplex)
label=(f=duplex h=1.5);
run;
%end;
%mend;


%princomp(top);










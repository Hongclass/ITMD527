%let d1=fjc.xuesen05s;
%let d2=fjc.xuesen05s;
%let d3=fjc.xuesen05s;
%let y1=x1;
%let y2=x2;
%let y3=x3;
%let x1=x2 x3 x4;
%let x2=x1 x3 x4;
%let x3=x1 x2 x4;

%macro rsreg(cframe,x);
%do i=1 %to 3;
data f&i;
set &&d&i;
run;
title "&&d&i y=&&y&i x=&&x&i";
proc rsreg data=f&i out=a&i;
model &&y&i=&&x&i/actual predict l95 u95; 
id date;
proc print data=a&i;
run;
symbol1 v=dot i=none c=red pointlabel;
symbol3 v=star i=join c=blue;
symbol2 v=none i=join c=green;
symbol4 v=none i=join c=green;
data g&i;
merge f&i a&i;
run;
proc gplot data=g&i;
plot date*&&y&i=_type_/caxis=blue ctext=blue cframe=&cframe
hminor=0 legend=legend1;
legend1 down=3 position=(&x) cblock=green frame value=(f=duplex)
label=(f=duplex h=1.5);
run;
%end;
%mend;

%rsreg(pink,bottom);


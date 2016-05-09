%let d1=fjc.gnsczzs;
%let d2=fjc.gnsczzs;
%let d3=fjc.gnsczzs;
%let c1=x2;
%let c2=x3;
%let c3=x4;
%let b1=x5 x6 x7 x8 x10;
%let b2=x4 x5 x6 x8 x10;
%let b3=x2 x7 x8 x10;

%macro rsreg(cframe,x);
%do i=1 %to 3;
title "&&d&i y=&&c&i x=&&b&i";
proc rsreg data=&&d&i out=a&i;
model &&c&i=&&b&i/actual predict l95 u95; 
id date;
proc print data=a&i;
run;
symbol1 v=dot i=none c=red;
symbol3 v=star i=join c=blue;
symbol2 v=none i=join c=green;
symbol4 v=none i=join c=green;
proc gplot data=a&i;
plot &&c&i*date=_type_/caxis=blue ctext=blue cframe=&cframe
hminor=0 legend=legend1;
legend1 down=3 position=(&x) cblock=blue frame value=(f=duplex)
label=(f=duplex h=1.5);
run;
%end;
%mend;

%rsreg(pink,bottom);


%let d1=fjc.weisenryans;
%let d2=fjc.weisenryans;
%let d3=fjc.weisenryans;
%let y1=x1;
%let y2=x2;
%let y3=x3;
%let x1=date x2 x3 x4 x5;
%let x2=date x1 x3 x4 x5;
%let x3=date x1 x2 x4 x5;


%macro rsreg(cframe,x);
%do i=1 %to 3;
title "&&d&i to=qtr out=out&i";
proc expand data=&&d&i out=f&i to=qtr;
convert x1 x2 x3 x4 x5/observed=average;
id date;
proc print data=f&i;
run;
title "&&d&i to=qtr y=&&y&i x=&&x&i";
proc rsreg data=f&i out=a&i;
model &&y&i=&&x&i/actual predict l95 u95;
run; 
symbol1 v=dot i=none c=red;
symbol3 v=star i=join c=blue;
symbol2 v=none i=join c=green;
symbol4 v=none i=join c=green;
proc gplot data=a&i;
plot &&y&i*date=_type_/caxis=blue ctext=blue cframe=&cframe
hminor=0 legend=legend1;
legend1 down=2 position=(&x) cblock=blue frame value=(f=duplex)
label=(f=duplex h=1.0);
run;
%end;
%mend;


%rsreg(cyan,left);

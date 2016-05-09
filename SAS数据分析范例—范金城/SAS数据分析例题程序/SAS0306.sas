%let d1=fjc.gnsczzgc;
%let d2=fjc.gnsczzgc;
%let d3=fjc.gnsczzgc;
%let d4=fjc.gnsczzgc;
%let x1=x3 x4 x5 x6 x7 x8;
%let x2=x2 x4 x5 x6 x7 x8;
%let x3=x3 x4 x5;
%let x4=x2 x5 x7 x8;
%let y1=x2;
%let y2=x3;
%let y3=x2;
%let y4=x3;

%macro rsreg;
%do i=1 %to 4;
title "&&d&i y=&&y&i x=&&x&i";
proc rsreg data=&&d&i out=a&i;
model &&y&i=&&x&i/actual predict l95 u95; 
id date;
proc print data=a&i(keep= _TYPE_ &&y&i);
run;
symbol1 v=dot i=none c=red;
symbol3 v=star i=join c=blue;
symbol2 v=none i=join c=green;
symbol4 v=none i=join c=green;
proc gplot data=a&i;
plot &&y&i*date=_type_/caxis=blue ctext=blue cframe=yellow;
run;
%end;
%mend;

%rsreg;


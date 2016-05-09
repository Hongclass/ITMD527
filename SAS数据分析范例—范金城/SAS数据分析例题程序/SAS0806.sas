%let d1=fjc.sczz0;
%let c1=x1 x2 x3;

%macro forecast;
%do i=1 %to 1;
%do lead=20 %to 30 %by 10;
title "forecast &&d&i lead=&lead";
proc forecast data=&&d&i lead=&lead  interval=qtr out=pred method=expo nstart=30 outall;
id date;
var &&c&i;
run;
data g&i;
merge &&d&i pred;
run;
proc print data=g&i(keep=date x1 _type_ );
run;
title "forecast plot &&d&i lead=&lead";
proc gplot data=g&i;
plot x1*date=_type_/cframe=pink;
plot x2*date=_type_/cframe=yellow;
plot x3*date=_type_/cframe=cyan;
symbol1 v=dot i=none c=red;  /* for _type_=ACTUAL*/
symbol2 v=star i=join c=green;  /* for _type_=FORECAST*/
symbol3 v=none i=join c=blue;  /* for _type_=STD*/
symbol4 v=dot i=join c=green;  /* for _type_=RESIDUAL*/
symbol5 v=none i=join c=blue;  /* for _type_=L95*/
symbol6 v=none i=join c=blue;  /* for _type_=U95*/
run;
%end;
%end;
%mend;

%forecast;



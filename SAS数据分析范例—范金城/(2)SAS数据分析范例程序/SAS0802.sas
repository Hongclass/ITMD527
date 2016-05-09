%let d1=fjc.c7d31;
%let c1=x y;

%macro forecast;
%do i=1 %to 1;
%do lead=20 %to 30 %by 10;
title "forecast &&d&i lead=&lead";
proc forecast data=&&d&i lead=&lead  interval=month out=pred outfull;
id date;
var &&c&i;
run;
data g&i;
merge &&d&i pred;
run;
proc print data=g&i(keep=date x y _type_ );
run;
title "forecast plot &&d&i lead=&lead";
proc gplot data=g&i;
plot x*date=_type_/cframe=pink;
plot y*date=_type_/cframe=yellow;
symbol1 v=dot i=none c=red;  /* for _type_=ACTUAL*/
symbol2 v=plus i=join c=green;  /* for _type_=FORECAST*/
symbol3 v=none i=join c=blue;  /* for _type_=L95*/
symbol4 v=none i=join c=blue;  /* for _type_=U95*/
run;
%end;
%end;
%mend;

%forecast;

 

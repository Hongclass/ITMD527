%let d1=sas.dead0;
%let c1=x;

%macro forecast;
%do i=1 %to 1;
%do lead=5 %to 20 %by 5;
title "forecast &&d&i lead=&lead";
proc forecast data=&&d&i lead=&lead  interval=month out=pred method=winters seasons=month outall;
id date;
var &&c&i;
run;
data g&i;
merge &&d&i pred;
run;
proc print data=g&i(keep=date x _type_ );
run;
title "forecast plot &&d&i lead=&lead";
proc gplot data=g&i;
plot x*date=_type_/cframe=ligr;
symbol1 v=dot i=none c=black;  /* for _type_=ACTUAL*/
symbol2 v=star i=join c=black;  /* for _type_=FORECAST*/
symbol3 v=none i=join c=black;  /* for _type_=STD*/
symbol4 v=dot i=join c=grey;  /* for _type_=RESIDUAL*/
symbol5 v=none i=join c=grey;  /* for _type_=L95*/
symbol6 v=none i=join c=grey;  /* for _type_=U95*/
run;
%end;
%end;
%mend;

%forecast;



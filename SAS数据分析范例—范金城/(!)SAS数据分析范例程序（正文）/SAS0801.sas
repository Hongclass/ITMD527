%let d1=sas.gnsczzgc;
%let c1=x2-x8;

%macro forecast;
%do i=1 %to 1;
title "forecast &&d&i";
proc forecast data=&&d&i lead=10  interval=year out=pred outfull;
id date;
var &&c&i;
run;
data g&i;
merge &&d&i pred;
run;
proc print data=g&i(keep=date x2 x3 x6 _type_ );
run;
title "forecast plot &&d&i";
proc gplot data=g&i;
plot x2*date=_type_/cframe=ligr;
plot x3*date=_type_/cframe=ligr;
plot x4*date=_type_/cframe=ligr;
plot x5*date=_type_/cframe=ligr;
plot x6*date=_type_/cframe=ligr;
plot x7*date=_type_/cframe=ligr;
plot x8*date=_type_/cframe=ligr;
symbol1 v=dot i=none c=black;  /* for _type_=ACTUAL*/
symbol2 v=plus i=join c=black;  /* for _type_=FORECAST*/
symbol3 v=none i=join c=grey;  /* for _type_=L95*/
symbol4 v=none i=join c=grey;  /* for _type_=U95*/
run;
%end;
%mend;

%forecast;


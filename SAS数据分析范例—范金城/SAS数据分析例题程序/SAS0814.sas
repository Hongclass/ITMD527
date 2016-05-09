%let d1=fjc.usecon;
%let c1=durables nondur;


%macro forecast;
%do i=1 %to 1;
%do lead=12 %to 12;
data f&i;
set &&d&i;
format date monyy7.;
run; 
proc gplot data=f&i;
symbol i=spline v=star;
plot durables*date/cframe=cyan;
plot nondur*date/cframe=cyan;
where date>='1jan1980'd;
format date monyy7.;
run;
title "forecast &&d&i lead=&lead";
proc forecast data=f&i lead=&lead out=pred interval=month method=stepar trend=2  outfull outresid;
id date;
where date>='1jan1980'd;
var &&c&i;
run;
data g&i;
merge f&i pred;
run;
proc print data=g&i(keep=date &&c&i _TYPE_ _LEAD_);
run;
title "forecast plot &&d&i lead=&lead";
proc gplot data=g&i;
plot durables*date=_type_/cframe=yellow;
plot nondur*date=_type_/cframe=yellow;
where _type_='RESIDUAL';
symbol i=needle c=blue;
run;
proc gplot data=g&i;
plot durables*date=_type_/cframe=pink;
plot nondur*date=_type_/cframe=pink;
where _type_ ^= 'RESIDUAL' & date >= '1jan1987'd;
symbol1 v=star i=none c=red;  /* for _type_=ACTUAL*/
symbol2 v=plus i=spline c=purple;  /* for _type_=FORECAST*/
symbol3 v=none i=spline c=blue;  /* for _type_=L95*/
symbol4 v=none i=spline c=blue;  /* for _type_=U95*/
run;
%end;
%end;
%mend;

%forecast;

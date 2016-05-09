%let d1=fjc.jmcxck0;
%let c1=y1 y2 y3;

%macro forecast;
%do i=1 %to 1;
%do lead=5 %to 20 %by 5;
data f&i;
set &&d&i;
format date yyqc6.;
run; 
proc gplot data=f&i;
symbol i=join v=dot;
plot y1*date/cframe=cyan;
plot y2*date/cframe=cyan;
plot y3*date/cframe=cyan;
where date>='1jan1990'd;
format date yyqc6.;
run;
title "forecast &&d&i lead=&lead";
proc forecast data=f&i lead=&lead out=pred interval=qtr  outfull outresid;
id date;
where date>='1jan1990'd;
var &&c&i;
run;
data g&i;
merge f&i pred;
run;
proc print data=g&i(keep=date &&c&i _TYPE_ _LEAD_);
run;
title "forecast plot &&d&i lead=&lead";
proc gplot data=g&i;
plot y1*date=_type_/cframe=yellow;
plot y2*date=_type_/cframe=yellow;
plot y3*date=_type_/cframe=yellow;
where _type_='RESIDUAL';
symbol i=needle c=blue;
run;
proc gplot data=g&i;
plot y1*date=_type_/cframe=pink;
plot y2*date=_type_/cframe=pink;
plot y3*date=_type_/cframe=pink;
where _type_ ^= 'RESIDUAL' & date >= '1jan1866'd;
symbol1 v=dot i=join c=red;  /* for _type_=ACTUAL*/
symbol2 v=dot i=join c=purple;  /* for _type_=FORECAST*/
symbol3 v=none i=join c=blue;  /* for _type_=L95*/
symbol4 v=none i=join c=blue;  /* for _type_=U95*/
run;
%end;
%end;
%mend;

%forecast;
 

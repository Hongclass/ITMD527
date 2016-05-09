%let d1=fjc.pigs;
%let c1=x;

%macro forecast;
%do i=1 %to 1;
%do lead=10 %to 30 %by 5;
title "forecast &&d&i lead=&lead";
proc forecast data=&&d&i lead=&lead  interval=year out=pred  outall;
id date;
var &&c&i;
run;
data g&i;
merge &&d&i pred;
run;
proc print data=g&i(keep=date x _type_ _lead_ );
run;
title "forecast plot &&d&i lead=&lead";
proc gplot data=g&i;
plot x*date=_type_/cframe=pink;
symbol1 v=dot i=none c=red;  
symbol2 v=star i=join c=green;  
symbol3 v=none i=join c=blue; 
symbol4 v=dot i=needle c=green; 
symbol5 v=none i=join c=blue; 
symbol6 v=none i=join c=blue;   
run;
%end;
%end;
%mend;

%forecast;



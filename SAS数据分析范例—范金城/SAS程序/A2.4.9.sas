%let d1=sas.c7d31;
%let c1=x y;
%let a1=5 9 15 18;


%macro forecast;
%let k=1;
%let n=%scan(&a1,&k);
%do %while(&n ne);
title "forecast lead=&n";
proc forecast data=&d1 lead=&n  interval=month out=pred method=winters seasons=month outall;
id date;
var &c1;
run;
proc print data=pred;
run;
 %let k=%eval(&k+1);
 %let n=%scan(&a1,&k);
%end;
%mend;


%forecast;

 

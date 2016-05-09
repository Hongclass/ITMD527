%let d1=sas.c7d31;
%let a1=grey ligr black;

%macro plot;
%let k=1;
%let n=%scan(&a1,&k);
%do %while(&n ne);
title "plot l=&n";
proc gplot data=&d1;
plot x*date/cframe=&n;
symbol v=dot i=join c=white  w=2;
run;
 %let k=%eval(&k+1);
 %let n=%scan(&a1,&k);
%end;
%mend;


%plot



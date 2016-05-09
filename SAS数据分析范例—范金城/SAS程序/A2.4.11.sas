%let d1=sas.gnsczzgc2;
%let a1=x2 x3 x4 x5 x6 x7 x8;

%macro plot;
%let k=1;
%let n=%scan(&a1,&k);
%do %while(&n ne);
title "plot a=&n";
proc gplot data=&d1;
plot &n*date=c/cframe=grey;
symbol1 v=dot i=jion c=white w=2;
symbol2 v=square i=jion c=white w=2;
symbol3 v=triangle i=jion c=white w=2;
run;
 %let k=%eval(&k+1);
 %let n=%scan(&a1,&k);
%end;
%mend;


%plot



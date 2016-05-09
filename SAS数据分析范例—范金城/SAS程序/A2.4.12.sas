%let d1=sas.dqnlmy2;
%let a1=x1 x2 x3 x4 x5;

%macro plot;
%let k=1;
%let n=%scan(&a1,&k);
%do %while(&n ne);
title "plot a1=&n";
proc gplot data=&d1;
plot d*&n=c/cframe=ligr;
symbol1 v=dot i=none c=white pointlabel;
symbol2 v=square i=none c=white pointlabel;
symbol3 v=triangle i=none c=white pointlabel;
run;
 %let k=%eval(&k+1);
 %let n=%scan(&a1,&k);
%end;
%mend;

%plot




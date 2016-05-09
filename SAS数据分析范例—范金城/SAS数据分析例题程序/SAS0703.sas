
%let d1=fjc.iris;
%let c1=sepallength sepalwidth petallength petalwidth;
%let b1=species;

%macro discrim(k,priors);
%do i=1 %to 1;
data f&i;
set &&d&i;
run;
%let k1=1;
%let n=%scan(&k,&k1);
%do %while(&n ne);
title "&&d&i discrim npar k=&n priors=&priors";
proc discrim data=f&i method=npar k=&n out=a1 outstat=a2 outcross=a3 listerr crosslisterr;
class &&b&i;
var &&c&i;
priors &priors;
run;
%let k1=%eval(&k1+1);
   %let n=%scan(&k,&k1);
%end;
%end;
%mend;



%discrim(3 5 7,equal);

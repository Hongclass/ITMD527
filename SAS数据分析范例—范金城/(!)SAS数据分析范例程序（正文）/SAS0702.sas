%let d1=sas.iris;
%let c1=sepallength sepalwidth petallength petalwidth;
%let b1=species;
%let e1=can1 can2;

%macro discrim(method,priors);
%do i=1 %to 1;
data f&i;
set &&d&i;
run;
title "&&d&i candisc-discrim method=&method priors=&priors";
proc candisc data=f&i out=b&i;
class &&b&i;
var &&c&i;
run;
proc discrim data=b&i method=&method out=a1 outstat=a2 outcross=a3 listerr crosslisterr;
class &&b&i;
var &&e&i;
priors &priors;
run;
symbol1 v='1' font=Italic c=white;   
symbol2 v='2' font=Italic c=white;
symbol3 v='3' font=Italic c=white;
proc gplot data=a3;
plot can2*can1=species/cframe=grey;
plot can2*can1=_INTO_/cframe=black;
run;
%end;
%mend;

%discrim(normal,prop);

                               


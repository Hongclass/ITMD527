%let d1=fjc.poverty1;
%let c1=birth death infantdeath;
%let b1=y;

%macro discrim(method,priors);
%do i=1 %to 1;
data f&i;
set &&d&i;
run;
title "&&d&i discrim method=&method priors=&priors";
proc discrim data=f&i method=&method out=a1 outstat=a2 outcross=a3 listerr crosslisterr;
class &&b&i;
var &&c&i;
id country;
priors &priors;
run;
%end;
%mend;



%discrim(npar k=5,prop);

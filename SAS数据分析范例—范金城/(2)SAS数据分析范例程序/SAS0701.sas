%let d1=fjc.bd1;
%let d2=fjc.bd3;
%let d3=fjc.bd4;

%macro discrim(method,priors);
%do i=1 %to 3;
title "discrim &&d&i method=&method priors=&priors";
proc discrim data=&&d&i method=&method out=a1 outstat=a2 outcross=a3 listerr crosslisterr;
class y;
var birth death;
id country;
priors &priors;
run;
%end;
%mend;

%discrim(normal,equal);
%discrim(normal,prop);
%discrim(npar k=10,equal);
%discrim(npar k=10,prop);

%let d1=fjc.bd1(obs=20);
%let d2=fjc.bd3(obs=20);
%let d3=fjc.bd4(obs=20);
%let c1=birth death;
%let c2=birth death;
%let c3=birth death;
%let b1=y;
%let b2=y;
%let b3=y;
%let e1=can1;
%let e2=can1 can2;
%let e3=can1 can2;

%macro discrim(method,priors);
%do i=1 %to 3;
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
id country;
priors &priors;
run;
proc gplot data=a3;
plot country*can1=y/cframe=yellow;
plot country*can1=_INTO_/cframe=pink;
symbol v=dot pointlabel;
%end;
%mend;



%discrim(normal,prop);
%discrim(normal,equal);

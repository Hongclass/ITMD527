%let d1=fjc.jmxfzs1;
%let d2=fjc.jmxfzs2;
%let c1=x x1 x2;
%let c2=x x1 x2;
%let b1=y;
%let b2=y;



%macro discrim(method,priors);
%do i=1 %to 2;
data f&i;
set &&d&i;
run;
title "&&d&i discrim method=&method priors=&priors";
proc discrim data=f&i method=&method out=a1 outstat=a2 outcross=a3 list crosslist;
class &&b&i;
var &&c&i;
id year;
priors &priors;
run;
%end;
%mend;


%discrim(normal,equal);
%discrim(normal,prop);
%discrim(npar r=5,prop);
%discrim(npar r=5,equal);

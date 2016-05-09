%let d1=fjc.dqgx1;
%let d2=fjc.dqgx2;
%let d3=fjc.dqgx3;
%let d4=fjc.dqgx4;
%let d5=fjc.dqgx5;
%let c1=x1 x2 x3 x4 x5 x6;
%let c2=x1 x2 x3 x4 x5 x6;
%let c3=x1 x2 x3 x4 x5 x6;
%let c4=x1 x2 x3 x4 x5 x6;
%let c5=x1 x2 x3 x4 x5 x6;
%let e1=can1;
%let e2=can1 can2;
%let e3=can1 can2 can3;
%let e4=can1 can2 can3 can4;
%let e5=can1 can2 can3 can4;
%let b1=c;
%let b2=c;
%let b3=c;
%let b4=c;
%let b5=c;

%macro discrim(priors);
%do i=1 %to 5;
data f&i;
set &&d&i;
run;
title "&&d&i discrim priors=&priors";
proc candisc data=f&i out=b&i;
class c;
var  &&c&i;
run;
proc discrim data=b&i out=a1 outstat=a2 outcross=a3 listerr crosslisterr;
class &&b&i;
var &&e&i;
id d;
priors &priors;
run;
%end;
%mend;



%discrim(equal);
%discrim(prop);

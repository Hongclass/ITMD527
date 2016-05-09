%let d1=fjc.dqgz;
%let d2=fjc.dqgz;
%let d3=fjc.dqgz;
%let d4=fjc.dqgz;
%let a1=x1 x2 x3 x4 x5 x6;
%let a2=x1 x2 x3 x4 x5 x6;
%let a3=x1 x2 x3 x4 x5 x6;
%let a4=x1 x2 x3 x4 x5 x6;
%let b1=x1;
%let b2=x2;
%let b3=x3;
%let b4=x4;
%let e1=d;
%let e2=d;
%let e3=d;
%let e4=d;

%macro gplot(cframe,maxc,x);
%do i=1 %to 4;
data f&i;
set &&d&i;
t=_n_;
run;
proc fastclus data=f&i summary maxc=&maxc cluster=c out=out;
var &&a&i;
id &&e&i;
run;
proc sort data=out;
by c;
run;
proc print data=out(keep=d c);
run;
proc gplot data=out;
plot &&e&i*&&b&i=c / caxis=blue 
ctext=blue cframe=&cframe
hminor=0 legend=legend1;
symbol1 v=dot i=none l=1 h=0.7 pointlabel;
legend1 down=3 position=(&x) cblock=blue frame value=(f=duplex)
label=(f=duplex h=0.7);
title f=zapf c=red h=6pct"fastclus &&d&i var=&&a&i maxc=&maxc";
run;
%end;
%mend;

%gplot(pink,2,bottom left);
%gplot(yellow,3,bottom right);
%gplot(magenta,4,top left);
%gplot(orange,5,top right);
%gplot(pink,6,top center);
%gplot(yellow,7,bottom center);



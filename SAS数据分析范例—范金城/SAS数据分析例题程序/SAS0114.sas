%let d1=fjc.dqlyrs;
%let d2=fjc.dqlyrs;
%let d3=fjc.dqlyrs;
%let d4=fjc.dqlyrs;
%let a1=x1 x2 x3 x4;
%let a2=x1 x2 x3 x4;
%let a3=y1 y2 y3 y4;
%let a4=y1 y2 y3 y4;
%let b1=x1;
%let b2=x3;
%let b3=y1;
%let b4=y3;
%let c1=x2;
%let c2=x4;
%let c3=y2;
%let c4=y4;
%let e1=d;
%let e2=d;
%let e3=d;
%let e4=d;

%macro gplot(cframe,maxc,x);
%do i=1 %to 4;
data f&i;
set &&d&i(obs=16);
t=_n_;
run;
proc fastclus data=f&i summary maxc=&maxc cluster=c list out=out;
var &&a&i;
id &&e&i;
run;
proc gplot data=out;
plot &&e&i*&&b&i=c &&e&i*&&c&i=c / caxis=blue 
ctext=blue cframe=&cframe
hminor=0 legend=legend1;
symbol1 v=dot i=none l=1 h=0.7 pointlabel;
legend1 down=3 position=(&x) cblock=blue frame value=(f=duplex)
label=(f=duplex h=0.7);
title f=zapf c=red h=5pct"fastclus &&d&i var=&&a&i maxc=&maxc";
run;
%end;
%mend;

%gplot(pink,2,bottom left);
%gplot(yellow,3,bottom right);
%gplot(magenta,4,top left);
%gplot(orange,5,top right);
%gplot(pink,3,top center);
%gplot(yellow,4,bottom center);



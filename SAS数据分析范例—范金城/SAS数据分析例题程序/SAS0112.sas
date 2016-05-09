%let d1=fjc.xucpcl1s;
%let d2=fjc.xucpcl2s;
%let c1=x1; %let b1=x2; %let a1=x3; 
%let c2=x1; %let b2=x5; %let a2=x7;   
%let e1=date;
%let e2=date;

%macro gplot(cframe,maxc,x);
%do i=1 %to 2;
data f&i;
set &&d&i;
t=_n_;
x1=&&c&i; 
x2=&&b&i;
x3=&&a&i;
run;
proc fastclus data=f&i summary maxc=&maxc cluster=c list out=out;
var x1 x2 x3;
run;
proc gplot data=out;
plot &&e&i*x1=c &&e&i*x2=c &&e&i*x3=c/ caxis=blue ctext=blue cframe=&cframe
hminor=0 legend=legend1;
symbol1 v=dot i=none pointlabel;
legend1 down=3 position=(&x) cblock=blue frame value=(f=duplex)
label=(f=duplex h=1.5);
title f=zapf c=red h=5pct"fastclus &&d&i maxc=&maxc";
run;
%end;
%mend;


%gplot(pink,2,right);
%gplot(yellow,3,left);
%gplot(ligr,4,bottom);
%gplot(orange,5,top);



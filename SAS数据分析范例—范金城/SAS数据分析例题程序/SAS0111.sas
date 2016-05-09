%let d1=fjc.jmcxck03;
%let d2=fjc.jmcxck04;
%let c1=x1; %let b1=x2; %let a1=x3;
%let c2=x1; %let b2=x2; %let a2=x3;   


%macro gplot(cframe,x);
%do i=1 %to 2;
data f&i;
set &&d&i;
x1=&&c&i; 
x2=&&b&i;
x3=&&a&i;
run;
proc gplot data=f&i;
plot x1*date=1 x2*date=2 x3*date=3/ overlay caxis=blue ctext=blue cframe=&cframe
hminor=0 legend=legend1;
symbol1 v=dot i=join c=red l=1;
symbol2 v=square i=join c=green l=2;
symbol3 v=triangle i=join c=magenta l=3;
legend1 down=3 position=(&x) cshadow=blue frame value=(f=duplex)
label=(f=duplex h=1.5);
title f=zapf c=blue h=5pct"&&d&i";
proc gplot data=f&i;
plot x1*date=c x2*date=c x3*date=c/ caxis=blue ctext=blue cframe=&cframe
hminor=0 legend=legend1;
symbol1 v=dot i=join c=red l=1;
symbol2 v=square i=join c=green l=2;
symbol3 v=triangle i=join c=magenta l=3;
symbol4 v=diamond i=join c=blue l=4;
symbol5 v=star i=join c=purple l=5;

legend1 down=3 position=(&x) cshadow=blue frame value=(f=duplex)
label=(f=duplex h=1.5);
title f=zapf c=blue h=5pct"&&d&i";
run;
%end;
%mend;

%gplot(pink,bottom left);
%gplot(yellow,bottom right);
%gplot(cyan,top left);
%gplot(orange,top right);



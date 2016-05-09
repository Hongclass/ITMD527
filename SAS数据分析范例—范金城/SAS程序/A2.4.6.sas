%let d1=sas.gnsczzgc;
%let d2=sas.dqnlmy2;
%let c1=x2;
%let c2=x3;
%let i1=year;
%let i2=d;


%macro plot(i);
%do i=1 %to &i;
%do j=1 %to 2;
proc gplot data=&&d&j;
plot &&i&j*&&c&j/cframe=ligr;
symbol v=dot i=none c=black pointlabel;
run;
%end;
%end;
%mend;

%plot(3)

  

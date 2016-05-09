%let d1=sas.gnsczzgc;
%let d2=sas.dqnlmy2;
%let c1=x2;
%let c2=x3;
%let i1=year;
%let i2=d;
%let b1=grey;
%let b2=black;

%macro plot;
%do i=1 %to 2;
proc gplot data=&&d&i;
plot &&i&i*&&c&i/cframe=&&b&i;
symbol v=dot i=none c=white;
run;
%end;
%mend;


%plot 



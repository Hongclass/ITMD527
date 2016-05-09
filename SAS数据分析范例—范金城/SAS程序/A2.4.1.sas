 %let d1=sas.gnsczzgc;
%let d2=sas.dqnlmy2;
%let c1=x2;
%let c2=x3;

%macro plot(i);
%do i=1 %to &i;
proc gplot data=&d1;
plot &c1*year/cframe=black;
symbol v=dot i=none c=white;
proc gplot data=&d2;
plot d*&c2/cframe=grey;
symbol v=dot i=none c=white;
run;
%end;
%mend;

%plot(2)

   



 

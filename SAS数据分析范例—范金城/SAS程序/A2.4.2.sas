%let d1=sas.gnsczzgc(obs=10);
%let d2=sas.dqnlmy2(obs=10 drop=y1 y2 y3 y4 y5);
%macro print;
%do i=1 %to 2;
proc print data=&&d&i;
run;
%end;
%mend;


%print 

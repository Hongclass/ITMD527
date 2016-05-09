%let d1=sas.dqnlmy2(drop=y1 y2 y3 y4 y5);
%let c1=x3;

%macro print;
proc print data=&d1;
run;
proc sort data=&d1 out=out;
by &c1;
proc print data=out;
run;
%mend;

%print

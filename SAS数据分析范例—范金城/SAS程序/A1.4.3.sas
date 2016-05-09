data a1;
set sas.dqnlmy(keep=d x1 x2); 
proc sort data=a1 out=out;
by d;
proc print data=out;
run;

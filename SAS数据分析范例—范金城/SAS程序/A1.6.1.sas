data a3;
set sas.dqnlmy3(keep=d c x1);
if c='1' then y=2*x1;
else y=3*x1;
proc print data=a3;
run;

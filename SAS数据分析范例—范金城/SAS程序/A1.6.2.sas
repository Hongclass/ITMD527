data a4;
 set sas.dqnlmy2(keep=d c x1);
 if _n_>15 or x1<1000 then y=x1**2;
 else y=2*x1;
 proc print data=a4;
run;

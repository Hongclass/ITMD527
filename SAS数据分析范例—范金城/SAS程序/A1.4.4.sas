data a1;
set sas.gnsczzgcs(keep=date x2 x3 x6 firstobs=10 obs=40);
proc print data=a1;
run;

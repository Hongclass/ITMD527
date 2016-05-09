data a1;
set sas.gnsczzgc2;
if c='2' then delete;
proc print data=a1;
run;


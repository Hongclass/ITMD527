data a1;
set sas.gnsczzgc2;
where=(c='2');
proc print data=a1;
run;

data a2;
set sas.gnsczzgc2;
where=(c='2')&(x2>32);
proc print data=a2;
run;

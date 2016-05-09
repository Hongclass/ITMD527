%let d1=sas.gnsczzgcs(obs=20);
%let c1=x2 x3 x6;
%let i1=date;

proc print data=&d1;
var &c1;
id &i1;
run;

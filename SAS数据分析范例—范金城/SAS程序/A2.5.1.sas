%let d1=sas.sczz;
%let d2=sas.sczzgc;
%let c1=x1 x2 x3;
%let c2=x1 x2 x3;

%macro cluster(method,n);
%do i=1 %to 2;
proc cluster data=&&d&i method=&method  outtree=tree&i;
var &&c&i;
id t;
run;
proc tree data=tree&i space=1 nclusters=&n out=out&i;
proc print data=out&i;
run;
%end;
%mend;

%cluster(average,3);
%cluster(com,4);
%cluster(single,5);
%cluster(med,3);
%cluster(cen,4);
%cluster(ward,5);


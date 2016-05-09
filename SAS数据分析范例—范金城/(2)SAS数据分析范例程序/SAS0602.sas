%let d1=fjc.zyncpcl1s;
%let d2=fjc.zyncpcl2;
%let c1=x1-x8;
%let c2=x1-x8;
%let b1=date; %let a1=x2;
%let b2=date; %let a2=x3;
%let e1=date;
%let e2=date;

%macro clus(method,ncl,cframe);
%do i=1 %to 2;
data f&i;
set &&d&i;
run;
title "clus &&d&i method=&method ncl=&ncl cframe=&cframe";
proc cluster data=f&i method=&method ccc pseudo;
   var &&c&i;
   id &&e&i;
run;
proc tree  ncl=&ncl out=out lines=(width=3 color=red);
   copy &&c&i;
   id &&e&i;
   proc print data=out;
   run;
   proc gplot data=out;
   plot &&a&i*&&b&i=cluster/cframe=&cframe;
   symbol v=dot i=none;
   run;
%end;   
%mend;


%clus(average,3,yellow);
%clus(ward,4,cyan);
%clus(com,6,blue);
%clus(single,7,ligr);
%clus(cen,8,orange);
%clus(med,9,igir);


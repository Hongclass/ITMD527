%let d1=fjc.jiaoxuejf;
%let d2=fjc.kejijf05;
%let c1=x1-x7;
%let c2=x1-x7;
%let b1=x1; %let a1=x2;
%let b2=x1; %let a2=x2;
%let i1=year;
%let i2=year;

%macro clus(method,ncl,cframe);
%do i=1 %to 2;
data f&i;
set &&d&i;
run;
title "clus &&d&i method=&method ncl=&ncl";
proc cluster data=f&i method=&method ccc pseudo;
   var &&c&i;
   id &&i&i;
run;
proc tree  ncl=&ncl out=out lines=(width=3 color=red);
   copy &&c&i;
   id &&i&i;
   run;
 data g&i;
   merge f&i out;
   run;
   proc print data=g&i(keep=&&i&i cluster);
   run;
%let plotitop = gopts=cback=white, color=black, cframe=&cframe;
%plotit(data=g&i, plotvars=year &&a&i,
        labelvar=cluster, typevar=cluster);
%plotit(data=g&i, plotvars=year &&a&i,
        labelvar=&&i&i, typevar=cluster);
%end;   
%mend;


%clus(average,3,yellow);
%clus(ward,4,cyan);
%clus(com,6,pink);
%clus(single,7,ligr);
%clus(cen,8,yellow);
%clus(med,9,pink);


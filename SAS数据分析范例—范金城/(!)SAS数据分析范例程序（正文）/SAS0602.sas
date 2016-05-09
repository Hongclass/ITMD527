%let d1=sas.zyncpcl1s;
%let d2=sas.zyncpcl2;
%let c1=x1-x8;
%let c2=x1-x8;
%let b1=date; %let a1=x2;
%let b2=date; %let a2=x3;
%let e1=date;
%let e2=date;

%macro clus(method,ncl);
%do i=1 %to 2;
data f&i;
set &&d&i;
run;
title "clus &&d&i method=&method ncl=&ncl";
proc cluster data=f&i method=&method ccc pseudo;
   var &&c&i;
   id &&e&i;
run;
proc tree  ncl=&ncl out=out&i lines=(width=3 color=black);
   copy &&c&i;
   id &&e&i;
   proc print data=out&i;
   run;
   proc gplot data=out&i;
   plot &&a&i*&&b&i=cluster/cframe=black;
   symbol1 v='1' font=Italic c=white;   symbol2 v='2' font=Italic c=white;
   symbol3 v='3' font=Italic c=white;   symbol4 v='4' font=Italic c=white;
   symbol5 v='5' font=Italic c=white;   symbol6 v='6' font=Italic c=white;
   run;
%end;   
%mend;


%clus(average,3);
%clus(ward,4);
%clus(com,6);
%clus(single,5);
%clus(cen,4);
%clus(med,6);



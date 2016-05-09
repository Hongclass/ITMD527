symbol v=dot pointlabel;

%let d1=fjc.dqgy(obs=20);
%let d2=fjc.dqgy(firstobs=11);
%let c1=x1-x5;
%let c2=x1-x5;
%let b1=d;
%let b2=d;
%let e1=x1;
%let e2=x1;



%macro clus(method,ncl,cframe);
%do i=1 %to 2;
%let k=1;
%let n=%scan(&ncl,&k);
%do %while(&n ne);
title "clus &&d&i &&e&i method=&method ncl=&n cframe=&cframe";
proc cluster data=&&d&i method=&method ccc pseudo nonorm;
   var &&c&i;
   id &&b&i;
run;
proc tree  ncl=&n out=out horizontal list lines=(width=3 color=red);
   copy &&c&i;
   proc print data=out;
   run;
   proc gplot data=out;
   plot _name_*&&e&i=cluster/cframe=&cframe;
   symbol v=dot i=none;
   run;
    %let k=%eval(&k+1);
   %let n=%scan(&ncl,&k);
%end;
%end;

%mend;

%clus(average,3 4 6,yellow);
%clus(com,2 5 7,pink);
%clus(cen,3 5 8,orange);


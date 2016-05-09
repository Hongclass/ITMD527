%let d1=sas.dqgy(obs=20);
%let d2=sas.dqgy(firstobs=11);
%let c1=x1-x5;
%let c2=x1-x5;
%let b1=d;
%let b2=d;
%let e1=x1;
%let e2=x1;

%macro clus(method,ncl);
%do i=1 %to 2;
%let k=1;
%let n=%scan(&ncl,&k);
%do %while(&n ne);
title "clus &&d&i &&e&i method=&method ncl=&n";
proc cluster data=&&d&i method=&method ccc pseudo nonorm;
   var &&c&i;
   id &&b&i;
run;
proc tree  ncl=&n out=out&i horizontal list lines=(width=3 color=black);
   copy &&c&i;
   proc print data=out&i;
   run;
   proc gplot data=out&i;
   plot _name_*&&e&i=cluster/cframe=ligr;
   symbol1 v='1' font=Italic c=black;   symbol2 v='2' font=Italic c=black;
   symbol3 v='3' font=Italic c=black;   symbol4 v='4' font=Italic c=black;
   symbol5 v='5' font=Italic c=black;   symbol6 v='6' font=Italic c=black;
   run;
    %let k=%eval(&k+1);
   %let n=%scan(&ncl,&k);
%end;
%end;

%mend;

%clus(average,3 4);
%clus(com,2 5);
%clus(cen,3 6);


 




 SYMBOL V=DOT;

%LET D1=FJC.MODECLU4(OBS=20);
%LET D2=FJC.POVERTY(OBS=20);
%LET C1=BIRTH DEATH;
%LET C2=BIRTH DEATH INFANTDEATH;
%LET B1=COUNTRY;
%LET B2=COUNTRY;
%LET F1=DEATH; %LET G1=BIRTH;
%LET F2=DEATH; %LET G2=BIRTH;


%macro clus(method,ncl,cframe);
%do i=1 %to 2;
%let k=1;
%let n=%scan(&ncl,&k);
%do %while(&n ne);
title "clus data=&&d&i method=&method ncl=&n cframe=&cframe";
proc cluster data=&&d&i method=&method ccc pseudo;
   var &&c&i;
   id &&b&i;
run;
proc tree  ncl=&n out=out honrizontal list lines=(width=3 color=red);
   copy &&c&i;
   proc print data=out;
   run;
   proc gplot data=out;
   plot &&f&i*&&g&i=cluster/cframe=&cframe;
   symbol v=dot i=none;
   run;
    %let k=%eval(&k+1);
   %let n=%scan(&ncl,&k);
%end;
%end;

%mend;

%clus(average,3 4 6,yellow);
%clus(ward,2 7 9,cyan);
%clus(com,2 5 8,pink);
%clus(single,3 7 9,ligr);
%clus(cen,3 5 8,orange);
%clus(med,5 7 9,magenta);


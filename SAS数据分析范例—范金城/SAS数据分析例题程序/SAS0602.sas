%let d1=fjc.xuesen;
%let c1=x1 x2 x3;
%let b1=x1; %let a1=x3;
%let e1=t;



%macro fastclus(maxc,cframe);
%do i=1 %to 1;
data f&i;
set &&d&i;
run;
%let k=1;
  %let n=%scan(&maxc,&k);
  %do %while(&n ne);
title1 " &&d&i fastclus maxc=&n cframe=&cframe";
proc fastclus data=f&i summary maxc=&n maxiter=99 converge=0
              mean=mean&i out=prelim cluster=preclus list;
   var &&c&i;
   id &&e&i;
run;
proc print data=prelim;
run;
proc gplot data=prelim;
plot &&a&i*t=preclus/cframe=&cframe;
symbol v=dot i=none;
run;
proc sort data=prelim;
   by preclus;
   proc print;
run;
%macro clus(method);
title "&&d&i clus mean&i maxc=&n method=&method";
proc cluster data=mean&i method=&method ccc pseudo;
   var &&c&i;
   copy preclus;
run;
proc tree ncl=&n horizontal out=out lines=(width=3 color=red);
   copy &&c&i preclus;
   proc print data=out;
   run;
proc sort data=out;
   by preclus;
run;
data clus;
   merge prelim out;
   by preclus;
   proc print data=clus(drop=_obstat_);
run;

%mend;

%clus(average);
%clus(ward);
%clus(com);
%clus(single);
%clus(cen);
%clus(med);

%let k=%eval(&k+1);
  %let n=%scan(&maxc,&k);
  %end;
%end;
%mend;

%fastclus(4 5 6 8 10 11 12,pink);


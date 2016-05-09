%let d1=fjc.dqnlmy;
%let c1=x1-x5 y1-y5;
%let b1=factor1; %let a1=x1;
%let e1=d;

%macro fastclus(maxc,least,cframe);
%do i=1 %to 1;
data f&i;
set &&d&i;
run;
%let k=1;
  %let n=%scan(&maxc,&k);
  %DO %WHILE(&n ne);
title1 " &&d&i fastclus maxc=&n least=&least cframe=&cframe";
proc factor data=f&i n=2 rotate=v out=a&i;
var &&c&i;
run;
proc fastclus data=a&i summary maxc=&n maxiter=99 converge=0
              outseeds=outseeds&i out=prelim cluster=preclus list least=&least;
   var &&c&i;
   id &&e&i;
run;
proc gplot data=prelim;
 %let plotitop = gopts=cback=pink, color=blue, cframe=&cframe;
%plotit(data=prelim, plotvars=&&b&i &&a&i,
        labelvar=preclus, typevar=preclus);
%plotit(data=prelim, plotvars=&&b&i &&a&i,
        labelvar=&&e&i, typevar=preclus);
run;
proc sort data=prelim;
   by preclus;
   proc print;
run;
%macro clus(method);
title "&&d&i clus outseeds&i maxc=&n least=&least method=&method";
proc cluster data=outseeds&i method=&method ccc pseudo;
   var &&c&i;
   copy preclus;
run;
proc tree ncl=&n horizontal lines=(width=3 color=blue) out=out;
   copy &&c&i preclus;
   proc print data=out;
   run;
proc sort data=out;
   by preclus;
run;
data clus;
   merge prelim out;
   by preclus;
   proc print data=clus(keep=d factor1 factor2 preclus);
run;

%mend;

%clus(average);
%clus(com);
%clus(single);
%clus(cen);
%clus(med);

%let k=%eval(&k+1);
  %let n=%scan(&maxc,&k);
  %end;
%end;
%mend;


%fastclus(3 5 6,1,yellow);





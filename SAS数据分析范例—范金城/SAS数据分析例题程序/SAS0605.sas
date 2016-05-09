%let d1=fjc.gjxuexiao1s;
%let c1=x1-x5;
%let b1=x1; %let a1=x2;
%let e1=date;

%macro fastclus(maxc,least,cframe);
%do i=1 %to 1;
%let k=1;
  %let n=%scan(&maxc,&k);
  %DO %WHILE(&n ne);
title1 " &&d&i fastclus maxc=&n least=&least cframe=&cframe";
proc fastclus data=&&d&i summary maxc=&n maxiter=99 converge=0
              outseeds=outseeds&i out=prelim cluster=preclus list least=&least;
   var &&c&i;
   id &&e&i;
run;
proc print data=prelim;
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
   proc print data=clus;
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

%fastclus(4 5 6,2,orange);
%fastclus(8 9 11,1,yellow);
%fastclus(7 10 12,1.5,cyan);
%fastclus(3 6,max,purple);




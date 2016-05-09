%let d1=fjc.zylcpcls;
%let c1=x1-x6;
%let b1=x3; %let a1=x2;
%let e1=date;

%macro fastclus(maxc,cframe);
%do i=1 %to 1;
data f&i;
set &&d&i;
run;
title1  "&&d&i fastclus maxc=&maxc cframe=&cframe";
proc fastclus data=f&i summary maxc=&maxc maxiter=99 converge=0
              mean=mean&i out=prelim cluster=preclus list;
   var &&c&i;
   id &&e&i;
run;
proc print data=prelim;
run;
proc gplot data=prelim;
 %let plotitop=gopts=cback=blue, color=yellow, cframe=&cframe;
%plotit(data=prelim, plotvars=&&b&i &&a&i,
        labelvar=preclus, typevar=preclus);
%plotit(data=prelim, plotvars=&&b&i &&a&i,
        labelvar=&&e&i, typevar=preclus);
run;
proc sort data=prelim;
   by preclus;
   proc print;
run;
%end;
%mend;

%macro driver;
%do maxc=3 %to 6;

%fastclus(&maxc,yellow);
%fastclus(&maxc,pink);
%fastclus(&maxc,cyan);
%fastclus(&maxc,purple);

%macro clus(method);
%do i=1 %to 1;
data g&i;
set &&d&i;
run;
title f=zapf c=yellow h=6pct "&&d&i clus mean&i maxc=&maxc method=&method";
proc cluster data=mean&i method=&method ccc pseudo;
   var &&c&i;
   copy preclus;
run;
proc tree  ncl=&maxc horizontal lines=(width=3 color=yellow) out=out;
   copy &&c&i preclus;
   proc print data=out;
   run;
proc sort data=out;
   by preclus;
run;
data clus;
   merge prelim out;
   by preclus;
   proc print data=clus);
run;
%end;
%mend;

%clus(average);
%clus(ward);
%clus(com);
%clus(single);
%clus(cen);
%clus(med);

%end;
%mend;

%driver;


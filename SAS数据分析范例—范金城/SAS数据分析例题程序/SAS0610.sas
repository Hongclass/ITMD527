%let d1=fjc.dqwsjg;
%let c1=x1 x2 x3 x4 x5 x6 x7 x8;
%let b1=x1;
%let a1=x8;


%macro fastclus(maxc,cframe);
%do i=1 %to 1;
data f&i;
set &&d&i;
run;
%let k=1;
  %let n=%scan(&maxc,&k);
  %do %while(&n ne);
%do least=1 %to 2;
title1 " &&d&i fastclus maxc=&n least=&least cframe=&cframe";

proc fastclus data=f&i summary maxc=&n maxiter=99 converge=0
              outseeds=outseeds&i out=prelim cluster=preclus list least=&least;
   var &&c&i;
   id d;
run;
proc print data=outseeds&i;
run;
%let plotitop=gopts=cback=blue, color=yellow, cframe=&cframe;
title1 "fastclus maxc=&n least=&least labalvar=preclus";
%plotit(data=prelim, plotvars=&&b&i &&a&i,
        labelvar=preclus, typevar=preclus);
title1 "fastclus maxc=&n least=&least labelvar=d";
%plotit(data=prelim, plotvars=&&b&i &&a&i,
        labelvar=d, typevar=preclus);
run;
proc sort data=prelim;
   by preclus;
   run;
proc print data=prelim(keep=d preclus);
run;
%let plotitop=gopts=cback=green, color=yellow, cframe=&cframe;
title "outseeds maxc=&n least=&least labelvar=preclus";
%plotit(data=outseeds&i, plotvars=&&b&i &&a&i,
        labelvar=preclus, typevar=preclus);
title "outseeds maxc=&n least=&least labelvar=_near_";
%plotit(data=outseeds&i, plotvars=&&b&i &&a&i,
        labelvar=_near_, typevar=preclus);
title "outseeds maxc=&n least=&least labelvar=_freq_";
%plotit(data=outseeds&i, plotvars=&&b&i &&a&i,
        labelvar=_freq_, typevar=preclus);
run;
%end;
%let k=%eval(&k+1);
  %let n=%scan(&maxc,&k);
  %end;
%end;
%mend;

%fastclus(2 3 4 5 6 8,yellow);





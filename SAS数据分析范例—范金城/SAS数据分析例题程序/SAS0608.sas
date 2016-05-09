%let d1=fjc.sczz05s;
%let c1=x1-x10;
%let b1=x2;
%let a1=x1;


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
   id date;
run;
proc print data=outseeds&i;
run;
%let plotitop=gopts=cback=blue, color=yellow, cframe=&cframe;
%plotit(data=prelim, plotvars=date &&a&i,
        labelvar=preclus, typevar=preclus);
%plotit(data=prelim, plotvars=date &&a&i,
        labelvar=date, typevar=preclus);
run;
proc sort data=prelim;
   by preclus;
   run;
proc print data=prelim(keep=date preclus);
run;
title " &&d&i outseeds maxc=&n least=&least labelvar=prevars";
%let plotitop=gopts=cback=blue, color=yellow, cframe=&cframe;
%plotit(data=outseeds&i, plotvars=&&b&i &&a&i,
        labelvar=preclus, typevar=preclus);
title " &&d&i outseeds maxc=&n least=&least labelvar=_freq_";
%plotit(data=outseeds&i, plotvars=&&b&i &&a&i,
        labelvar=_freq_, typevar=preclus);
run;
%end;
%let k=%eval(&k+1);
  %let n=%scan(&maxc,&k);
  %end;
%end;
%mend;

%fastclus(2 4 6,pink);





%let d1=sas.ms8d1;
%let c1=x1 x2 x3 x4 x5 x6 x7;

%macro factor(method,rotate);
%do i=1 %to 1;
title "factor &&d&i method=&method rotate=&rotate";
proc factor data=&&d&i method=&method  nfactors=3 rotate=&rotate out=a&i;
var &&c&i;
proc print data=a&i(keep=factor1 factor2 factor3);
run;
%let plotitop=gopts=cback=black, color=white;
%plotit(data=a&i, labelvar=factor1,
        plotvars=factor1 factor2, colors=white,font=Italic);
%end;
%mend;

%factor(prin,varimax);
%factor(prin,equamax);
%factor(prin,promax);
%factor(prin,quartimax);



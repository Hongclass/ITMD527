data a1;
set sas.dqnlmy2;
%let plotitop=gopts=cback=white, color=black;
%plotit(data=a1, plotvars=x5 x1 ,
        labelvar=c, typevar=c,font=Italic);
%plotit(data=a1, plotvars=x5 x1 ,
        labelvar=x1,typevar=c ,font=Italic);
%plotit(data=a1, plotvars=x5 x1,
        labelvar=d, typevar=c,font=Italic);
run;

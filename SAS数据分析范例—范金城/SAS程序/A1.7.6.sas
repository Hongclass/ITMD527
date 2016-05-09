data a1;
set sas.dqnlmy2;
%let plotitop=gopts=cback=grey, color=black;
%plotit(data=a1, plotvars=x5 x1 ,
        labelvar=c, colors=white,font=Italic);
%plotit(data=a1, plotvars=x5 x1 ,
        labelvar=x1, colors=white,font=Italic);
%plotit(data=a1, plotvars=x5 x1,
        labelvar=d, colors=white,font=Italic);
run;

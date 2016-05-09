%let d1=fjc.jmxfsps;
%let c1=x x1 x2;
%let b1=y;


%macro discrim(method,priors);
%do i=1%to 1;
data f&i;
set &&d&i;
run;
title "&&d&i discrim method=&method priors=&priors";
proc discrim data=f&i method=&method out=a1 outstat=a2 outcross=a3 listerr crosslisterr
can ncan=2;
class &&b&i;
var &&c&i;
id date;
priors &priors;
proc print data=a1(keep=date y can1 can2 _INTO_);
proc print data=a3(keep=date y can1 can2 _INTO_);
%let plotitop=gopts=cback=blue, color=white, cframe=yellow;
title1 "method=&method priors=&priors labelvar=y typevar=y";
%plotit(data=a3, plotvars=x1 x2,
        labelvar=y, typevar=y);
title1 "method=&method priors=&priors labelvar=date typevar=y";
%plotit(data=a3, plotvars=x1 x2,
        labelvar=date, typevar=y);
title1 "method=&method priors=&priors labelvar=_INTO_ typevar=_INTO_";
%plotit(data=a3, plotvars=x1 x2,
        labelvar=_INTO_, typevar=_INTO_);
title1 "method=&method priors=&priors labelvar=date typevar=_INTO_";
%plotit(data=a3, plotvars=x1 x2,
        labelvar=date, typevar=_INTO_);
run;
run;
%end;
%mend;


%discrim(normal,equal);
%discrim(normal,prop);
%discrim(npar k=10,equal);
%discrim(npar k=10,prop);

%let d1=fjc.fitness;
%let c1=age weight oxygen runtime restpulse runpulse maxpulse;

%macro driver(x);
%do i=1 %to 1;
proc capability data=&&d&i;
var &&c&i;
title "data=&&d&i x=&x";
   histogram &&c&i /
   cframe=yellow
   cfill=red;
   inset n mean std skewness kurtosis median range q3 q1 uss
                            / Header = 'Summary Statistics'
                            cframe = white
                            ctext  = white
                            cfill  = magenta
                            pos    = rm
                            font   =Italic;
proc capability data=&&d&i;
var &&c&i;
   histogram &&c&i /&x
   cframe=orange
   cfill=blue;
    inset &x(mean std chisq pchisq ksd ksdpval ad adpval cvm cvmpval)
                            / Header = 'Summary Statistics'
                            cframe = white
                            ctext  = white
                            cfill  = purple
                            pos    = lm
							font   =Italic;
%end;
%mend;

%driver(lognormal);
%driver(gamma);



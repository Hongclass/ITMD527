%let d1=fjc.c1d2;
%let c1=x;

%macro driver(x);
%do i=1 %to 1;
proc capability data=&&d&i;
title "data=&&d&i x=&x";
   var &&c&i;
   histogram /
   cframe=yellow
   cfill=red;
   inset n mean std skewness kurtosis median range q3 q1 uss
                            / Header = 'Summary Statistics'
                            cframe = white
                            ctext  = white
                            cfill  = magenta
                            pos    = rm
                            font   =Italic;
   histogram /&x
   cframe=pink
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


%driver(normal);
%driver(lognormal);

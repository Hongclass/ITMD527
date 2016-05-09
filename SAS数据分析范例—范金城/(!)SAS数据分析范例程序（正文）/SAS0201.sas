%let d1=sas.plates;
%let d2=sas.wire;
%let c1=gap;
%let c2=length;

%macro driver(x);
%do i=1 %to 2;
proc capability data=&&d&i;
title "data=&&d&i x=&x";
   var &&c&i;
   histogram /
   cframe=white
   cfill=ligr;
   inset n mean std skewness kurtosis median range q3 q1 uss
                            / Header = 'Summary Statistics'
                            cframe = black
                            ctext  = black
                            cfill  = ligr
                            pos    = rm
                            font   =Italic;
   histogram /&x(colors=black w=2)
   cframe=white
   cfill=ligr;
    inset &x(mean std chisq pchisq ksd ksdpval ad adpval cvm cvmpval)
                            / Header = 'Summary Statistics'
                            cframe = black
                            ctext  = black
                            cfill  = ligr
                            pos    = lm
							font   =Italic;

%end;

%mend;


%driver(normal);
%driver(lognormal);




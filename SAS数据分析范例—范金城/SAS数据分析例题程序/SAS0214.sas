%let d1=fjc.haigui1;
%let c1=x1 x2 x3;

  %macro f1(cframe,cfill,x);
%do i=1 %to 1;
proc capability data=&&d&i;
   var &&c&i;
   title1 " cframe=&cframe cfill=&cfill x=&x";
   histogram /
   cframe=&cframe
   cfill=&cfill;
   inset n mean std skewness kurtosis median range q3 q1 uss
                            / Header = 'Summary Statistics'
                            cframe = white
                            ctext  = white
                            cfill  = blue
                            pos    = rm;
   histogram /&x
   cframe=&cframe
   cfill=&cfill;
    inset &x(mean std chisq pchisq ksd ksdpval ad adpval cvm cvmpval)
                            / Header = 'Summary Statistics'
                            cframe = yellow
                            ctext  = yellow
                            cfill  = blue
                            pos    = lm;

   cdfplot/
   &x
   cframe=&cframe;
 run;
 %end;
 %mend;

 
 %f1(orange,yellow,lognormal);
 %f1(ligr,red,gamma);
 




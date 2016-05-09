%let d1=fjc.haigui1;
%let c1=x1 x2 x3;

%macro driver(x);
%do i=1 %to 1;
proc capability data=&&d&i;
   var &&c&i;
   by y;
title "data=&&d&i x=&x";
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
	cdfplot/&x
                            cframe  = cyan
                            ctext   =red;
	qqplot /
      cframe=pink
      legend=legend1
      &x
      square;
	   inset n mean std skewness kurtosis median mode range q3 q1 uss p5 p10 p90 p95 /
	   pos=lm
       cfill  = red
       ctext  = white
       font=Italic;
   legend1 cframe=gray cborder=black;
	run;
%end;

%mend;

%driver(normal);





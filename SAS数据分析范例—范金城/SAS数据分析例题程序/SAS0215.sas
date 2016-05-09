%let d1=fjc.fitness;
%let c1=restpulse runpulse;


%macro driver;
%do i=1 %to 1;
proc capability data=&&d&i;
title "data=&&d&i";
   histogram &&c&i /
       normal(color=red    l=1 )
       gamma  (color=white  l=15)
       lognormal    (color=yellow l=2 )
       legend=legend1
       cframe=orange cfill=yellow;
    inset n mean std skewness kurtosis median range q3 q1 uss max min/
	header='summary statistcs'
	   pos=lm
       cfill  = red
       ctext  = white
       font=Italic;
proc capability data=&&d&i;
title "data=&&d&i";
   histogram &&c&i /
       normal(color=red    l=1 )
       gamma  (color=white  l=15)
       lognormal    (color=yellow l=2 )
       legend=legend1
       cframe=orange cfill=blue;
	  inset gamma(chisq pchisq ksd ksdpval ad adpval cvm cvmpval)/
	header='summary statistcs'
	   pos=lm
       cfill  = red
       ctext  = white
       font=Italic;
    legend1 cframe=green cborder=black;

proc capability data=&&d&i;
title "data=&&d&i";
   histogram &&c&i /
       normal(color=red    l=1 )
       gamma  (color=white  l=15)
       lognormal    (color=yellow l=2 )
       legend=legend1
       cframe=orange cfill=green;
	  inset lognormal(chisq pchisq ksd ksdpval ad adpval cvm cvmpval)/
	header='summary statistcs'
	   pos=lm
       cfill  = red
       ctext  = white
       font=Italic;
    legend1 cframe=green cborder=black;
proc capability data=&&d&i;
title "data=&&d&i";
   cdfplot &&c&i/
    lognormal
   cframe=yellow;
proc capability data=&&d&i;
title "data=&&d&i";
   cdfplot &&c&i/
   gamma 
   cframe=yellow;
   %end;
%mend;

%driver;

%let d1=fjc.wire;
%let c1=length;

%macro driver(type);
%do i=1 %to 1;
proc capability data=&&d&i;
   var &&c&i;
   title "data=&&d&i type=&type";
      histogram/
	  &type( color=red w=2)
	  legend=legend1
	  cframe=yellow
	  cfill=blue;
    inset n mean std skewness kurtosis median mode range q3 q1 uss p5 p10 p90 p95 /
	   pos=lm
       cfill  = red
       ctext  = white
       font=Italic;
    legend1 cframe=green cborder=black;
	  histogram/
	  &type( color=red w=2)
	  legend=legend1
	  cframe=yellow
	  cfill=blue;
    inset &type(mean std chisq pchisq cvm cvmpval ad adpval)/
	   pos=lm
       cfill  = red
       ctext  = white
       font=Italic;
    legend1 cframe=green cborder=black;
	  legend1 cframe=yellow cborder=black;
	  cdfplot/
      &type(color=blue w=2)
      cframe=yellow;
	  inset n mean std skewness kurtosis median mode range q3 q1 uss p5 p10 p90 p95 /
	   pos=lm
       cfill  = red
       ctext  = white
       font=Italic;

   qqplot /
      cframe=blue
      legend=legend1
      &type
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
 
 




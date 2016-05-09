%let d1=sas.wire;
%let c1=length;

%macro driver(type);
%do i=1 %to 1;
proc capability data=&&d&i;
   var &&c&i;
   title "data=&&d&i type=&type";
      histogram/
	  &type( color=black w=2)
	  legend=legend1
	  cframe=white
	  cfill=ligr;
    inset n mean std skewness kurtosis median mode range q3 q1 uss p5 p10 p90 p95 /
	   pos=lm
       cfill  = grey
       ctext  = white
       font=Italic;
    legend1 cframe=white cborder=black;
	  histogram/
	  &type( color=black w=2)
	  legend=legend1
	  cframe=white
	  cfill=grey;
    inset &type(mean std chisq pchisq cvm cvmpval ad adpval)/
	   pos=lm
       cfill  = ligr
       ctext  = black
       font=Italic;
    legend1 cframe=white cborder=black;
	  legend1 cframe=white cborder=black;
	  cdfplot/
      &type(color=black w=2)
      cframe=ligr;
	  inset n mean std skewness kurtosis median mode range q3 q1 uss p5 p10 p90 p95 /
	   pos=lm
       cfill  = grey
       ctext  = white
       font=Italic;

   qqplot /
      cframe=blue
      legend=legend1
      &type(color=black w=2)
      cframe=ligr
      square;
	   inset n mean std skewness kurtosis median mode range q3 q1 uss p5 p10 p90 p95 /
	   pos=lm
       cfill  = grey
       ctext  = white
       font=Italic;
   legend1 cframe=white cborder=black;
run;
%end;
%mend;

%driver(normal);
 



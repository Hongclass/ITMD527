%let d1=fjc.boxes;
%let d2=fjc.belts;
%let c1=weight;
%let c2=strength;

%macro driver(type);
%do i=1 %to 2;
proc capability data=&&d&i;
   var &&c&i;
   title "data=&&d&i type=&type";
   histogram / cframe   = pink
          cfill    = blue
          cbarline = white;
   inset mean std max min skewness kurtosis median range q3 q1/ Header = "Summary Statistics"
                            cframe  = white
                            ctext   = white
                            cfill   = red
                            cshadow = black
                            cheader = yellow
                            cfillh  = blue
                            pos     = ne
							font=Italic;
    histogram / &type(w=3 color=brown)
                      cframe  = yellow
                      cfill   = magenta
                      legend  = legend1;
					  inset &type(chisq pchisq ksd ksdpval ad adpval cvm cvmpval)/
	header='summary statistcs'
	   pos=rm
       cfill  = red
       ctext  = white
       font=Italic;
    legend1 cframe=gray cborder=black;
	cdfplot/&type
                            cframe  = cyan
                            ctext   =red;
	qqplot/cframe=pink;
run;
%end;
%mend;

%driver(normal);


 

%let d1=fjc.bd1;
%let d2=fjc.bd3;

%macro dis;
%do i=1 %to 2;
proc format;
   value specname
      1='y1'
      2='y2'
	  3='y3'
	  4='y4'
run;

data f&i;
set &&d&i;
run;

data plotdata;
   do can1=-8.0 to 18.0 by 0.01;
      output;
   end;
run;
%macro plot;

   data plotp&i;
      set plotp&i;
      if y1<.01 then y1=.;
      if y2<.01 then y2=.;
	  if y3<.01 then y3=.;
	  if y4<.01 then y4=.;
   run;
   legend1 label=none frame;
   symbol1 i=spline v=none c=red  l=1 w=3;
   symbol2 i=spline v=none c=blue l=1 w=3;
   symbol3 i=spline v=none c=brown l=1 w=3;
   symbol4 i=spline v=none c=gray l=1 w=3;

   axis1 label=(angle=90 'Posterior Probability')
         order=(0 to 1 by .2);


   proc gplot data=plotp&i;
      plot y1*can1
           y2*can1
		   y3*can1
		   y4*can1
           / overlay vaxis=axis1 legend=legend1 frame cframe=pink;
      title3 'Plot of Posterior Probabilities';
   run;
%mend;
title "&&d&i candisc";
proc candisc data=f&i out=b&i;
class y;
var  birth death;
run;
%macro discrim(method,pool);
title "&&d&i normal pool=&pool";
proc discrim data=b&i method=&method pool=&pool
             testdata=plotdata testout=plotp&i
             listerr crosslisterr;
   class y;
   var can1;
   id country;
   run;
%plot;
%mend;

%discrim(normal,yes);
%discrim(normal,no);

%end;
%mend;

%dis;

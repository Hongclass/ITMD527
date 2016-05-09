%let d1=fjc.csjjzb3;
%let c1=x1-x10;

%macro dis;
%do i=1 %to 1;
proc format;
   value specname
      1='_1'
      2='_2'
	  3='_3'
	  4='_4'
	  5='_5'
	  6='_6'
run;

data f&i;
set &&d&i;
run;

data plotdata;
   do can1=-18.0 to 38.0 by 0.01;
      output;
   end;
run;
%macro plot;

   data plotp&i;
      set plotp&i;
      if _1<.01 then _1=.;
      if _2<.01 then _2=.;
	  if _3<.01 then _3=.;
	  if _4<.01 then _4=.;
      if _5<.01 then _5=.;
	  if _6<.01 then _6=.;
   run;
   legend1 label=none frame;
   symbol1 i=spline v=none c=red  l=1 w=2;
   symbol2 i=spline v=none c=blue l=1 w=2;
   symbol3 i=spline v=none c=brown l=1 w=2;
   symbol4 i=spline v=none c=gray l=1 w=2;
   symbol5 i=spline v=none c=green l=1 w=2;
   symbol6 i=spline v=none c=magenta l=1 w=2;
   axis1 label=(angle=90 'Posterior Probability')
         order=(0 to 1 by .2);


   proc gplot data=plotp&i;
      plot _1*can1
           _2*can1
		   _3*can1
		   _4*can1
		   _5*can1
		   _6*can1
           / overlay vaxis=axis1 legend=legend1 frame cframe=pink;
      title3 'Plot of Posterior Probabilities';
   run;
%mend;

%macro discrim(method,pool);
proc candisc data=&&d&i out=b&i;
class c;
var  &&c&i;
run;
title "discrim &&c&i  normal pool=&pool";
proc discrim data=b&i method=&method pool=&pool out=a1 outstat=a2 outcross=a3
             testdata=plotdata testout=plotp&i
             listerr crosslisterr;
   class c;
   var can1;
   id d;
   run;

%let plotitop=gopts=cback=green, color=white, cframe=yellow;
title1 "&&d&i method=&method pool=&pool typevar=c";
%plotit(data=a1, plotvars=x1 x2,
        labelvar=c, typevar=c);
title1 "&&d&i method=&method pool=&pool typevar=c";
%plotit(data=a1, plotvars=x1 x2,
        labelvar=d, typevar=c);
title1 "&&d&i a1 method=&method pool=&pool typevar=_INTO_";
%plotit(data=a1, plotvars=x1 x2,
        labelvar=_INTO_, typevar=_INTO_);
title1 "&&d&i a1 method=&method pool=&pool typevar=_INTO_";
%plotit(data=a1, plotvars=x1 x2,
        labelvar=d, typevar=_INTO_);
title1 "&&d&i a3 method=&method pool=&pool typevar=_INTO_";
%plotit(data=a3, plotvars=x1 x2,
        labelvar=_INTO_, typevar=_INTO_);
title1 "&&d&i a3 method=&method pool=&pool typevar=_INTO_";
%plotit(data=a3, plotvars=x1 x2,
        labelvar=d, typevar=_INTO_);
title "discrim &&d&i normal pool=&pool";
%plot;
proc sort data=a1;
by c;
run;
proc print data=a1(keep=d c _into_);
title "print data=a1";
run;
proc sort data=a3;
by c;
run;
proc print data=a3(keep=d c _into_);
title "print data=a3";
run;
%mend;

%discrim(normal,yes);
%discrim(normal,no);

%end;
%mend;

%dis;

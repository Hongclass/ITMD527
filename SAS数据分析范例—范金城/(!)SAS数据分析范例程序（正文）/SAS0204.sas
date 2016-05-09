%let d1=sas.gr08n01(drop=date);
%let c1=high low close;

%macro driver(x);
%do i=1 %to 1;
proc capability data=&&d&i;
   var &&c&i;
title "data=&&d&i x=&x";
   histogram /
   cframe=white
   cfill=grey;
   inset n mean std skewness kurtosis median range q3 q1 uss
                            / Header = 'Summary Statistics'
                            cframe = black
                            ctext  = black
                            cfill  = ligr
                            pos    = rm
                            font   =Italic;
   histogram /&x( color=black w=2)
   cframe=white
   cfill=grey;
    inset &x(mean std chisq pchisq ksd ksdpval ad adpval cvm cvmpval)
                            / Header = 'Summary Statistics'
                            cframe = black
                            ctext  = black
                            cfill  = ligr
                            pos    = lm
						   font   =Italic;

proc iml;
use &&d&i;
read all into mymatrix;
y=mymatrix;
print y;
n=nrow(y);
p=ncol(y);
dfchi=p*(p+1)*(p+2)/6;
q=i(n)-(1/n)*j(n,n,1);
s=(1/n)*y`*q*y; s_inv=inv(s);
g_matrix=q*y*s_inv*y`*q;
beta1hat=(sum(g_matrix#g_matrix#g_matrix))/(n*n);
beta2hat=trace(g_matrix#g_matrix)/n;
kappa1=n*beta1hat/6;
kappa2=(beta2hat-p*(p+2))/sqrt(8*p*(p+2)/n);
pvalskew=1-probchi(kappa1,dfchi);
pvalkurt=2*(1-probnorm(abs(kappa2)));
print s;
print s_inv;
print beta1hat kappa1 pvalskew;
print beta2hat kappa2 pvalkurt;
quit;
%end;
%mend;

%driver(normal);
%driver(lognormal);
%driver(gamma);


 



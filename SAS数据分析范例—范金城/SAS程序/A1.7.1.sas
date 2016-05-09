options nodate nonumber nocenter;
Proc means data=sas.gnsczzgc n mean std var min max sum uss css
range skewness kurtosis t prt;
Var x2 x3 x6;
Run;

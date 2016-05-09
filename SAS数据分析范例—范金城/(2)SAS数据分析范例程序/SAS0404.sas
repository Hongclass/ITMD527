%let d1=fjc.slgong;
%let c1=x;


%macro anova;
%do i=1 %to 1;
proc anova data=&&d&i;
class a b;
model &&c&i=a b a*b;
means a b/lsd clm bon cldiff;
%end;
%mend;

%anova; 

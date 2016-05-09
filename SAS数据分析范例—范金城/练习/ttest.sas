data ex;
input x @@;
cards;
171 79 135 78 118 175 122 105 111 140 
138 132 142 140 168 113 131 145 128 124 
134 116 129 155 135 134 36 113 119 132
;
proc ttest h0=140;
var x;
run;
proc means noprint;
var x;
output out=b mean=m std=s n=n0;
run;
data c;
set b;
g=(140-m)*sqrt(n0)/s;
proc print data=c;
run;


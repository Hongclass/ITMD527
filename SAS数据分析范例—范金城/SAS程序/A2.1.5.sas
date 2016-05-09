%let d1=sas.dqnlmy2;
%let plot
=%str(proc gplot;
plot d*x3=c;
symbol1 v=dot i=none c=black pointlabel;
symbol2 v=dot i=none c=ligr pointlabel;
symbol3 v=dot i=none c=grey pointlabel;
run;);

data a1;
set &d1; 
&plot;
run;



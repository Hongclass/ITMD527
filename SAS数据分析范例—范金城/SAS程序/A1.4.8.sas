data a1;
set sas.jmxfsp1;
w=log(x);
z=x1*x2;
proc print data=a1;
run;

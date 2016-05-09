data dqgz;
infile 'D:\SAS\dada.txt';
input id 1-2 d $ 3-18 x1 x2 x3 x4 x5 x6;
proc print data=dqgz;
run;

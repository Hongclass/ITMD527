 data random;
i=0;
do until(i=30);
x=2+4*rannor(1234);
i=i+1;
output;
end;
proc print;
run;


data random;
i=0;
do while(i<30);
x=2+4*rannor(1234);
i=i+1;
output;
end;
proc print;
run;

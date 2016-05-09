data a5;
set sas.dqnlmy2(keep=d c x1 x2);
if x1<1000 and c='2' then do;
y=2*x1;
z=3*x2;
end;
proc print data=a5;
run;

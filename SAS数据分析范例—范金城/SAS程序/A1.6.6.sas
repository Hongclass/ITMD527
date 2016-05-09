data kscj2;
do a=1 to 2;
do b=1 to 3;
do i=1 to 4;
input x @@;
output;
end;
end;
end;
cards;
81 78 79 78
75 80 78 75
82 80 85 88
89 82 77 90
79 80 75 78
93 93 86 95
;
proc print data=kscj2;
run;


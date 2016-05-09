%let d1=sas.modeclu4;
%let d2=sas.poverty;
%let c1=birth death;
%let c2=birth death infantdeath;
%let b1=country;
%let b2=country;
%let b3=t;
%let b4=t;
%let f1=death; %let g1=birth;
%let f2=death; %let g2=birth;


%macro driver;
%do i=1 %to 2;
  %do clus=2 %tO 6 %by 2;
   title "data=&&d&I maxc=&clus"; 
   proc fastclus data=&&d&I maxc=&clus out=out list distance;
      var &&c&I;
	  id &&b&I;
   run;;
   title "data=&&d&I plot &clus clusters";
   proc gplot data=out;
   plot &&f&I*&&g&I=cluster/cframe=ligr;
    symbol1 v='1' font=Italic c=black;
    symbol2 v='2' font=Italic c=black;
	symbol3 v='3' font=Italic c=black;
	symbol4 v='4' font=Italic c=black; 
    symbol5 v='5' font=Italic c=black;
    symbol6 v='6' font=Italic c=black;
   run;;
  %end;
  %end;
%mend;


%driver;



proc standard data=census.psam_h17_subset1 out=Stand mean=0 std=1;
var VALP HINCP;
run;

proc fastclus data=Stand radius=0 replace=full maxclusters=20
converge=0 OUTSTAT=subset1_20clus_stat_stan OUT=subset1_20clus_stan
distance;
id SERIALNO;
var VALP HINCP;
run;

proc sgplot;
scatter y=HINCP x=VALP / group=cluster;
title ’ACS PUMS 2013 1 YR 20-Cluster Analysis (w standardized data)’;
title2 ’of Data Containing Property Value and Household Income’;
run;
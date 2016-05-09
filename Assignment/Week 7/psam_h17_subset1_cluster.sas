proc fastclus data=census.psam_h17_subset1 
radius=0 replace=full 
maxclusters=20
converge=0 
OUTSTAT=subset1_20clusters_stat 
OUT=subset1_20clusters distance;
id SERIALNO;
var VALP HINCP;
run;

proc sgplot;
scatter y=HINCP x=VALP / group=cluster;
title ’ACS PUMS 2013 1 YR 20-Cluster Analysis’;
title2 ’of Data Containing Property Value and Household Income’;
run;
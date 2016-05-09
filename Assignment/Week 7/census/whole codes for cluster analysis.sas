proc freq data=census.psam_h17_subset1_20clusters_agg;
tables WORKSTAT*Cluster;
run;
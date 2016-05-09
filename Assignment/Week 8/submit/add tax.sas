libname census "/folders/myfolders/census";

/*Add TAXP_INCREASE (average of bracket range) column
by using lookup table created from Excel*/
proc sql;
create table census.psam_h17_subset1_cluster_agg25t as
select a.*, b.TAXP_AVG, (b.TAXP_AVG*0.0) as TAXP_INCREASE
from census.psam_h17_subset1_cluster_agg25 as a left join
census.taxp_lookup as b
on a.TAXP=b.TAXP
WHERE a.HINCP > 50000
and a.VALP is not null;
run;

/*10% Increase level*/
proc sql;
update census.psam_h17_subset1_cluster_agg25t 
set TAXP_INCREASE=(TAXP_AVG*0.10)
WHERE HINCP <= 100000;
run;

/*20% Increase level*/
proc sql;
update census.psam_h17_subset1_cluster_agg25t
set TAXP_INCREASE=(TAXP_AVG*0.20)
where HINCP > 100000
and TAXP in ('01','02','03','04','05','06','07','08','09','10',
'11','12','13','14','15','16','17','18','19','20','21',
'22','23','24','25','26','27','28','29','30','31');
run;

/*30% Increase level*/
proc sql;
update census.psam_h17_subset1_cluster_agg25t
set TAXP_INCREASE=(TAXP_AVG*0.3)
where HINCP > 100000
and TAXP in ('32','33','34','35','36','37','38','39','40','41',
'42','43','44','45','46','47','48','49','50','51');
run;

/*40% Increase level*/
proc sql;
update census.psam_h17_subset1_cluster_agg25t
set TAXP_INCREASE=(TAXP_AVG*0.4)
where HINCP > 100000
and TAXP in ('52','53','54','55','56','57','58','59','60','61',
'62','63','64','65','66','67');
run;

/*50% Increase level*/
proc sql;
update census.psam_h17_subset1_cluster_agg25t
set TAXP_INCREASE=(TAXP_AVG*0.5)
where HINCP > 100000
and TAXP = '68';
run;

/*Total Tax Increase*/
proc sql;
select sum(TAXP_INCREASE)
from census.psam_h17_subset1_cluster_agg25t;
run;
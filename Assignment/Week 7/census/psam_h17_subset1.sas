data census.psam_h17_subset1;
set census.psam_h17;
keep SERIALNO MRGP HINCP TAXP VALP;
label SERIALNO='serial_id'
MRGP='mortgage_payment'
HINCP='household_income'
TAXP='property_tax'
VALP='property_value';
format SERIALNO $9.
MRGP Z5.
HINCP Z9.
TAXP $2.
VALP Z9.;
run;

proc contents data=census.psam_h17_subset1;
run;

proc print data=census.psam_h17_subset1(obs=20) label;
run;

proc sgplot;
scatter y=HINCP x=VALP;
run;
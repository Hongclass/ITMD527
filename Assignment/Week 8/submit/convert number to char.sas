libname census "/folders/myfolders/census";

data census.taxp_lookup;
set census.taxp_lookup;
TAXP = put(Range, 2.);
label TAXP='property_tax';
format TAXP $2.;
run ; 



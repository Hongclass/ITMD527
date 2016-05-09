%let d1=sas.iris;

%macro glm;
%do i=1 %to 1;
title "&&d&i sepallength sepalwidth petallength petalwidth=species";
proc glm data=&&d&i;
class species;
model sepallength sepalwidth petallength petalwidth=species;
manova h=species/printe printh;
means species/lsd clm;
contrast 'Test:species eff.'    species 1 -1 0,
                                species 1 0 -1,
								species 0 1 -1;
contrast 'Test:species1 vs species2 eff.'      species 1 -1 0;
contrast 'Test:species1 vs species3 eff.'      species 1 0 -1;
contrast 'Test:species2 vs species3 eff.'      species 0 1 -1;
run;
%end;
%mend;

%glm;

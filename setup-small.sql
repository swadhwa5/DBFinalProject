CREATE TABLE ThreatenedPlant (
   SpeciesName VARCHAR(500),
   ThreatLevel VARCHAR(10),
   PRIMARY KEY(SpeciesName)
);

@import on;
@import set ImportSource="ThreatenedPlant.csv";
@import parse;
@import target Table="ThreatenedPlant";
@import execute;
@import off;

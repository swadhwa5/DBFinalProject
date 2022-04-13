-- Name: Shreya Wadhwa
-- JHEDID: swadhwa5

SET sql_mode='ANSI_QUOTES';

DROP TABLE IF EXISTS GrowsIn;
DROP TABLE IF EXISTS BotanicalGarden;
DROP TABLE IF EXISTS WaterBody;
DROP TABLE IF EXISTS "State";
DROP TABLE IF EXISTS ThreatenedPlant;
DROP TABLE IF EXISTS FloweringPlant;
DROP TABLE IF EXISTS Plant;


-- Plant Table
CREATE TABLE Plant (
   CommonName VARCHAR(500), 
   Family VARCHAR(200), 
   SpeciesName VARCHAR(500), 
   Author VARCHAR(500), 
   PRIMARY KEY(SpeciesName)
);

-- ThreatenedPlant Table
CREATE TABLE ThreatenedPlant (
   SpeciesName VARCHAR(500),
   ThreatLevel VARCHAR(10),
   PRIMARY KEY(SpeciesName),
   FOREIGN KEY(SpeciesName) REFERENCES Plant(SpeciesName) ON DELETE CASCADE  ON UPDATE CASCADE
);

-- FloweringPlant Table
CREATE TABLE FloweringPlant (
   SpeciesName VARCHAR(500), 
   Sex VARCHAR(200), 
   PetalNumber VARCHAR(10), 
   Color VARCHAR(200), 
   PRIMARY KEY(SpeciesName),
   FOREIGN KEY(SpeciesName) REFERENCES Plant(SpeciesName) ON DELETE CASCADE  ON UPDATE CASCADE
);

-- State Table
CREATE TABLE "State" (
  "State" VARCHAR(200),
  GDP Varchar(20),
  HappinessScore  Varchar(20),
  Temperature  Varchar(20),
  Precipitation Varchar(20), 
  Sun Varchar(20),
  PRIMARY KEY("State")
);

-- BotanicalGarden Table 
CREATE TABLE BotanicalGarden (
   Name VARCHAR(1000), 
   City VARCHAR(200), 
   "State" VARCHAR(200), 
   PRIMARY KEY(Name, City, "State"),
   FOREIGN KEY("State") REFERENCES "State"("State")
);

-- WaterBody Table
CREATE TABLE WaterBody (
   Latitude VARCHAR(20), 
   Longitude VARCHAR(20),
   "State" VARCHAR(200),
   LakeName VARCHAR(1000), 
   Origin VARCHAR(500), 
   SurfaceArea VARCHAR(20), 
   "Depth" VARCHAR(20), 
   PRIMARY KEY(LakeName, "State"),
   FOREIGN KEY("State") REFERENCES "State"("State")
);

-- GrowsIn Table
CREATE TABLE GrowsIn (
   "State" VARCHAR(200),
   SpeciesName VARCHAR(500), 
   PRIMARY KEY(SpeciesName, "State"),
   FOREIGN KEY("State") REFERENCES "State"("State"),
   FOREIGN KEY(SpeciesName) REFERENCES Plant(SpeciesName)
);

LOAD DATA LOCAL INFILE './Plant.txt' 
INTO TABLE Plant;

LOAD DATA LOCAL INFILE './State.txt' 
INTO TABLE "State";

LOAD DATA LOCAL INFILE './WaterBody.txt' 
INTO TABLE WaterBody;

LOAD DATA LOCAL INFILE './BotanicalGarden.txt' 
INTO TABLE BotanicalGarden;

LOAD DATA LOCAL INFILE './GrowsIn.txt' 
INTO TABLE GrowsIn;

LOAD DATA LOCAL INFILE './ThreatenedPlant.txt' 
INTO TABLE ThreatenedPlant;

LOAD DATA LOCAL INFILE './FloweringPlant.txt' 
INTO TABLE FloweringPlant;
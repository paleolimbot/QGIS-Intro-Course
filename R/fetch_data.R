#script to fetch data from the internet and put it in the appropriate folders for the tutorial

library(sp)
library(raster)
library(rgdal)
library(rosm)
library(prettymapr)
library(reshape2)

#download GADM data for Canada and USA
CA0 <- raster::getData(country="CA", level=0)

usa <- makebbox(72.68, -52.0, 18.9, -180)
osm.raster(usa, filename="openstreetmap_usa.tif", overwrite=T)
osm.raster(bbox(CA0), filename="openstreetmap_canada.tif", overwrite=T)
osm.raster(bbox(CA0), type="mapquestsat", filename="mapquest_satellite_canada.tif", overwrite=T)


cacensus <- read.csv("r/98-316-XWE2011001-401.CSV", skip=1)
nscensus <- cacensus[cacensus$Prov_Name=='Nova Scotia',]
nscensus <- nscensus[nscensus$Topic %in% c("Population and dwelling counts", "Age characteristics"),]
nscensus <- nscensus[nscensus$Characteristic %in% c("Population in 2011", "2006 to 2011 population change (%)", "Population density per square kilometre", "Median age of the population"),]
nscensus <- nscensus[c("Prov_Name", "CT_Name", "Characteristic", "Total")]

nscasted <- reshape2::dcast(nscensus, Prov_Name + CT_Name ~ Characteristic)
names(nscasted) <- c("Prov_Name", "CT_Name", "06_11_Pop_Change", "med_age", "pop_density", "total_pop")
nscasted$CT_Name <- sprintf("%07.2f", as.numeric(nscasted$CT_Name))
nscasted <- nscasted[!is.na(nscasted$`06_11_Pop_Change`),]
write.table(nscasted, "NovaScotia_Census_2011.csv", sep=",", na="", row.names=F)


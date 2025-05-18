#Open data file
orbis_panel_berlin <- readRDS("~/rct25/data/generated/orbis_panel_berlin.rds")

View(orbis_panel_berlin)

#Check column names
names(orbis_panel_berlin)

library(dplyr)

#Filter by company name
#SIS Logistik
filter(orbis_panel_berlin, grepl("SIS Logistik GmbH", name_internat))

sis_data <- filter(orbis_panel_berlin, grepl("SIS Logistik GmbH", name_internat))

#Flugsimulator
filter(orbis_panel_berlin, grepl("Flugsimulator Berlin Das Original GmbH", name_internat))

flug_data <- filter(orbis_panel_berlin, grepl("Flugsimulator Berlin Das Original GmbH", name_internat))

#Check what financial statements are available
sis_years <- select(sis_data, name_internat, year)
flug_years <- select(flug_data, name_internat, year)

# Combine into one table
combined_years <- bind_rows(sis_years, flug_years)

print(combined_years)
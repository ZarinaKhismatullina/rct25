# Open data file
orbis_panel_berlin <- readRDS("~/GitHub/rct25/data/generated/orbis_panel_berlin.rds")

# Check column names
names(orbis_panel_berlin)

library(dplyr)

# Filter by a column 'name_internat' 

# SIS Logistik
sis_data <- filter(orbis_panel_berlin, grepl("SIS Logistik GmbH", name_internat))

# Flugsimulator
flug_data <- filter(orbis_panel_berlin, grepl("Flugsimulator Berlin Das Original GmbH", name_internat))

# Check what financial statements are available
sis_years <- select(sis_data, name_internat, year)
flug_years <- select(flug_data, name_internat, year)

# Combine into one table
combined_years <- bind_rows(sis_years, flug_years)

print(combined_years)



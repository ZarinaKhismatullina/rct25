#Step 3

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

#Step 4

# Filter by 2021
orbis_2021 <- filter(orbis_panel_berlin, postcode == 13353, year == 2021)

# Filter by Total Assets amount and pick top-10
top_5 <- orbis_2021 %>%
  arrange(desc(toas)) %>%     
  slice_head(n = 5) %>%      
  select(name_internat, toas, shfd, turn) %>%
  rename('Company Name' = name_internat,
  'Total Assets' = toas,
  'Book Value of Equity' = shfd,
  'Net Sales' = turn
)

print(top_5)


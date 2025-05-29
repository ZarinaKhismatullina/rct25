# Open data file
orbis_panel_berlin <- readRDS("~/GitHub/rct25/data/generated/orbis_panel_berlin.rds")

library(dplyr)

# Filter by 2021
orbis_2021 <- filter(orbis_panel_berlin, postcode == 13353, year == 2021)

# Filter by Total Assets amount and pick 5 companies with the largest amounts
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

install.packages("writexl")

library(writexl)

write_xlsx(top_5, path = "top_5_companies_2021.xlsx")



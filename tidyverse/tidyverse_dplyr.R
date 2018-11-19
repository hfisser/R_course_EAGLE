# dplyr
library(dplyr)

# import Steigerwald data
df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")


# group values based on a column and calculate summary stats
df %>% # this is our data. Don't know why they are using %>%
  group_by(LCname) %>%
  summarise(
    L8.evi_mean=mean(L8.evi),
    L7.evi_mean=mean(L7.evi)
  )

# add a new column based on others using mutate()
df_evi_mean <- df %>% 
  rowwise() %>% 
  mutate(Lt_ndvi_mean=mean(L8.ndvi,L7.ndvi,na.rm=T)
  )
View(df_Lt_ndvi_mean)


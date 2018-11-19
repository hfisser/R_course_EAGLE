#tidyr
library(tidyr)

# import Steigerwald data
df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")

# we would like to keep only columns of interest (coi)
df_edit <- df[c("L7.ndvi","L8.ndvi","LCname")]

# gather columns
df_gathered <- df_edit %>%
  gather(L7.ndvi,L8.ndvi,key=Sensor,value=Lt_ndvi)
View(df_gathered)



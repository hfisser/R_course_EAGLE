#purrr
library(purrr)
library(dplyr)

# check if df is a tibble
is.tibble(df) # TRUE
df <- read_csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")

# purrr is made for programming purposes
# map a function to the vectors

df_mean <- df %>%
  mutate(mean=pmap(.,~mean(c(L7.evi,L8.evi))))
View(df_mean)

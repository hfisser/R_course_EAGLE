install.packages("RCurl")
install.packages(tidyverse)
library(tidyverse)
library(RCurl)

df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")

head(df)

tail(df)

summary(df)

plot(df)

str(df)

names(df)

dim(df)

class(df)

levels(df)

lucas <- df$LUCAS_LC[]

ndvi <- df$L7.ndvi

frame()

df

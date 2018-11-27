# let's visualize spatial data
library(rgdal)
library(sf)
library(raster)
library(tiff)
library(tidyverse)
library(gstat)

# Steigerwald data
df <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
names(df)

# plot the locations with SRTM altitude by colour
ggplot(df, aes(x,y,color=SRTM))+geom_point()

# df1 with data of interest to be interpolated
x <- df$X
y <- df$y
evi <- df$L8.evi
df1 <- data.frame(x,y,evi)

grid <- data.frame(x,y)

# interpolate the evi from points
idw <- idw(a,grid=grid,coords=grid)


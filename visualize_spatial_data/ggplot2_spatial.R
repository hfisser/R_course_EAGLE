install.packages("ggmap")
install.packages("mapproj")
library(raster)
library(rgdal)
library(rasterVis)
library(RStoolbox)
library(ggmap)
library(mapproj)

map.cgn <- get_map("Cologne")

# data from RSToolbox
data(lsat)
# plot the band
lsat.df <- data.frame(coordinates(lsat),getValues(lsat))
lsat.df <- lsat.df[lsat.df$B3_dn!=0,]
ggplot(lsat.df)+geom_raster(aes(x=x,y=y,fill=B4_dn))+
  scale_fill_gradient(na.value=NA)+
  coord_equal()
# different colour scheme
ggplot(lsat.df)+
  geom_raster(aes(x=x,y=y,fill=B4_dn))+
  scale_fill_gradient(low="white",high="red",na.value=NA)+
  coord_equal()

# plot with ggR
ggR(lsat,layer=4,maxpixels=1e6,stretch="lin")

# load some raster
# Landsat 5 on hard disk
ls_LT05_b1 <- raster("E:/LT05_L1TP_170059_19950402_20170108_01_T1/LT05_L1TP_170059_19950402_20170108_01_T1_B1.TIF")
ls_LT05_b3 <- raster("E:/LT05_L1TP_170059_19950402_20170108_01_T1/LT05_L1TP_170059_19950402_20170108_01_T1_B3.TIF")
ls_LT05_b2 <- raster("E:/LT05_L1TP_170059_19950402_20170108_01_T1/LT05_L1TP_170059_19950402_20170108_01_T1_B2.TIF")
# stack three bands
stack <- stack(ls_LT05_b3,ls_LT05_b2,ls_LT05_b1)
plotRGB(stack,stretch="hist")
# to df
lsat5.df <- data.frame(coordinates(stack),getValues(stack))
View(lsat5.df)
# ok interesting
# plot with ggR
ggR(stack,layer=2,stretch="lin")
# use ggRGB  
ggRGB(stack,stretch="lin")

file.exists(Sys.which('texi2dvi'))

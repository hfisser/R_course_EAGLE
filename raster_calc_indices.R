library(raster)
library(rgdal)
install.packages("rasterVis")
library(rasterVis)

ls_LT05_b4 <- raster("E:/LT05_L1TP_170059_19950402_20170108_01_T1/LT05_L1TP_170059_19950402_20170108_01_T1_B4.TIF")
ls_LT05_b3 <- raster("E:/LT05_L1TP_170059_19950402_20170108_01_T1/LT05_L1TP_170059_19950402_20170108_01_T1_B3.TIF")
ls_LT05_b2 <- raster("E:/LT05_L1TP_170059_19950402_20170108_01_T1/LT05_L1TP_170059_19950402_20170108_01_T1_B2.TIF")

stack <- stack(ls_LT05_b4,ls_LT05_b3,ls_LT05_b2)
plotRGB(stack,stretch="lin")
stack

rasterAB <- rasterA * rasterB

raster_sd <- calc(ls_LT05_b3,fun=sd)

# ndvi

ndvicalc <- function(b4,b3) {
  return((b4-b3)/(b4+b3))
}

ndvi_LT05 <- ndvicalc(ls_LT05_b4,ls_LT05_b3)
ndvi_LT05 <- raster(matrix(runif(400, min=0.15, max=0.9)))

breaks <- seq(0, 1, by=0.01)
cols <- colorRampPalette(c("red", "yellow", "lightgreen"))(length(breaks)-1)
levelplot(ndvi_LT05, at=breaks, col.regions=cols)

# calculate ndvi using RStoolbox
library(RStoolbox)
ndvi_RStoolbox <- spectralIndices(stack,green="LT05_L1TP_170059_19950402_20170108_01_T1_B2",red="LT05_L1TP_170059_19950402_20170108_01_T1_B3",nir="LT05_L1TP_170059_19950402_20170108_01_T1_B4",indices="NDVI",scaleFactor=1,skipRefCheck=FALSE)
plot(ndvi_RStoolbox)

# savi
SAVIcalc <- function(b4,b3){
  return(((b4-b3)/(b4+b3+0.5))*(1+0.5))
}



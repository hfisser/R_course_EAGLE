library(raster)
library(rgdal)

ls_LT05_b4 <- raster("E:/LT05_L1TP_170059_19950402_20170108_01_T1/LT05_L1TP_170059_19950402_20170108_01_T1_B4.TIF")
ls_LT05_b3 <- raster("E:/LT05_L1TP_170059_19950402_20170108_01_T1/LT05_L1TP_170059_19950402_20170108_01_T1_B3.TIF")
ls_LT05_b2 <- raster("E:/LT05_L1TP_170059_19950402_20170108_01_T1/LT05_L1TP_170059_19950402_20170108_01_T1_B2.TIF")

stack <- stack(ls_LT05_b4,ls_LT05_b3,ls_LT05_b2)
plotRGB(stack,stretch="lin")

rasterAB <- rasterA * rasterB

raster_sd <- calc(ls_LT05_b3,fun=sd)

ndvicalc <- function(b4,b3) {
  (b4+b3)/(b4-b3)
  return(ndvi)
}

ndvi_LT05 <- ndvicalc(ls_LT05_b4,ls_LT05_b3)

SAVIcalc <- function(b4,b3){
  ((b4-b3)/(b4+b3+0.5))*(1+0.5)
  return(savi)
}


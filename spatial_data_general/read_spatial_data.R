install.packages("sf")
install.packages("raster")
install.packages("tiff")
library(rgdal)
library(sf)
library(raster)
library(tiff)

# import it with st_read (sf package)
temp <- st_read("SRTM_LUC_LC","data")
import <- as.data.frame(temp)

# import it with rgdal
library(rgdal)
temp1 <- readOGR("SRTM_LUC_LC","data")
import1 <- as.data.frame(temp1)

tiff <- raster("E:\\LT05_L1TP_170059_19950402_20170108_01_T1","LT05_L1TP_170059_19950402_20170108_01_T1_B2.tiff")



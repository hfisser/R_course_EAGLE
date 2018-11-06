# indexing

# change values of the data
x <- c(1,2,3,4,5,6,10,45,22,55,60,32,49,1239,11,19,193,19,5,7,3,24,5,6,77,4,2,46,54)

x <- numeric(length(x))
x[x<=30] <- 1
x[(x > 30) & (x <70) ] <- 2
x[x > 70] <- 3
x

summary(x)
sum(x)
cumsum(x)

rev(x)
sort(x, decreasing = TRUE)
sample(x,10)

# matrix

m1 <- matrix(c(4,6,7,3,4,9), nrow=2)
m1
m2 <- matrix(
  c(2,3,5,7,2,4),
  nrow=2,
  ncol=3,
  byrow=TRUE)
m2

m1[,2] # query 2 column
m1[2,] # query 2 row
m1[2,2] # query 2 row and 2 column

# create a vector with 80 entries based on normally distributed data
numbers_1 <- rnorm(80,mean=0,sd=1)
mat_1 <- matrix(numbers_1,nrow=20,ncol=4)
mat_1

# matrix values into a data frame
# the advantage is that we can use names and not only positions
df_1 <- data.frame(mat_1)
# assign column names
names(df_1) <- c("pH","sal","tur","den")

# dataframes
df_1 <- data.frame(plot="location_name_1",measure1=runif(100)*1000,measure2=round(runif(100)*100),
                   value=rnorm(100,2,1),ID=rep(LETTERS,100))
df_2 <- data.frame(plot="location_name_2",measure1=runif(50)*100,measure2=round(runif(50)*10),
                   value=rnorm(50),ID=rep(LETTERS,50))
df <- rbind(df_1,df_2)
df_1

# merging two dataframes
df <- rbind(df_1,df_2)

# basic statistics
summary(df)
str(df)
mode(df)
head(df)

# indexing a dataframe
df[,c('plot','measure1','measure2')]

# list from two vectors of different size
a <- runif(199)
b <- c("aa","bb","cc","dd","ee")
c <- list(a,b)

# index the second object
c[2]
# index first entry of second object
c[[2]][1]
c

df
df[df$measure2>86 & df$value<=1,]

# add a new column based on the products of two others
df$new_col <- df$measure1 * df$measure2
df

# query data using a keyword e.g. 'a' (quite simple) for the ID column
df[grep("a", df$ID, ignore.case=T),]

# order values
ordered(df$ID)

# binary
x1 <- rbinom(10,size=1,prob=0.5)
x2 <- factor(x1,labels=c("yes","no"))
summary(x2)
levels(x2)
as.character(x2)

install.packages("car")
library("car")
recode(x2,"'yes'='sure';'no'='maybe'")

# steigerwald data

df[,2]

# Task

#Just plot SRTM values above a predefined NDVI value
#Just plot NDVI values for SRTM values less than Y and landcover equal to X
#create a new data frame with all entries but only corresponding NDVI values above 0.5
#select data where LC values below x or above y

# df to SPDF
spdf.obj <- df
names(spdf)
install.packages("sp")
library("sp")
coordinates(spdf.obj) <- ~x+y
plot(spdf.obj)

# save as shapefile
install.packages("rgdal")
library("rgdal")
writeOGR(spdf.obj,"sample_point_with_data",driver="ESRI Shapefile","data")

# export only certain parts of the data

# only SRTM altitude>=350 and Landsat8-NDVI>=0.6
L8ndvi_mask_altitude_higher_350 <- df[df$SRTM>=350&df$L8.ndvi>=0.6,]

# all entries but only NDVI values above 0.5
NDVI_higher0.5 <- df[df$L8.ndvi>0.5,]

# NDVI values for SRTM altitude<300 and LC is cropland
# only lower 300m
mask1 <- df[df$SRTM<300,]
# only cropland!
mask2 <- mask1[grep('cropland',mask1$LCname,ignore.case=T),]
# only NDVI values and coordinates
NDVI_mask <- mask2[,c('L8.ndvi','x','y')]
# now export this for display in QGIS
coordinates(NDVI_mask) <- ~x+y
writeOGR(NDVI_mask,"NDVI_mask",driver="ESRI Shapefile","data")

# reimport the shapefile into R
import <- readOGR("spdf_NDVI_mask","data")
# convert it back to dataframe
df_NDVI_mask <- as.data.frame(import)

# just select LUCAS_LC and SRTM where NDVI larger equal than x
NDVI_mask1 <- df[df$L8.ndvi>=0.6,]
SRTM_LUCAS_LC <- NDVI_mask1[,c('SRTM','LUCAS_LC','x','y')]
coordinates(SRTM_LUCAS_LC) <- ~x+y
writeOGR(SRTM_LUCAS_LC,"SRTM_LUC_LC",driver="ESRI Shapefile","data")
#reimport the shapefile into R
import <- readOGR("SRTM_LUC_LC","data")

# from r tutorial ... try this
#crs.geo <- CRS("+proj=longlat +ellps=WGS84 +datum=WGS84")  # geographical, datum WGS84
#proj4string(locs) <- crs.geo  # define projection system of our data
#summary(locs)




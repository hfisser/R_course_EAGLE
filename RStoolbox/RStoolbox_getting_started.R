# install RStoolbox
install.packages("RStoolbox")
library(RStoolbox)
data(lsat)
lsat
# assess the structure of landsat data
str(lsat)

# library raster
install.packages("raster")
library(raster)
# create an empty raster
r1 <- raster(nrows=10,ncols=10)
r1
plot(r1)
# assign random values to the raster
r1[] <- rnorm(100)
r1
plot(r1)

# working with raster and dataframe
df <- data.frame(measure1=runif(1000)*100,measure2=round(rnorm(1000)*100))
length(df$measure1)
r1 <- raster(nrows=100,ncols=100)
r1
r1[] <- df$measure1[1:1000]
plot(r1)
r2 <- raster(nrows=100,ncols=100)
r2[] <- df$measure2[1:1000]
plot(r2)

# stack two rasters
r12 <- stack(r1,r2)
r12
plot(r12$layer.1)

r12$new <- r12[[1]]*r12[[2]]^2
r12
plot(r12$new)

r12$new1 <- r12

# convert raster to dataframe
df12 <- r12[]
head(df12)

lsat[[1]]
lsat$B1_dn
plot(lsat[[1]])
# copy second and third band to a new object
x <- lsat[[2:3]]

plot(lsat[[5]])

# indexing a raster layer stack
# [i,] this is the row (y)
# [,j] this is the column (x)
# [[k]] this is the layer (z)

# AniMove package is available on git


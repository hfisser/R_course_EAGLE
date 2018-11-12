## get tidyverse
## it includes 8 different packages. 
## you find an overview here: https://www.tidyverse.org/packages/
## you can also load only a single package from tidyverse

install.packages("tidyverse")
library(tidyverse)

# let's work with Steigerwald data 
stgw <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
# but only with Landsat 8 EVI data and SRTM elevation
stgw_evi <- stgw[,c("L8.evi","SRTM"),]

# some paramters we would like to use constantly
f <- "mono" # this is Courier font
c <- "#005a32"# this is a color as HEX code

# let's use ggplot2
ggplot(data=stgw_evi,aes(L8.evi,SRTM))+geom_point(color=c)+
  ggtitle("Landsat 8 EVI and elevation")+
  theme(plot.title=element_text(size=11,family=f,face="bold"))+
  labs(x="EVI Landsat 8",y="Elevation (m)")+
  theme(axis.title=element_text(size=9,family=f))+
  theme(axis.text.x=element_text(size=9,family=f))+
  theme(axis.text.y=element_text(size=9,family=f))+
  theme(aspect.ratio=1)
## some references for color choice:
## overview of R colors with true names http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
## colorbrewer2.org <- very useful especially for maps, provides HEX codes

# Annoyed by writing repetitive stuff?
# Write a custom theme!

theme_xy_plot <- function(base_size = 12, base_family = "mono"){
  theme_bw(base_size = base_size, base_family = base_family) %+replace%
  theme(
    axis.text=element_text(colour="black",size=9),
    strip.text=element_text(size=9),
    plot.title=element_text(size=11,family=f,face="bold",hjust=0.5,vjust=1),
    axis.title=element_text(size=9,family=f),
    legend.key=element_rect(colour=NA,fill=NA),
    aspect.ratio=1,
    panel.grid=element_blank(),   
    panel.border=element_rect(fill=NA,colour="black",size=0.5),
    panel.background=element_rect(fill="white",colour="black"), 
    strip.background=element_rect(fill=NA)
  )
}

# let's try our new theme
ggplot(data=stgw_evi,aes(L8.evi,SRTM))+
  geom_point(color=c)+
  ggtitle("Landsat 8 EVI and elevation")+
  theme_xy_plot()

# we are interested in a linear regression of the scatterplot
ggplot(data=stgw_evi,aes(L8.evi,SRTM))+
  geom_point(color=c)+
  ggtitle("Landsat 8 EVI and elevation")+
  theme_xy_plot()+
  # here comes linear regression
  geom_smooth(method=lm,
            se=FALSE) # don't add shaded confidence region

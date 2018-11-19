#tibble
library(tibble)
library(readr)

# import Steigerwald data using readr
df <- read_csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
# the base R import would be
df1 <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")
# check if it is a tibble. 
is_tibble(df) # TRUE because from readr
is_tibble(df1) # FALSE because from base R
# We can convert the R data.frame df1 to tibble
stgw_tibble <- as.tibble(df1)
# view the tibble in a new tab
View(stgw_tibble)
stgw_tibble # display the tibble in the console
# tibble fits your console screen much better than data.frame
df # display the data.frame in the console

# create a tibble from selected columns of the data.frame
LCname=c(df$LCname)
LUCAS_LC=c(df$LUCAS_LC)
SRTM=c(df$SRTM)
L8.evi=c(df$L8.evi)
X=c(df$X)
# create the tibble from the column vectors
stgw_tibble_subset <- tibble(LCname,LUCAS_LC,SRTM,L8.evi,X)
stgw_tibble_subset
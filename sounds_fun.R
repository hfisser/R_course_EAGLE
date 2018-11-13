install.packages("devtools")
library(devtools)
devtools::install_github("gaborcsardi/praise")
install.packages("praise")
library(praise)
praise()

# BRRR package

if(!require(devtools)) {install.packages(devtools)}
devtools::install_github("brooke-watson/BRRR")
install.packages("BRRR")
library(BRRR)

install.packages("beepr")
library(beepr)

if("Frederik" %in% members) {
  skrrrahh(10)
} else { skrrrahh(50)
}

for(i %in% 1:10) {
  skrrrahh(i)
}

skrrrahh(33)
skrrrahh_list()


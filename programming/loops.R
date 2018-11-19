# random for-loop
# let's first look at a common for-loop in R
srtm <-c()
evi_mean <- c()
for(i in 1:nrow(df)) {
  if(df$SRTM[i]>=400) {
    srtm <- c(srtm,SRTM[i])
    evi_mean <- c(evi_mean,mean(df$L7.evi[i],df$L8.evi[i],na.rm=T,trim=0))
  } else {
    print("you don't need else in this case")
  } 
}
df_res <- data.frame(srtm,evi_mean)
rm(srtm,evi_mean)
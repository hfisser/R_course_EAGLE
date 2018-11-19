#stringr
library(stringr)

# working with strings
x <- c("car","bike","e-bike","bicycle","bus","train","plane","taxi")
str_length(x)
#[1] 3 4 6 7 3 5 5 4
str_sub(x,1,3)
#[1] "car" "bik" "e-b" "bic" "bus" "tra" "pla" "tax"
str_subset(x,"[b]")
#[1] "bike"    "e-bike"  "bicycle" "bus"

# working in the pipe because it is tidyverse
x_new <- x %>%
  str_subset(.,"[aeiou]") %>%
  .[1:(str_length(.)-1)]
# you could do a lot of other things
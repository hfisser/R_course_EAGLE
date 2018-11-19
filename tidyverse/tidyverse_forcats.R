#forcats
library(forcats)

# semester 1 to 8
sem_levels <- c("sem1","sem2","sem3","sem4","sem5","sem6","sem7","sem8")
x1 <- c("sem4","sem2","sem8")

# x1 are the factors
factor(x1,sem_levels)  
# assume sth. is wrong in the factors. "sem1000" looks sick..
x2 <- c("sem4","sem1000","sem8")
# use parse_factor to reveal this
parse_factor(x2,sem_levels)
# parse_factor identifies "sem1000" as not valid
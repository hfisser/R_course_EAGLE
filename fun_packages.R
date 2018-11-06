# fun packages

install.packages('fortunes')
library(fortunes)
fortune()
fortune("memory")

install.packages("cowsay")
library(cowsay)
say("Hello world!")
someone_say_hello <- function() {
  animal <- sample(names(animals),1)
say(paste("Hello, I'm a", animal, ".", collapse=""), by = animal)
}
someone_say_hello()

someone_say_my_fortune <- function(){
  animal <- animal <- sample(names(animals),1)
  say(paste(fortune(), collapse="\n"),by=animal)
}
someone_say_my_fortune()

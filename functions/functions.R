# check your data automatically using if else
# define a
a <- 5

# if sth.
if(a<0)
{
  print("it is a positive number")
}

# if sth else sth
if(a!=5)
{
  print("number is not equal 5")
} else {
  print("number is equal 5")
}

# alternatives:
# for
# while

# example for while
j <- 0
while (j<1)
{
  j <- j+0.1;print(j)
}

# functions
# structure: function_new <- function(x,y) <- {x+y}
# this is a very simple function that you could always call again using myfunction

myfunction <- function(x,y){
  z <- x+y
  return(z)
}
myfunction(4,3)





############### fun packages ################

install.packages('fortunes')
install.packages("network")
install.packages("sna")
install.packages("maps")
install.packages("GGally")
library(GGally)
library(sna)
library(maps)
library(network)
library(fortunes)
library(ggplot2)
library(ggimage)
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

# suncalc
install.packages("suncalc")
library(suncalc)
getSunlightTimes(date=Sys.Date(),lat=49.782332,lon=9.970187,tz="CET")

# ????
????""

#####

ggplot(df,aes(x,y))+geom_image(aes(image=image),size=0.5,by='height')


## flight map
# networkmap (ggnet package)
ggnetworkmap(usa,flights,size=4,great.circles=TRUE,
             node.group=mygroup,segment.color="steelblue",
             ring.group=degree,weight=degree)

# NOT RUN {
# small function to display plots only if it's interactive
p_ <- GGally::print_if_interactive

invisible(lapply(c("ggplot2", "maps", "network", "sna"), base::library, character.only = TRUE))

## Example showing great circles on a simple map of the USA
## http://flowingdata.com/2011/05/11/how-to-map-connections-with-great-circles/
# }
# NOT RUN {
airports <- read.csv("http://datasets.flowingdata.com/tuts/maparcs/airports.csv", header = TRUE)
rownames(airports) <- airports$iata

# select some random flights
set.seed(1234)
flights <- data.frame(
  origin = sample(airports[200:400, ]$iata, 200, replace = TRUE),
  destination = sample(airports[200:400, ]$iata, 200, replace = TRUE)
)

# convert to network
flights <- network(flights, directed = TRUE)

# add geographic coordinates
flights %v% "lat" <- airports[ network.vertex.names(flights), "lat" ]
flights %v% "lon" <- airports[ network.vertex.names(flights), "long" ]

# drop isolated airports
delete.vertices(flights, which(degree(flights) < 2))

# compute degree centrality
flights %v% "degree" <- degree(flights, gmode = "digraph")

# add random groups
flights %v% "mygroup" <- sample(letters[1:4], network.size(flights), replace = TRUE)

# create a map of the USA
usa <- ggplot(map_data("usa"), aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), color = "grey65",
               fill = "#f9f9f9", size = 0.2)

# overlay network data to map
p <- ggnetworkmap(
  usa, flights, size = 4, great.circles = TRUE,
  node.group = mygroup, segment.color = "steelblue",
  ring.group = degree, weight = degree
)
p_(p)

## Exploring a community of spambots found on Twitter
## Data by Amos Elberg: see ?twitter_spambots for details

data(twitter_spambots)

# create a world map
world <- fortify(map("world", plot = FALSE, fill = TRUE))
world <- ggplot(world, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group), color = "grey65",
               fill = "#f9f9f9", size = 0.2)

# view global structure
p <- ggnetworkmap(world, twitter_spambots)
p_(p)

# domestic distribution
p <- ggnetworkmap(net = twitter_spambots)
p_(p)

# topology
p <- ggnetworkmap(net = twitter_spambots, arrow.size = 0.5)
p_(p)


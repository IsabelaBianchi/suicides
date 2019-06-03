# https://www.kaggle.com/zynicide/wine-reviews

# ler arquivo .csv
crashes <- read.csv2("suici2.csv", header = TRUE, 
                  sep = ";", stringsAsFactors = FALSE, encoding = "UTF-8")
colnames(crashes)[1] <- c("country")

library(dplyr)
# as.data.frame(table(wine$country))

numMillenials <- filter(crashes,generation=="Millenials")
numTotalEachCountry <- numMillenials %>% group_by(country) %>% summarise(X = sum(trunc(suicidesper100k)))


library(sp)
library(maps)
library(maptools)
library(leaflet)
library(rgeos)

world <- map("world", fill=TRUE, plot=FALSE)
world_map <- map2SpatialPolygons(world, sub(":.*$", "", world$names))
world_map <- SpatialPolygonsDataFrame(world_map,
                                      data.frame(country=names(world_map), 
                                                 stringsAsFactors=FALSE), 
                                      FALSE)

target <- subset(world_map, country %in% numTotalEachCountry$country)

bins <- c(100, 200,300, 400, 500, 600, 700, 800, Inf)
pal <- colorBin("YlOrRd", domain = numTotalEachCountry$X, bins = bins)

labels <- sprintf(
  "<strong>%s</strong><br/>%g suicides </sup>",
  numTotalEachCountry$country, numTotalEachCountry$X
) %>% lapply(htmltools::HTML)

leaflet(target) %>% addTiles() %>% 
  addPolygons(weight=1,
              fillColor = ~colorQuantile("YlOrRd", numTotalEachCountry$X)(numTotalEachCountry$X),
              label = labels,
              labelOptions = labelOptions(
                style = list("font-weight" = "normal", padding = "3px 8px"),
                textsize = "15px",
                direction = "auto")) %>% 
  addLegend(pal = pal, values = numTotalEachCountry$X, opacity = 0.8, title = "Suicides Since 1987",
                                                  position = "topright")


library(dplyr)
#pais <- filter(wine,country=="Brazil")
#pais <- select(pais,designation, points, price, province)
#count(pais, designation)
#summarise(pais, min(points), max(points))
#summarise(pais, min(price, na.rm = TRUE), max(price, na.rm = TRUE))


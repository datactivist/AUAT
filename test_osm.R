# inspiré de http://r-spatial.org/2017/07/14/Large_scale_OSM_in_R.html

library(RPostgreSQL)
library(sf)
library(tidyverse)

# récupérer les identifants (non stockés en clair)
dw <- config::get("toulouse")
# charger le driver PostGreSQL
driver <- dbDriver(dw$driver)

# créer la connection à la BDD
connection <- dbConnect(driver, dbname = dw$database,
                        host = dw$server, port = dw$port,
                        user = dw$uid, password = dw$pwd)
dbListTables(connection)

# Charger les données d'OSM
points <- dbGetQuery(connection, "SELECT * , ST_AsText(geom) AS geometry from nodes")
points <- points %>% 
  select(-geom) %>% 
  st_as_sf(wkt = "geometry", crs = 4326)

bikepark <- points %>% 
  filter(stringr::str_detect(tags, "bicycle_parking"))

bikepark %>% 
  mapview::mapview()
  
# lines <- dbGetQuery(connection, "SELECT * , ST_AsText(linestring) AS geom from ways")
lines <- st_read_db(connection, "ways")
lines <- lines %>% 
  select(-linestring) %>% 
  st_as_sf(wkt = "geom", crs = 4326)

cycleways <- lines %>% 
  filter(stringr::str_detect(tags, "cycleway")) 

streets <- lines %>% 
  filter(stringr::str_detect(tags, "cycleway|trunk|primary|secondary|tertiary"))

mapview::mapview(streets) + mapview::mapview(cycleways, color = "yellow")

library(leaflet)

leaflet() %>% 
  addProviderTiles(provider = "CartoDB.Positron") %>% 
  addPolylines(data = streets, weight = 1) %>% 
  addPolylines(data = cycleways, weight = 1, color = "red") %>% 
  addCircleMarkers(data = bikepark, radius = 5, stroke = FALSE, fillColor = "red")


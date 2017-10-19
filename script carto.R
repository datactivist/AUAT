library(tidyverse)
library(sf)
library(mapview)

elections <- read_csv("./data/Presidentielle_2017_Resultats_Communes_T1_clean.csv")

communes <- read_sf("./data/communes-20150101-100m.shp", stringsAsFactors = FALSE)

elections <- communes %>% 
  left_join(elections, by = c("insee" = "CodeInsee"))


elections_dpt <- elections %>% 
  group_by(CodeDepartement) %>% 
  select(contains("_ins"), Inscrits) %>% 
  summarise_at(vars(contains("_ins")), funs(weighted.mean(., w = Inscrits, na.rm = TRUE)))

inscrits <- elections %>% 
  group_by(CodeDepartement) %>% 
  summarise(Inscrits = sum(Inscrits))

departements <- communes %>% 
  mutate(codedpt = substr(insee, 1, 2)) %>%
  group_by(codedpt) %>% 
  summarise()
  
elections_dpt <- departements %>% 
  left_join(as.data.frame(elections_dpt) %>% select(-geometry), by = c("codedpt" = "CodeDepartement")) %>% 
  left_join(as.data.frame(inscrits) %>% select(-geometry), by = c("codedpt" = "CodeDepartement"))

library(tmap)



carte <- elections_dpt %>% 
  filter(codedpt < 96) %>% 
  tm_shape() +
  tm_polygons() +
#    tm_polygons(col = "Abstentions_ins", palette = "PuRd", n = 7, style = "jenks", title = "Abstention", textNA = "valeur manquante", legend.format = list(text.separator = "à")) +
#    tm_text(text = "codedpt", size = 0.8) +
    tm_bubbles(size = "Inscrits", col = "Abstentions_ins", scale = 2, palette = "PuRd", n = 7, style = "jenks", textNA = "valeur manquante", legend.format = list(text.separator = "à")) + 
    tm_compass(position = c("right", "top")) +
    tm_scale_bar(position = c("center", "bottom")) +
  tm_layout(title = "Ma première carte")

t <- tmap_leaflet(carte)


# avec cartography

library(cartography)
elections_dpt %>% 
  filter(codedpt < 96) %>%
  choroLayer(var = "Abstentions_ins", method = "quantile", nclass = 7)

# ggplot2 (version de dev)
library(ggplot2)
elections_dpt %>% 
  filter(codedpt < 96) %>%
  ggplot() +
  geom_sf(aes(fill = Abstentions_ins)) +
  theme_void()

library(leaflet)

elections_dpt %>% 
  filter(codedpt < 96) %>%
  st_transform(crs = 4326) %>% 
  leaflet() %>% 
  addTiles() %>% 
  addPolygons(fillColor  = ~ colorQuantile("Reds", domain = Inscrits)(Inscrits), weight = 1, color = "grey", fillOpacity = 0.8) %>% 
  addCircles(data = elections_dpt %>%   filter(codedpt < 96) %>%
                     st_transform(crs = 4326) %>% 
                     st_centroid(),
                   radius = ~ sqrt(Inscrits)*3, weight = 10) %>% 
  addLegend(pal = colorQuantile("Reds", domain = elections_dpt$Inscrits), values = ~Inscrits)

library(mapedit)
resultat <- editMap(mapview(departements))

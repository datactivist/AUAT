library(sf)
library(tidyverse)
library(rmapshaper)
communes <- st_read("/media/Data/Dropbox/ADMINEXPRESS/ADE-COG_1-0_SHP_LAMB93_FR/COMMUNE_CARTO.shp") # https://www.data.gouv.fr/fr/datasets/admin-express/
# simplification
communes_light <- ms_simplify(communes, keep = 0.001, keep_shapes = TRUE)

communes_light <- st_transform(communes_light, crs = 4326) # attention, le geojson doit toujours être en WGS84 ! https://tools.ietf.org/html/draft-butler-geojson-04

st_write(communes_light, "./data/communes.geojson")

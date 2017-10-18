library(tidyverse)
baro <- read_csv("./data/BarometreDuNumerique20072016.csv")

baro %>% 
  filter(annee %in% 2016) %>% 
  count(AGGLO5, wt = POND)

baro %>% 
  filter(annee %in% 2016) %>% 
  group_by(AGGLO5) %>% 
  summarise(n = sum(POND))
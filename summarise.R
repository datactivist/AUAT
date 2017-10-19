library(tidyverse)
library(readxl)
ZE2010 <- read_xls("./data/ZE2010 au 01-01-2017.xls", sheet = "Composition_communale", skip = 5)

pres2017T1_communes <- read_csv("./data/Presidentielle_2017_Resultats_Communes_T1_clean.csv")
                                
elections <- pres2017T1_communes %>% 
  left_join(ZE2010, by = c("CodeInsee" = "CODGEO"), ) %>% 
  glimpse()

elections %>% 
  group_by(ZE2010) %>% 
  summarise_at(vars(Inscrits, Abstentions, Votants, Blancs, Nuls, Exprimés, `LE PEN`:CHEMINADE), funs(sum(.)))

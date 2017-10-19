library(FactoMineR)
acp <- pres2017T1_communes %>% 
  filter(Inscrits > 10000) %>% 
  select(contains("_ins")) %>% 
  PCA(graph = FALSE, )

library(explor)
explor(acp)

cah <- HCPC(acp, graph = FALSE)

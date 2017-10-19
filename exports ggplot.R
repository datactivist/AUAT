library(corrr)
pres2017T1_communes %>% 
  select(contains("_ins")) %>% 
  correlate %>% 
  rearrange(method = "HC", absolute = FALSE) %>%  # trier par corrélation
  shave() %>% 
  fashion()

pres2017T1_communes %>% 
  select(contains("_ins")) %>% 
  correlate %>% 
  rearrange(method = "HC", absolute = FALSE) %>%  # trier par corrélation
  shave() %>% 
  rplot()

library(ggplot2)
library(hrbrthemes)

cairo_pdf("./graphique.pdf", width = 10, height = 10)
pres2017T1_communes %>% 
  filter(Inscrits > 10000) %>% 
  ggplot(aes(x = Abstentions_ins, y = `LE PEN_ins`)) +
  geom_point(aes(size = Inscrits), alpha = 0.1) +
  geom_smooth(method = "lm") +
  scale_size_continuous(trans = "log10", range = c(0.01, 10)) +
  theme_ipsum(grid = "XY")
dev.off()

Cairo::CairoPNG("./graphique.png", width = 800, height = 600)
pres2017T1_communes %>% 
  filter(Inscrits > 10000) %>% 
  ggplot(aes(x = Abstentions_ins, y = `LE PEN_ins`)) +
  geom_point(aes(size = Inscrits), alpha = 0.1) +
  geom_smooth(method = "lm") +
  scale_size_continuous(trans = "log10", range = c(0.01, 10)) +
  theme_ipsum(grid = "XY")
dev.off()


g <- pres2017T1_communes %>% 
  gather(candidat, resultat, contains("_ins")) %>% 
  ggplot(aes(x = candidat, y = resultat)) +
  geom_boxplot(aes(weight = Inscrits)) +
  coord_flip()

coefs <- ggplot_build(g)$data
  
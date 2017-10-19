modele1 <- pres2017T1_communes %>% 
  lm(`LE PEN_ins` ~ Inscrits + Abstentions_ins + CodeDepartement, data = .)

modele2 <- pres2017T1_communes %>% 
  lm(`LE PEN_ins` ~ Inscrits + Abstentions_ins + CodeDepartement, data = ., weights = Inscrits)

modele3 <- pres2017T1_communes %>% 
  lm(`LE PEN_ins` ~ log(Inscrits) + Abstentions_ins + CodeDepartement, data = ., weights = Inscrits)

modele4 <- pres2017T1_communes %>% 
  lm(`LE PEN_ins` ~ 0 + log(Inscrits) + Abstentions_ins + CodeDepartement, data = ., weights = Inscrits)


summary(modele1)
summary(modele2)
summary(modele3)

library(texreg)
screenreg(list(modele1, modele2, modele3, modele4))

predict(modele4, newdata = data_frame(Inscrits = 50000, Abstentions_ins = 25, CodeDepartement = "31"), se.fit = TRUE, interval = "confidence")

predict(modele4, newdata = data_frame(Inscrits = 50000, Abstentions_ins = 25, CodeDepartement = "11"))

library(broom)
modeles <- pres2017T1_communes %>% 
  group_by(CodeDepartement) %>% 
  do(modeles = lm(`LE PEN_ins` ~ 0 + log(Inscrits) + Abstentions_ins, data = ., weights = Inscrits))

modeles %>% tidy(modeles)
modeles %>% glance(modeles) %>% arrange(desc(r.squared))
modeles %>% augment(modeles, conf.int = TRUE) %>% 
  ggplot(aes(x = LE.PEN_ins, y = .fitted)) +
  geom_point() +
  geom_smooth()

modeles %>% augment(modeles) %>% 
  ggplot(aes(x = .fitted, .resid)) +
  geom_point() +
  geom_smooth()

library(lme4)
modele5 <- lmer(`LE PEN_ins` ~Inscrits + Abstentions_ins + (1 | CodeDepartement), data = pres2017T1_communes)
screenreg(list(modele1, modele2, modele3, modele4, modele5))
modele6 <- lmer(`LE PEN_ins` ~Inscrits + Abstentions_ins + (1 + Inscrits | CodeDepartement), data = pres2017T1_communes)
screenreg(list(modele1, modele2, modele3, modele4, modele5, modele6))


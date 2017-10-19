elections %>% 
  group_by(Département) %>% 
  do(quantiles = quantile(.$Abstentions_ins, probs = c(seq(0,1, 0.1)))) %>% 
  mutate(mediane = quantiles[[6]])

library(tidyverse)
h <- read_csv("../../datasets/heart_disease_clean.csv", na = "?")
thallium_code <- 
  data.frame(thallium = c(3, 6, 7),
             thallium_result = c("normal", "fixed defect", "reversible defect"))
h <- left_join(h, thallium_code) %>%
  select(-thallium) %>%
  rename(thallium = thallium_result) %>%
  mutate(fasting_blood_sugar_flag = factor(ifelse(fasting_blood_sugar_flag, "Y", "N"), levels = c("Y", "N")),
         exercise_induced_flag = factor(ifelse(exercise_induced_flag, "Y", "N"), levels = c("Y", "N")),
         thallium = forcats::fct_relevel(thallium, c("normal", "reversible defect"))) 
# glimpse(h)
save(h, file = "data/angina.RDA")

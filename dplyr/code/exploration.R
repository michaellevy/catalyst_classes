library(tidyverse)
d = read_csv("data/DataScience_TrainingDataset_DO_NOT_DISTRIBUTE.csv")
d
glimpse(d)

grep("[a-zA-Z]", d$AdmitAgeNBR, value = TRUE)
d = read_csv("data/DataScience_TrainingDataset_DO_NOT_DISTRIBUTE.csv", na = "NULL")
grep("[a-zA-Z]", d$AdmitAgeNBR, value = TRUE)
glimpse(d)

d1 = read_csv("data/DataScience_TrainingDataset_DO_NOT_DISTRIBUTE.csv", col_types = "ccccciiiic")
tidyr::replace_na(d1, )
sum(is.na(d$AdmitAgeNBR))
filter(d1, !complete.cases(d1))
nrow(d1)
d[40648, ]
d1[40646, ]

count(d, UniqueID, sort = TRUE) %>%
  top_n(1, n) %>%
  .$UniqueID %>%
filter(d, UniqueID == "4.60E+08")

glimpse(d)
read_tsv("data/gapminder.txt", skip = 5)
read_lines("data/gapminder.txt", n_max = 10)

glimpse(d)

d %>%
  count(AdmitTypeDSC, InpatientReadmit30FLG) %>%
  ggplot(aes(x = reorder(AdmitTypeDSC, n, sum), y = n, fill = InpatientReadmit30FLG)) + 
  geom_bar(stat = "identity", position = "stack") +
  coord_flip()

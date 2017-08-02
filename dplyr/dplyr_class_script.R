# Use R as a calculator
2 ^ 10

# Install extensions "packages"
install.packages("tidyverse")  # Once
# Load that package
library(tidyverse)   # Every time we want to use

## Import the csv
read_csv("data/DataScience_TrainingDataset_DO_NOT_DISTRIBUTE.csv")
d <- read_csv("data/DataScience_TrainingDataset_DO_NOT_DISTRIBUTE.csv")
glimpse(d) # Quick view
summary(d)  # more detail

## NULL values
odds = c(1, 3, 5)
c(1, NULL, 5)  # NULL is not missing-value in R
with_missing = c(1, NA, 5)  # NA is
mean(with_missing)
# Ignore missing values
mean(with_missing, na.rm = TRUE)

# Extract vector from data frame with $
d$AdmitAgeNBR
grep("[a-zA-Z]", d$AdmitAgeNBR, value = TRUE)

# Account for missing values
d <- read_csv("data/DataScience_TrainingDataset_DO_NOT_DISTRIBUTE.csv", 
         na = "NULL")
glimpse(d)

# %>% = pipe
odds %>% sum()
# Same as
sum(odds)
# Same as
odds %>%
  sum()

# Filter to select rows
d %>%
  filter(MaritalStatusDSC == "Married")
# Combine conditions with & (and), | (or)
d %>%
  filter(AdmitTypeDSC == "Emergency" | AdmitTypeDSC == "Urgent")

# MCQ
d %>%
  filter(GenderCD != "Male" & GenderCD != "Female")
d %>%
  count(GenderCD)

# Arrange rows
d %>%
  arrange(desc(VitalsPulseMaxNBR)) %>%
  print(n = 5, width = 999)

# Building pipelines
d %>%
  filter(GenderCD == "Male") %>%
  arrange(AdmitAgeNBR)

# Select columns (not create new ones!)
d %>%
  filter(GenderCD == "Male") %>%
  arrange(AdmitAgeNBR) %>%
  select(UniqueID, AdmitTypeDSC, VitalsPulseMaxNBR, AdmitAgeNBR)

# Exclude columns
d %>%
  filter(GenderCD == "Male") %>%
  arrange(AdmitAgeNBR) %>%
  select(-UniqueID)

# Can use positions
d %>%
  filter(GenderCD == "Male") %>%
  arrange(AdmitAgeNBR) %>%
  select(1, 3, 5)

# Rename
d %>%
  filter(GenderCD == "Male") %>%
  arrange(AdmitAgeNBR) %>%
  select(id = UniqueID, AdmitTypeDSC, VitalsPulseMaxNBR, AdmitAgeNBR)

# mutate
# create new columns, e.g. length of stay in years
glimpse(d)
d %>%
  mutate(stayInYears = LengthOfStayDaysNBR / 365.25) %>%
  select(LengthOfStayDaysNBR, stayInYears)

# group by and summarize
d %>%
  group_by(AdmitTypeDSC) %>%
  summarize(average_stay = mean(LengthOfStayDaysNBR))  # Like mutate, creates a column

# group_by %>% mutate is like self-join
d %>%
  group_by(AdmitTypeDSC) %>%
  mutate(average_stay = mean(LengthOfStayDaysNBR)) %>%  # Like mutate, creates a column
  select(AdmitTypeDSC, average_stay)

# ctrl/cmd-shift-m to create pipe
# %>% %>% %>% %>% %>% %>% %>% %>% 

# Challenge question
# What are the mean and median lengths of stay for emergency 
# visits for the various genders in various maritial statuses?
d %>%
  group_by(GenderCD, MaritalStatusDSC) %>%
  summarize(mean_length_of_stay = mean(LengthOfStayDaysNBR),
            median_length_of_stay = median(LengthOfStayDaysNBR)) %>%
  arrange(desc(mean_length_of_stay))

# Bonus question:
d %>% 
  filter(GenderCD != "Unknown") %>%
  ggplot(aes(x = MaritalStatusDSC, y = LengthOfStayDaysNBR, fill = GenderCD)) + 
  geom_boxplot() +
  scale_y_log10() 


# Brad Hansen's question about storing the results of a pipeline
stay_by_gender_and_maritial <- d %>%
  group_by(GenderCD, MaritalStatusDSC) %>%
  summarize(mean_length_of_stay = mean(LengthOfStayDaysNBR),
            median_length_of_stay = median(LengthOfStayDaysNBR)) %>%
  arrange(desc(mean_length_of_stay))
stay_by_gender_and_maritial

# OR, can assign out at the end (this will freak some people out)
d %>%
  group_by(GenderCD, MaritalStatusDSC) %>%
  summarize(mean_length_of_stay = mean(LengthOfStayDaysNBR),
            median_length_of_stay = median(LengthOfStayDaysNBR)) %>%
  arrange(desc(mean_length_of_stay)) -> summary_table
summary_table


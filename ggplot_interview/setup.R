library(tidyverse)
setwd("Insight/interview_prep/health_catalyst/class/")
d = read_csv("No-show-Issue-Comma-300k.csv")
d = filter(d, Age > 0)
d = select(d,
           age = Age,
           gender = Gender,
           diabetes = Diabetes,
           hypertension = HiperTension,
           tuberculosis = Tuberculosis,
           alcoholism = Alcoolism,
           smokes = Smokes,
           subsidized = Scholarship,
           days_to_appt = AwaitingTime,
           appt_day = DayOfTheWeek,
           reminders = Sms_Reminder,
           status = Status
)
d$days_to_appt = - d$days_to_appt
set.seed(34426)
d = d[caret::createDataPartition(d$status, p = .01)[[1]], ]
sd = 2
d = mutate(d, health_risk = 
               ifelse(age < 30, rnorm(nrow(d), 0, sd),
                      ifelse(age < 50, rnorm(nrow(d), 1, sd),
                             ifelse(age < 70, rnorm(nrow(d), 3, sd * 1.5), 
                                    rnorm(nrow(d), 5, sd * 2)))) +
               alcoholism * 3 + smokes * 2 + 
               diabetes + hypertension + .5 * tuberculosis +
               runif(nrow(d), 0, 1)) %>%
    select(-(3:7))
d$health_risk[d$gender == "M"] = d$health_risk[d$gender == "M"] * 1.2
d$health_risk = d$health_risk - min(d$health_risk) 
d$health_risk = d$health_risk * 100 / max(d$health_risk)
d = d[, c(1:3, 8, 4:7)]
d$subsidized = as.logical(d$subsidized)
d$reminders = ifelse(d$reminders == 0, "none",
                     ifelse(d$reminders == 1, "one", "repeated"))
write_csv(d, "data/appt_data.csv")

# Explore plotting options

ggplot(d, aes(fill = status, x = health_risk)) + 
    geom_density(alpha = .5)

ggplot(d, aes(x = age, y = health_risk, color = gender)) +
    geom_jitter(size = .3) +
    geom_smooth(method = 'lm') 

ggplot(d, aes(x = factor(subsidized),
              y = age,
              color = factor(status))) + 
    geom_boxplot()
library(tidyverse)
h <- read_csv("../../datasets/heart_disease_clean.csv", na = "?")
glimpse(h)

mean(h$age)
median(h$age)
table(h$age)[table(h$age) == max(table(h$age))]
sd(h$age)
var(h$age)
mad(h$age)
sd(h$age) / mean(h$age)
ggplot(h, aes(age)) + 
  geom_density(fill = "blue") +
  geom_vline(xintercept = mean(h$age), color = "red") +
  geom_vline(xintercept = mean(h$age) + c(-1, 1) * mad(h$age), color = "orange") +
  geom_vline(xintercept = mean(h$age) + c(-1, 1) * 2 * mad(h$age), color = "yellow") +
  geom_vline(xintercept = median(h$age), linetype = "dashed") + 
  geom_vline(xintercept = as.numeric(names(table(h$age)[table(h$age) == max(table(h$age))])),
             linetype = "dotted")

mean(abs(h$age - mean(h$age)))
sqrt(mean((h$age - mean(h$age)) ^ 2))
cor(select(h, age, max_HR, cholesterol))

ggplot(h, aes(age, max_HR)) + 
  geom_point()

glimpse(h)
t.test(h$age[h$sex == "M"], h$age[h$sex == "F"]) 
t.test(age ~ sex, h, var.equal = TRUE)
lm(age ~ sex, h) %>% summary
set.seed(324)
t.test(rnorm(10, 1, 1), mu = 0, conf.level = .95)

t.test(seq(-30, 70, len = 10), rnorm(10, 0, 10), conf.level = .95)
mean(seq(-30, 70, len = 10))

glimpse()

t.test(1:10, y = c(7:20))      # P = .00001855
t.test(1:10, y = c(7:20, 200), var.equal = T) # P = .1245    -- NOT significant anymore


ggplot(h, aes(x = age, fill = sex)) + 
  geom_density(alpha = .5)

mutate(h, sex_num = ifelse(sex == "F", 0, 1)) %>%
  ggplot(aes(y = age, x = sex_num)) + 
  geom_violin(aes(group = sex_num)) + 
  geom_point() +
  geom_smooth(method = "lm")

# Correlation
with(h, cor(age, max_HR))

n = 1000
sd = 15
df <- 
  tibble(
    x = runif(n, 0, 100),
    y1 = x * .25 + rnorm(n, 0, sd),
    y2 = x * 2 + rnorm(n, 0, sd)
  )

gather(df, key = response, value = y, -x) %>%
  ggplot(aes(x = x, y = y)) + 
  geom_point(size = .2) + 
  facet_wrap(~ response)

cor(df$x, df$y1)
cor(df$x, df$y2)


## p-values
pbinom(8, 10, prob = .5, lower.tail = FALSE)
pbinom(80, 100, prob = .5, lower.tail = FALSE)

t.test(h$age, null = 50)
ggplot(h, aes(x = age)) + 
  geom_density() 


data_frame(sample(1:10, 14, repl = TRUE), y = c(7:20))

t.test(c(7:20, 20000), null = 6)

load("data/angina.RDA")
glimpse(h)
with(h, table(thallium, narrowing_num_vessels)) %>%
  plot()
chisq.test(table(h$thallium, h$narrowing_num_vessels))

set.seed(2345)
rolls = sample(6, 10, TRUE)
plot(table(rolls))
chisq.test(table(rolls))
plot(table(h$sex, h$chest_pain_type))


plot(h$age, h$cholesterol) 
lm(cholesterol ~ age, h) %>% summary

glimpse(h)
purrr::keep(h, is.numeric) %>%
  cor(use = "pairwise") %>%
  corrplot::corrplot(method = "ellipse", addCoef.col = "black", diag = FALSE)

ggplot(h, aes(x = age, y = cholesterol, color = sex)) + 
  geom_point() + 
  geom_smooth(method = "lm")

glimpse(h)
ggplot(h, aes(x = BP_at_admit, y = cholesterol, color = sex)) + 
  geom_point() +
  geom_smooth(method = "lm") 
  
lm(cholesterol ~ BP_at_admit + age + sex + exercise_induced_flag, h) %>%
  summary()

m1 <- lm(cholesterol ~ age, h)
m2 <- lm(cholesterol ~ age + sex, h)
m2.1 <- lm(narrowing_num_vessels ~ age + sex + thallium, h)
summary(m2.1)

m3 <- lm(cholesterol ~ age * sex, h) 
summary(m3)
m4 <- lm(cholesterol ~ age * sex + BP_at_admit, h) 
BIC(m1, m2, m3, m4)

h$predictions <- predict(m3)
ggplot(h, aes(x = age, color = sex)) + 
  geom_point(aes(y = cholesterol), shape = 1) + 
  geom_line(aes(y = predictions)) 
?predict.lm


fortify(m3) %>% 
  
  ggplot(aes(x = age, y = .resid, color = sex)) + 
  geom_point()

h$predicted_chol <- predict(m3) 
ggplot(h, aes(x = cholesterol, y = predicted_chol)) + 
  geom_point() +
  geom_abline(slope = 1, color = "red")

new_data <- data.frame(age = 40, sex = "F")
predict(m3, newdata = new_data, interval = "confidence")

new_data <- expand.grid(age = 20:100, sex = c("M", "F"))
new_data$predict <- predict(m3, new_data)
head(new_data)
ggplot(new_data, aes(x = age, color = sex, y = predict)) + 
  geom_point()
ggplot(h, aes(x = age, color = sex, y = cholesterol)) + 
  geom_smooth(method = "lm", se = FALSE)

lm(narrowing_num_vessels ~ thallium, h) %>%
  summary()

library(tidyverse)
library(broom)
load("data/angina.RDA")
glimpse(h)
cor.test(h$age, h$max_HR) %>%
  tidy()
t.test(h$age ~ h$sex) %>%
  tidy()

lm(cholesterol ~ chest_pain_type, h) %>%
  aov()
unique(h$ECG)
aov(cholesterol ~ ECG + sex, h) %>%
  # summary()
  TukeyHSD() %>%
  tidy()
  
aov(cholesterol ~ chest_pain_type + age, h) %>% 
  tidy()

d <- data.frame(x = runif(5, 0, 10))
d$y <- d$x * 2 + rnorm(5, 0, 1)
qplot(x, y, data = d)
lm(y ~ x, d) %>% summary


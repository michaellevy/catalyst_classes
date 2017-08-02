# R as a calculator
2 + 2
3 - 1
4 * 5
9 / 3
9 ^ 2
2 + 2 * 3
(2 + 2) * 3  # Order of operations matters

# White space is ignored
2 + 2 * 3
2     + 2
2 +
    2

# Scientific notation
2 / 100000
7e9

# Functions
log(100)
exp(2)
# Nest functions
log(exp(2))

# Logical comparison
2 == 2
2 != 1
2 > 1
2 <= 1

# Variable assignment
x <- 3
x ^ 2
(x <- x ^ 2)  #  Parentheses around a whole line return the value even though it's assigned
x

# MCQ 1
a <- 1
b <- 2
c <- a + b
b <- 4
a <- b
c <- a
c

c <- "a"
c

some_letters = "afd"
some_letters  # Separate with underscores
someLetters = "jkl"  # tab for auto-complete

log(100)
?log
# Specify arguments by order or by name
log(x = 9, base = 3)
log(9, 3)
# If arguments are named, can be in any order
log(base = 3, x = 9)
# Double ? searches helpfiles
??logarithm

# Errors, warnings, and messages
log("some words")
log(-1)
message("Hey all!")

# Data challenge 1
elephant1_kg <- 3492  
elephant2_lb <- 7757
elephant1_lb <- elephant1_kg * 2.2
elephant1_lb > elephant2_lb


# Load the data
install.packages("tidyverse")  # Run once to download
library(tidyverse)  # Run in each R session
read_csv("data/appt_data.csv")
x <- 2 + 2
d <- read_csv("data/appt_data.csv")
d
summary(d)


# Visualization
ggplot(data = d, mapping = aes(x = age, y = days_to_appt)) +
    geom_point()

ggplot(data = d, mapping = aes(x = age, y = days_to_appt)) +
    geom_point() +
    ylab("Days to appointment")

# Data challenge 2
d
ggplot(data = d, mapping = aes(x = age, y = health_risk)) +
    geom_point()

# Add color to the points
ggplot(data = d, mapping = aes(x = age, 
                               y = health_risk, 
                               color = subsidized)) +
    geom_point()

# Manually change plot aspects -- outside aes()
ggplot(data = d, mapping = aes(x = age, 
                               y = health_risk)) +
    geom_point(color = "blue", size = 3, shape = 10)

# One continuous variable
ggplot(d, aes(x = health_risk)) +
    geom_histogram()
# Change bin size
ggplot(d, aes(x = health_risk)) +
    geom_histogram(binwidth = 1)
ggplot(d, aes(x = health_risk)) +
    geom_histogram(bins = 5)
# Alternatively, density curve
ggplot(d, aes(x = health_risk)) +
    geom_density()
# The analog of binwidth is adjust
ggplot(d, aes(x = health_risk)) +
    geom_density(adjust = .1)
ggplot(d, aes(x = health_risk)) +
    geom_density(adjust = 5)
# Add some color
ggplot(d, aes(x = health_risk)) +
    geom_density(adjust = .1, color = "red", fill = "blue")

# One categorical variable
d
ggplot(d, aes(x = reminders)) + 
    geom_bar(stat = "count")

# One categorical and one continuous
ggplot(d, aes(x = gender, y = age)) + 
    geom_boxplot()
# Alternatively
ggplot(d, aes(fill = gender, x = age)) + 
    geom_density(alpha = .5)

# Does the number of days between the appointment and when it was scheduled 
# (days_to_appt) affect no-show rates?
ggplot(d, aes(x = status, y = days_to_appt)) + 
    geom_boxplot() +
    scale_y_log10()

# Bonus: Is the above relationship different for those who are on a medical subsidy? Can you examine all four groups (show-up and no-show, and subsidized and not) in one plot?
ggplot(d, aes(x = status, y = days_to_appt, color = subsidized)) + 
    geom_boxplot() +
    scale_y_log10()

ggplot(d, aes(color = status, y = days_to_appt, x = subsidized)) + 
    geom_boxplot() +
    scale_y_log10()

# Faceting
myplot <- 
    ggplot(d, aes(x = days_to_appt, fill = status)) + 
    geom_density(alpha = .5) + 
    scale_x_log10() +
    facet_wrap(~ subsidized, labeller = label_both) + 
    theme_bw()
ggsave("output/myFirstPlot.png", myplot)

# Add fitted models
ggplot(d, aes(x = age, y = health_risk, color = gender)) + 
    geom_point(size = .2) +
    geom_smooth(method = "lm")

##### Final Challenge

# Final challenge
# 
# Examine how the relationship between health-risk and age 
# differs across genders and subsidies. 
# Save the plot to your results directory.
# 
# There are several ways to do this. Start without reading the recipe below. 
# If you get stuck here are some steps to help:
#     
# Create a scatter plot of health-risk vs age
# Color the points by gender
# Facet the plot by subsidized
# Add a best-fit line with geom_smooth(method = "lm")
#
# Bonus: Does it look like health-risk and age are linearly related? 
# Can you figure out how to add another line to your plot to transform 
# the data to better represent their relationship. 
# Feel free to use Google, help-files, etc.


d %>%
    group_by(gender) %>%
    summarize(avg_risk = mean(health_risk))

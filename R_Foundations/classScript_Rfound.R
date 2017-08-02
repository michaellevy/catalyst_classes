# MCQs: http://tinyurl.com/hc-rfound-mcq
10 * 3
7 ^ 2

# Assignment
2 ^ 5
x <- 2 ^ 5
# Wrap in parenthes to print
(y <- 8 / 3)
(z <- 5 ^ 4)
x <- "the dog"
y <- y * 2

# MCQ1 (c)
price_per_truffle <- 75
number_truffles <- 5
total_value <- price_per_truffle * number_truffles
# Oh no, they're spoiling!
price_per_truffle <- price_per_truffle - (price_per_truffle * 1/3)
total_value <- price_per_truffle * number_truffles
total_value

# Data types
## Logical.
TRUE
FALSE
## Numeric
1
1.1
## Characters
# Always in quotes
"x"  # strings
x  # variable

is_it_50 <- total_value == 50
x != "the cat"

# Functions
c(2, 4, 6, 8)
sum(2, 4, 6, 8)
(evens <- c(2, 4, 6, 8))
sum(evens)
sqrt(evens)
odds <- c(1, 3, 5, 7)
evens + odds
evens - odds
# Vectorized comparisons
evens > odds
evens > 4  # recycling can be useful
evens > c(5, 2)  # recycling can be scary
evens > c(1, 2, 3)

1:30
letters
LETTERS
rep(3, 5)
rep("abc", 10)
rnorm(5, 100, 10)
?rnorm  # For help
rnorm(10)
# Two ways to specify arguments:
## In order
rnorm(5, 100, 10)
## By name
rnorm(n = 5, mean = 100, sd = 10)
rnorm(mean = 100, sd = 10, n = 5)

# Finding Functions exercise
threes <- seq(from = 3, to = 300, by = 3)
# Create a vector with ten evenly-spaced numbers starting with 
# one and ending with one-million. 
# What is the sum of the second and ninth entries in this vector?
my_seq <- seq(1, 1e6, length.out = 10)
sum(my_seq[c(2, 9)])

# Subsetting
## By index
threes[1]
threes[1:3]
letters[10]

## By logical
threes == 9
threes[threes == 9]
threes[threes > 50]
threes[threes > 40 & threes < 60]
threes[threes < 10 | threes >= 280]
threes[sqrt(threes) %% 1 == 0]

# Subsetting exercise (c)
set.seed(84121)  # Control randomness to ensure we all get the same result
flips <- rbinom(n = 100, size = 10, p = 0.5)  # Simulate flips
heads_heavy <- flips[flips >= 8]
length(heads_heavy)
sum(flips >= 8)
as.numeric(flips >= 8)
?rbinom
pbinom(7, 10, 0.5, lower.tail = FALSE)
replicate(100, sum(rbinom(n = 100, size = 10, p = 0.5) >= 8))

# Vectorization is fast
system.time({
mean(1:1e8)
})

# Missing values
NA # missing
NULL # nothing

withMissing <- threes[c(1, 10, 100, 1000)]
sum(withMissing)
sum(withMissing, na.rm = TRUE)
is.na(withMissing)
# Replacing missing values
withMissing[is.na(withMissing)] <- 0
withMissing

# Data frames
data.frame(letters = c("a", "b", "c"), numbers = c(1, 2, 3))
df <- data.frame(letters = c("a", "b", "c"), numbers = c(1, 2, 3))
df
# extract a vector from a data frame with $
the_numbers <- df$numbers
df$numbers ^ 2
df$squares <- df$numbers ^ 2
df

# Real data frame
readmit <- read.csv("https://www.dropbox.com/s/2njq3fbt6v541xq/diabetes_readmit.csv?dl=1")
readmit
head(readmit, n = 10)
str(readmit)
summary(readmit)
View(readmit)

sqrt(readmit$age)
sort(readmit$age, decreasing = TRUE)
table(readmit$medical_specialty)
table(readmit$gender, readmit$readmitted)

readmit$time_in_hospital[readmit$gender == "Male"]
table(readmit$readmitted)
readmit$readmitted <- ifelse(readmit$readmitted == "NO", "no", "yes")
head(readmit)
readmit$tmp <- NULL
head(readmit)

# Final exercise

# Is the number of medications given per day in the hospital different 
# for patients who are versus are not readmitted?
# calculate number of meds per day
readmit$meds_per_day <- readmit$num_medications / readmit$time_in_hospital
head(readmit)
# separate readmited vs not patients
meds_readmitted <- readmit$meds_per_day[readmit$readmitted == "yes"]
meds_not_readmitted <- readmit$meds_per_day[readmit$readmitted == "no"]
# calculate average meds per day in both groups
mean(meds_readmitted)
mean(meds_not_readmitted)

# Is this difference statistically significant at the α=0.05 level?
t.test(formula = meds_per_day ~ readmitted, data = readmit)

plot(meds_per_day ~ factor(readmitted), readmit)

# Please fill this out
http://tinyurl.com/hc-rfound-feedback

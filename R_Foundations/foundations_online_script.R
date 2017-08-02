# This script is available at http://tinyurl.com/catalyst-rfound

3 ^ 2
# This is where I make notes for humans

2 ^ 10
x <- 2 ^ 10
x
x * 2
x <- x * 2
x <- (1 + 3) * 3
x
# Print during assignment
(x <- (1 + 3) * 3)

# MCQ 1
price_per_truffle <- 75
number_truffles <- 5
total_value <- price_per_truffle * number_truffles
# Oh no, they're spoiling!
price_per_truffle <- price_per_truffle - (price_per_truffle * 1/3)
total_value <- price_per_truffle * number_truffles
total_value

# Data types
## Logical
FALSE
TRUE
# True true  #  aren't recognized as logical
2 == 2
2 > 2
2 <= 2
2 != 2
is_two_two <- 2 == 2
is_two_two

## Numeric
1
.0001
1e9

## Character
sentence <- "this is sentence"
sentence  # variables don't get quoted
"sentence"  # character strings do
'this works too'
"i'm a sentence too!"

x <- 3
x <- c(2, 4, 6, 8)
x

# Functions
sum(2, 4, 6, 8)
sum(x)
evens <- x
sqrt(evens)
sqrt_evens <- sqrt(evens)
sum_evens <- sum(evens)

# Vectorized comparison
odds <- c(1, 3, 5, 7)
evens > odds
evens - odds

# Recycling
evens - 1
evens + c(100, 1000)

# Warnings, errors, and messages
evens + c(100, 1000, 10000)  # Warning
evens + "a string"  # errors
message("hey there!")

# Multiple-argument functions
rep(3, 4)
rep(4, 3)
rep("cat", 10)
rep(10, "cat")

# Create sequence of numbers
1:12
letters
LETTERS

# Draw from a distribution
rnorm(10, 100, 1)
?rnorm
rnorm(5)
rnorm(n = 10, mean = 100, sd = 1)
rnorm(mean = 5, sd = 5, n = 25)

# Exercise: seq
seq(from = 3, to = 300, by = 3)
seq(1, 1e6, length.out = 10)
sum(seq(1, 1e6, length.out = 10)[c(2, 9)])

# Subsetting
evens

## Subsetting by index
evens[1]
evens[4]
evens[c(2, 3)]
letters[12]
letters[20:25]

## Subset by logical
evens[evens > 4]
odds[evens > 4]
## & = and
odds[odds > 1 & odds < 7]
## | = or
odds[odds < 3 | odds > 5]

# MCQ subsetting
set.seed(84121)  # Control randomness to ensure we all get the same result
flips <- rbinom(n = 100, size = 10, p = 0.5)  # Simulate flips






















# MCQ Solution 
flips
flips[flips >= 8]
length(flips[flips >= 8])
sum(flips >= 8)

# Missing values
NA
NULL  # Is different from missing
with_missing <- evens[c(1, 3, 5)]
sum(with_missing)
sum(with_missing, na.rm = TRUE)
is.na(with_missing)  # which entries are missing
!is.na(with_missing)  # which entries are present
with_missing[is.na(with_missing)] <- 0
with_missing

# Data frames
df <- data.frame(letters = c("a", "b", "c"), numbers = c(1, 2, 3))
df
df$numbers
numbers_from_df <- df$numbers
numbers_from_df <- numbers_from_df + 1
numbers_from_df
df
df$numbers ^ 2
df
df$square_numbers <- df$numbers ^ 2
df

# Use a real data frame
readmit <- read.csv("https://www.dropbox.com/s/2njq3fbt6v541xq/diabetes_readmit.csv?dl=1")
readmit
str(readmit)
View(readmit)
summary(readmit)

readmit$age
sort(readmit$age)
sort(readmit$age, decreasing = TRUE)
table(readmit$race)
sort(table(readmit$race))
sort(table(readmit$race), decreasing = TRUE)
table(readmit$race, readmit$gender)

# Examine age of patients in cardio
readmit$medical_specialty == "Cardiology"
readmit$age[readmit$medical_specialty == "Cardiology"]
readmit$age[which(readmit$medical_specialty == "Cardiology")]

# Final exercise
# Is the number of medications given per day in the hospital different 
# for patients who are versus are not readmitted?
str(readmit)
readmitted_patients <- readmit$readmitted != "NO"
readmit$num_medications[readmitted_patients]
readmit$num_medications[!readmitted_patients]
mean(readmit$num_medications[readmitted_patients])
mean(readmit$num_medications[!readmitted_patients])

t.test(readmit$num_medications[readmitted_patients],
       readmit$num_medications[!readmitted_patients])

library(ggplot2)
ggplot(readmit, aes(x = num_medications, fill = readmitted)) + 
  geom_density(alpha = .6)

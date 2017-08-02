In-class Exercises
========================================================
author: Health Catalyst -- Intro R
date: April 10, 2017
width: 1200
height: 800




Variable Assignment
========================================================

What does the following code print?

```
a <- 1
b <- 2
c <- a + b
b <- 4
a <- b
c <- a
c
```

a.  "a"  
b.  "3"  
c.  "c"  
d.  "4"

Function Arguments
======

Three of the following lines produce the same result. Without running the code, which one will produce a different result than the others? The help file for log (accessed via `?log`) may be helpful.

a. `log(x = 1000, base = 10)`  
b. `log10(1000)`  
c. `log(base = 10, x = 1000)`  
d. `log(10, 1000)`

Variable Assignment & Manipulation
=====

Does elephant 1 way more than elephant 2? 

Convert one’s weight to the units of the other (1 kg ≈ 2.2 lb), and store the result in an appropriately-named new variable. Write a command to get are to tell you whether it is `TRUE` or `FALSE` that elephant 1 weights more than elephant 2.

```
elephant1_kg <- 3492  
elephant2_lb <- 7757
```


Project Setup
=============
Create a new project in R Studio that will contain all your work for this class.

1. Click the "File" menu button, then "New Project"  
1. Click "New Directory"
1. Click "Empty Project"  
1. Type a descriptive directory name: This is the title of your project, so maybe "Rclass" or something similar
1. Choose a sensible place in your computer’s organizational scheme to store the new directory. If you have a "workshops" directory that would make sense. This will create a new directory: `workshops/Rclass`
1. Click "Create Project"
1. Either using your OS's file system or the "Project" tab in R Studio, create three directories within your project: data, code, and results 
1. Download this csv file into your data directory: http://tinyurl.com/catalyst-data

Changing a variable
======

Modify the following code to examine how health-risk varies over age.

```
ggplot(d, aes(x = age, y = days_to_appt)) + 
    geom_point()
```

Hint: Inspect the data by printing the top of the data frame to find the name of the variable representing health-risk. It should go on the x-axis.

**Bonus**: So far, we have only mapped variables to the x and y locations of each point. Another **aes**thetic property we can modify is the point `color`. Modify the code to color the points by whether or not the individual has a health subsidy. Do you see any patterns in the data?


Do people forget appointments?
=====

Does the number of days between the appointment and when it was scheduled (`days_to_appt`) affect no-show rates?

**Bonus**: Is the above relationship different for those who are on a medical subsidy? Can you examine all four groups (show-up and no-show, and subsidized and not) in one plot?

Which code generates this plot?
=======
left: 22%

![plot of chunk unnamed-chunk-1](exercises-figure/unnamed-chunk-1-1.png)

*** 

```
ggplot(d, aes(x = age, y = health_risk, color = subsidized)) + 
    geom_point() +
    geom_smooth(method = "lm")

ggplot(d, aes(x = age, y = health_risk)) + 
    geom_point(color = subsidized) +
    geom_smooth(method = "lm")

ggplot(d, aes(x = age, y = health_risk)) + 
    geom_point() +
    geom_smooth(method = "lm", color = subsidized)

ggplot(d, aes(x = age, y = health_risk)) + 
    geom_point(aes(color = subsidized)) +
    geom_smooth(method = "lm")

```



Final challenge
======

Are there differences in 
Examine how the relationship between health-risk and age differs across genders and subsidies. Save the plot to your `results` directory. 

There are several ways to do this. Start without reading the recipe below. If you get stuck here are some steps to help:

1. Create a scatter plot of health-risk vs age
1. Color the points by gender
1. Facet the plot by subsidized
1. Add a best-fit line with `geom_smooth(method = "lm")`

**Bonus:** Does it look like health-risk and age are linearly related? Can you figure out how to add another line to your plot to transform the data to better represent their relationship. Feel free to use Google, help-files, etc.

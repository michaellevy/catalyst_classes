Data manipulation with dplyr
========================================================
author: Michael Levy
date: June 28, 2017
width: 1200
height: 800




Project Setup
=============
Create a new project in RStudio that will contain your work for this class.

1. Click the "File" menu button, then "New Project"  
1. Click "New Directory"
1. Click "Empty Project"  
1. Type a descriptive directory name: This is the title of your project, so maybe "dplyr_class" or something similar
1. Choose a sensible place in your file tree for the new directory. 
1. Click "Create Project"
1. Either using your OS's file system or the "Project" tab in R Studio, create three directories within your project: data, code, and results 

Data Import & Help Files
============
R helpfiles can be hard to understand at first (like all technical documentation), but they are critical, and their consistent format makes them easier to use with experience. We will import another dataset to get practice using them.

- Download the gapminder dataset and save it to your data directory
- Starting with the helpfile for read_csv, figure out how to import it to a usable data frame.

*Bonus*: What was the highest per capita income in the dataset?

*Double-Bonus*: Which country had the highest overall (not per capita) GDP in any year in the dataset?

*Triple-Bonus*: Which country has had the most income over all the years in the dataset?

5 Verbs of dplyr
============

- `filter`: Choose rows (WHERE & HAVING)
- `arrange`: Sort rows (ORDER BY)
- `select`: Choose columns (SELECT)
- `mutate`: Create columns (SELECT)
- `group_by` %>% `summarize`: Aggregate & Create columns (GROUP BY)


Filter
==========

How many records have a gender that is not Male or Female?

a. 0  
b. 2  
c. 19,574  
d. 40,648  

Mutate
=========

1. Create a new variable that is the percent of one's life occupied by the visit.
1. Print a table that shows only the admit-type, length of stay, and percent of life occupied by the visit for the five greatest values of percent of life.

*Bonus*: Make a plot of percent of life vs. admit age.

*Double-bonus*: Color the points in the plot by admit type and fit a linear regression line to each group.

Putting it all together
=============

What are the mean and median lengths of stay for emergency visits for the various genders in various maritial statuses?

*Bonus*: Plot the distribution of length-of-stay in each gender $\times$ maritial-status category.

Data Checking
=============

Are there any duplicated UniqueIDs in the dataset? What are they?

*Bonus*: Does it look like the entire records are duplicated, or did the same IDs get assigned to separate records? Hint: Filter the dataset to only the rows with duplicate IDs and print to the screen. 

*Double-Bonus*: Do the above filtering without "hardcoding" the duplicate IDs; that is, accessing them programmatically rather than typing or pasting them into your code.


Telling a data story with R Markdown
========================================================
author: michael.levy@healthcatalyst.com
date: July 26, 2017
autosize: true

First R Notebook
=================

1. In your OS' explorer, create a new directory on your machine for today's training
1. In RStudio, create a new R Notebook file: File -> New File -> R Notebook and save the file in the new directory
1. Press cmd/ctrl-shift-k to compile the document as-is and make sure everything is working
1. Add an `author:` field to the YAML header and add your name
1. The cars dataset that gets plotted by default is beyond boring. Let's explore the slightly more interesting built-in dataset, `mtcars`
    - Delete all of the template except the YAML header
    - Explore the `mtcars` data frame and see if you can find anything interesting. 
        - You could calculate summary statistics using `dplyr`'s `group_by %>% summarize` syntax
        - And/or you could use `ggplot2` to make some plots
1. Find one or more interesting relationships in the data and write a very brief report about it using markdown syntax such as "#" for headers, "-" bullet-point lists, etc.

Report on thallium's usefulness
=================

A provider is questioning whether expensive thallium tests are useful as a marker of coronary artery narrowing. Construct a report that addresses the thallium’s usefulness.

1. Make a copy of template_notebook.Rmd and rename it thallium_report.Rmd.
1. Ensure that you have the csv file and know its location relative to the .Rmd file.
1. Working interactively within the .Rmd file, read the .csv file into R and explore. 
    - Note that thallium is coded as an integer. Recode it according to the following rules. You could do this with `mutate` and nested `ifelse` statements, or you could create a data frame and use a join operation (e.g. `left_join`).
        - 3 = normal
        - 6 = fixed defect
        - 7 = reversible defect
1. Explore the question of thallium’s usefulness for assessing vessel narrowing. Consider using summary statistics, visualizations, and/or statistical models. Organize the document with headers and text that explains what you did and what you found.
1. **BONUS**: Google "ggplotly" and make an interactive plot that addresses this question.

# Did you start Rstudio from your project file?
# that will AUTOMATICALLY make your 'working directory'
# correct if you have set your project up carefully.

# You have to understand where your files are!

# our main (set of) libraries for the workshop:
library(tidyverse)

# you should already have the .csv file in your project
# green / red sticky
gapminder <- read.csv("data/gapminder_data.csv", 
                      stringsAsFactors = TRUE)

# sneak peak at the data
str(gapminder)

# call by rows and columns
gapminder[3,]

gapminder[,2]

gapminder[3,2]

# can include vectors in the call
gapminder[c(5:15),c(1,3,5)]

# we can see the columns of our dataframes
colnames(gapminder)

gapminder[c(5:15),c(1,3,5)]

# fooling around with gapminds
library(tidyverse)

gapminder <- read.csv("data/gapminder_data.csv", 
                           stringsAsFactors = TRUE)

str(gapminder)

unique(gapminder$country)
unique(gapminder$year)

range(gapminder$lifeExp)

#yikes, look at the lowest life exp. 23!

lowest_life <- min(gapminder$lifeExp)
lowest_life

# how can I get the whole row?
gapminder[(gapminder$lifeExp == lowest_life) ,]

# get all the Rwandas

# not useful for everything.
summary(gapminder)

# episode 4 explorations
# a: which columns are factors?
# b: what are the values?
str(gapminder)

# a: only 1
# b: there's 142 of them

# ep 5 add on
# add country GDP as a column with cbind

countryGDP <- gapminder$pop * gapminder$gdpPercap
# ground truth it. They seem reasonable
range(countryGDP)

gapminder <- cbind(gapminder, countryGDP)
str(gapminder)

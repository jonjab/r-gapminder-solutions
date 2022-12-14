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

# how can I get the whole row?
lowest_life_record <- gapminder[gapminder$lifeExp == lowest_life,]
lowest_life_record



summary(gapminder)


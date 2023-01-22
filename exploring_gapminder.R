# fooling around with gapminder
# can be used in episode 2 as a gapminder orientation

# our main (set of) libraries for the workshop:
library(tidyverse)

# the csv came along with the project repo for our convenience
gapminder <- read.csv("data/gapminder_data.csv", 
                      stringsAsFactors = TRUE)

# sneak peak at the data
str(gapminder)

# some quick summary stats for each column
# not useful for everything
summary(gapminder)


unique(gapminder$country)
unique(gapminder$year)
unique(gapminder$continent)

# min and max values
range(gapminder$lifeExp)

# yikes, look at the lowest life exp. 23!
# let's save that number as a variable
lowest_life <- min(gapminder$lifeExp)
lowest_life

# get the whole row where life expectancy is lowest
gapminder[(gapminder$lifeExp == lowest_life) ,]

# We see all the Rwandas. 
# display all the Rwanda rows
gapminder[(gapminder$country == "Rwanda") ,]


# add country GDP by multiplying two columns
# together and binding the result
# as a column with cbind

countryGDP <- gapminder$pop * gapminder$gdpPercap
# ground truth it. They seem reasonable
hi_low_gdp <- range(countryGDP)

# display that without the ^e
format(hi_low_gdp, scientific = FALSE)

# here's that cbind
gapminder <- cbind(gapminder, countryGDP)
str(gapminder)

# we can summarize and slice and dice our data 

Amer_LifeExp_Current <- gapminder %>% 
    select(continent, country, year, lifeExp) %>% 
  filter(continent == "Americas", year == 2007) %>% 
  select(country, lifeExp)
  
# does this pass the smell test?  
# are there surprises?
Amer_LifeExp_Current[order(Amer_LifeExp_Current$lifeExp),]

# GRAPHS!!!!
# examples mostly from 8: ggplot.  
# basic scatterplot
# this is just the grid
# needs a geom
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp))

ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_point()


# layers
# geoms get added one by one,
# from the bottom up
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line()

ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line() + 
  geom_point()

# points on top of the lines stressed
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country)) +
       geom_line(mapping = aes(color=continent)) + 
       geom_point()

# points on bottom
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_point() + 
  geom_line(mapping = aes(color=continent))


# transformations and stats
# you can do math without saving it

# this looks like a log
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# let's try to straighten it
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()

# add a line
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm")

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm", size=1.5)


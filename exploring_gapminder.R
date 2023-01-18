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




# ep 5 add on
# add country GDP as a column with cbind

countryGDP <- gapminder$pop * gapminder$gdpPercap
# ground truth it. They seem reasonable
range(countryGDP)

gapminder <- cbind(gapminder, countryGDP)
str(gapminder)


# ep 8: ggplot.  GRAPHS!!!!
# made on my jupyterhub

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

# this winds up weird
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, color=continent)) +
  geom_line()

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
  geom_line(mapping = aes(color=continent)) + geom_point()


# do the tip here?

# challenge 3
# switch the order
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_point() + 
  geom_line(mapping = aes(color=continent))


# transformations and stats
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# ^^ that looks like a log. let's try to straighten it
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()

# add a line
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm")

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm", size=1.5)


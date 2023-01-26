# ep 8 
# made on my jupyterhub

library(tidyverse)

gapminder <- read.csv("data/gapminder_data.csv", stringsAsFactors = TRUE)


library("ggplot2")
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# this is just the grid
# needs a geom
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))


ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()


# challenge 1
# map year vs. life expectancy
ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp)) + geom_point()

# challenge 2
# same s and y of challenge 1, plus color by continent
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_point()


# layers

# this winds up weird
# continent doesn't make sense here.
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, color=continent)) +
  geom_line()

# by = takes care of that
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line()

# the weird one, R was guessing
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=continent, color=continent)) +
  geom_line()

# 2 geoms is totally allowed!
# both geoms get the color from continent
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line() + 
  geom_point()

# the points really are on on top
# this one stresses that
# moving color to the geom_ lets you assign them seperately
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_line(mapping = aes(color=continent)) + 
  geom_point(mapping = aes(color="blue"))


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

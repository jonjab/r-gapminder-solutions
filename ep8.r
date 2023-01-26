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
# here, both geoms get their color from 
# the global aes()
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line() + 
  geom_point()

# the points really are on on top
# this one stresses that
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country, color=continent)) +
  geom_line() + 
  geom_point(color="black")


# this doesn't work
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country), color=continent) +
  geom_line() + 
  geom_point(mapping = aes(color="blue"))


# moving color to the geom_ lets you assign them seperately
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_line(mapping = aes(color=continent)) + 
  geom_point(mapping = aes(color="blue"))

# you can also have a local mapping and aes like this:
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_line(mapping=aes(color=continent)) + 
  geom_point(color="blue")

# but you CAN'T do this:
ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_line(color=continent) + 
  geom_point(color="blue")


# challenge 3
# switch the order
ggplot(data = gapminder, mapping = aes(x=year, y=lifeExp, by=country)) +
  geom_point() + 
  geom_line(mapping = aes(color=continent))



# ########################
# transformations and stats
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# ^^ that looks like a log. let's try to straighten it
# AND we will make those points transparent, since they are so stacked up
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()

# add a trendline
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm")

# pop quiz:
# what are some other geom_smooth methods?

# I also can control the confidence interval around the geom_smooth
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm", level=.75)

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm", level=.99)

# let's pause and see what this graph is saying
# an extra 10 years of life expectancy costs 10X as much gdp / person!

# remember, this is multiple years
# the trend is for all of these to go up
ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm", level=.99)

ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm", level=.99)



# and yes we can change the size of the trend line
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm", size=1.5)


# ##############################
# Challenge 4

# Modify the color and size of the points on the point layer in the previous example.

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5, size = 4) + scale_x_log10() + geom_smooth(method="lm", size=1.5)

# NOTE: the units. If you make the graph bigger, the points max out.
# that's because those are `points'
# so it's connected to some arbitrarily sized piece of paper.


# Challend 4b
# Modify your solution to Challenge 4a 
# so that the points are now a different shape and are 
# colored by continent with new trendlines. 
# 
# Hint: The color argument can be used inside the aesthetic.

# start with the shape
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10() + 
  geom_point(alpha = 0.5, size = 4, shape = 18) + 
  geom_smooth(method="lm", size=1.5)

# color the continent
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color=continent)) +
  scale_x_log10() + 
  geom_point(alpha = 0.5, size = 4, shape = 18) + 
  geom_smooth(method="lm", size=1.5)


# Multi-panel figures

# let's just do Americas
americas <- gapminder[gapminder$continent == "Americas",]


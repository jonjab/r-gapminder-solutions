# ep 7 solutions: dplyr
# and more working with dataframes

# load your gapminder
gapminder <- read.csv("data/gapminder_data.csv", stringsAsFactors = TRUE)


unique(gapminder$continent)
mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])
mean(gapminder[gapminder$continent == "Americas", "gdpPercap"])

# you shouldn't have to repeat yourself
library(dplyr) 

# there are 5 'verbs' to use in dplyr
# select, filter, group_by, summarize, and mutate

# make a skinnier dataframe with SELECT
# dataframe, column, column, ...
year_country_gdp <- select(gapminder, year, country, gdpPercap)
year_country_gdp
dim(year_country_gdp)

# if you want to eliminate 1 column, use minue on that column
smaller_gapminder <- select(gapminder, -continent)
str(smaller_gapminder)

# We want to use this pipes syntax:
# We can use multiple v
year_country_gdp <- gapminder %>% select(year, country, gdpPercap)
str(year_country_gdp)

# we can rename columns on the fly with assignment operator = 
# newname = oldname

tidy_gdp <- year_country_gdp %>% rename(gdp_per_capita = gdpPercap)
str(tidy_gdp)

# We can use multiple dplyr verbs sequentialy with pipes
# let's try FILTER
year_country_gdp_euro <- gapminder %>% 
  filter(continent == "Europe") %>% 
  select(year, country, gdpPercap)

str(year_country_gdp_euro)

# now it's easy to get specific values out
# filter() is a boolean AND
europe_lifeExp_2007 <- gapminder %>% 
  filter(continent == "Europe", year == 2007) %>% 
  select(country, lifeExp)

# now I have a list of European life expectencies
europe_lifeExp_2007

# challenge 1
# write ONE command to get a dataframe
# with African
# lifeExp, country, and year.
# how many rows do you get out?

challenge1 <- gapminder %>% 
  filter(continent == "Africa") %>% 
  select(lifeExp, country, year) 

dim(challenge1)

# advanced: can you get the answer in one step?
# to auto-output your results, put the entire statement
# in parentheses
(challenge1 <- gapminder %>% 
  filter(continent == "Africa") %>% 
  select(lifeExp, country, year) %>% 
  dim())


# group by
# so we can see series

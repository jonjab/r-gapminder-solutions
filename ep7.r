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

# if you want to eliminate 1 column, use minus(-) on that column
smaller_gapminder <- select(gapminder, -continent)
str(smaller_gapminder)

# Pipes syntax 
# We start by sending our data down the pipe
# no need for verb(x, ) when you use the pipe:
year_country_gdp <- gapminder %>% 
  select(year, country, gdpPercap)

str(year_country_gdp)

# we can rename columns on the fly with assignment operator = 
# newname = oldname

tidy_gdp <- year_country_gdp %>% 
  rename(gdp_per_capita = gdpPercap)

str(tidy_gdp)


# We can use multiple dplyr verbs sequentially with pipes
# let's try FILTER then SELECT
year_country_gdp_euro <- gapminder %>% 
  filter(continent == "Europe") %>% 
  select(year, country, gdpPercap)

str(year_country_gdp_euro)


# filter() is a boolean AND
europe_lifeExp_2007 <- gapminder %>% 
  filter(continent == "Europe", year == 2007) %>% 
  select(country, lifeExp)

# now I have a list of European life expectancies
# from 2007

europe_lifeExp_2007

# challenge 1
# write ONE command to get a dataframe
# with African lifeExp, country, and year.
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
# reduces need for repetition and the errors that come with it
# so we can see series, essentially use every unique criteria that could have 
# been used in filter 

str(gapminder)

#with group_by()
str(gapminder %>% group_by(continent))


#using Summarize
#summarize will create a new variable by using functions that repreat for each
#continent specific datafram 

gdp_bycontinent <- gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap = mean(gdpPercap))

gdp_bycontinent

#Now you try!
# Challenge 2
# calculate the average life expectancy per country
# which one has the highest? lowest? 

lifeExp_bycountry<- gapminder %>% 
  group_by(country) %>% 
  summarize(mean_lifeExp = mean(lifeExp))

lifeExp_bycountry %>% 
  filter(mean_lifeExp == min(mean_lifeExp) | mean_lifeExp == max(mean_lifeExp))

# grouping by multiples 
gdp_bycontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))


# Using count() and n()
gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)

# the n() will return the total number of observations in the 
# current group rather than counting the number of observations
gapminder %>%
  group_by(continent) %>%
  summarize(se_le = sd(lifeExp)/sqrt(n()))

#U Mutate
# using mutate will create new variables 

gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion = gdpPercap*pop/10^9) %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))


# Challenge
# from end of ep 9
# Calculate the average life expectancy in 2002 
# of 2 randomly selected countries for each continent. 
# Then arrange the continent names in reverse order. 
# HINT: use these funtions:
#    arrange() 
#    sample_n()
#    filter()
#    group_by()
#    arrange 


lifeExp_2countries_bycontinents <- gapminder %>%
  filter(year==2002) %>%
  group_by(continent) %>%
  sample_n(2) %>%
  summarize(mean_lifeExp=mean(lifeExp)) %>%
  arrange(desc(mean_lifeExp))





# SKIP
# Using if else logical conditions 
# combining mutate with ifelse() facilitates filtering 

# keeps all the data but filters after a certain condition
# calc the gdp only for people with a life exp above 25
gdp_pop_bycontinents_byyear_above25 <- gapminder %>%
  mutate(gdp_billion = ifelse(lifeExp > 25, gdpPercap * pop / 10^9, NA)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))

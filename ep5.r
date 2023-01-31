# day 2: ep. 5

gapminder <- read.csv("data/gapminder_data.csv", stringsAsFactors = TRUE)

str(gapminder)  # this command outputs a little summary

cats <- read.csv("output_data/feline-data.csv", 
                 stringsAsFactors = TRUE)

# add a column to our cats data
age <- c(2,3,5)
cbind(cats, age)
str(cats)
# age <- c(2,3,5,12)

age
cats <- cbind(cats, age)
cats
str(cats)

cats <- cats[,c(1:4)]

# similarly rbind()

str(cats)
levels(cats$coat)
cats$coat

cats <- rbind(cats, list("toroiseshell", 3.3, TRUE, 9))
cats

str(gapminder)
typeof(gapminder$country)
gapminder$country

head(gapminder, n=15)
tail(gapminder$country)

sample()

# ###########################
# Challenge 3
# If this outputs a random 5 rows
# how can I get the middle 5 rows




tail(gapminder)

# exact middle


gm_middle_rows <- nrow(gapminder)/2
gapminder[gm_middle_rows:(gm_middle_rows+5),]

# also: there's sample()
gapminder[sample(nrow(gapminder), 5),]

sample(nrow(gapminder), 5)


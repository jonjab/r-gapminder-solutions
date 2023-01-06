# ep 16: dplyr
# and more working with dataframes

unique(gapminder$continent)
mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])
mean(gapminder[gapminder$continent == "Americas", "gdpPercap"])

# you shouldn't have to repeat yourself
library(dplyr)

year_country_gdp <- select(gapminder, year, country, gdpPercap)
year_country_gdp
dim(year_country_gdp)

#Dataframes 
gapminder <- read.csv("data/gapminder_data.csv", stringsAsFactors = TRUE)
head(gapminder[3])

#to extract a single column use [[]]
head(gapminder[["lifeExp"]])

# $rule applies here too
head(gapminder$year)

# with two arguments [] works the same way for matrices
gapminder[1:3,]

#Challenge 7
# 1. Extract observations collected for year 1957 
# 2. Extract all columns except 1-4 
# 3. Extact rows where life expectancy is longer than 80 years
# 4. Extract the first row, and 4 and 5th columns 
# Extra: how to extract rows that contain info for 2002 AND 2007?

#skip challenge 8

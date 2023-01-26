# Episode 6
# Subsetting Data

me from?
x <- c(5.3, 6.2, 7.1, 4.8, 7.5)
names(x) <- c(letters[1:5])

x

# 3 ways to pull out values
# like letters above
# [] brackets act like a function meaning "get the nth element"
x[1]
x[4]

# we can get multiples
#, is like an and 
x[c(1, 3)]

#: operator creates a sequence of numbers from the left to the right
x[1:4]

1:4

# arbitrarily bring them out over and over
x[c(1,3,4,2,2,1)]

# place zero is empty
# beyond the end is NA
x[0] #not counting from 0
x[10] #there is no 10th item

# to exclude an item from an index 
x[-2]
# this will return everything but the 2nd element

#or in multiples
x[c(-1,-5)]
x[-c(1,5)]

# challenge 1
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

# what are two wayts to get out b, c, and d?
x[c(b,c,d)]
x[2:4]
x[letters[2:4]]

# because
letters[2:4]

# from the lesson:
x[-c(1,5)]

# lines 35-36: we took 2 steps
# we can name on the fly

# 10 minutes

#Subsetting by name 
x <- c(a=5.4, b=6.2, c=7.1, d=4.8, e=7.5) 
x[c("a", "c")]


# subset with ==
# and call by name
x[names(x) == "a"]

# & --logical and
# | --logical or
# Use > < == to evaluate logical vectors
# both return a logical (True or False)
# ! is the logical NOT operator 

# challenge 2
# same vector if you haven't changed it:
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

x[x > 4 & x < 7]

# more readable
x[(x > 4) & (x < 7)]

x_example <- x[(x > 4) & (x < 7)]
x_example

#multiple elements can have the same name:
x <- 1:3
names(x) <- c('a','a','a')
x

#Skipping names elements
x <- c(a=5.4, b=6.2, c=7.1, d=4.8, e=7.5)
# you might try: 
x[-"a"]

# the correct way to use logicals in this situation is: 
x[names(x) != "a"]

#try dropping multiple elements 
x[names(x) !=c("a","c")]


names(x) !=c("a","c")

#Using %in%
# If you want to match each element of the left argument with all of the elements of the right argument


# challenge 3 - skip if low on time
# Use gapminder dataset
# pull out information from gapminder to add to the seAsia vector we just made. 
#pull out information from southeast Asia: how do we set up an operation to produce a logical vector that is TRUE for all of the countries in southeast Asia and FALSE otherwise?
seAsia <- c("Myanmar","Thailand","Cambodia","Vietnam","Laos")
seAsia
## read in the gapminder data that we downloaded in episode 2
gapminder <- read.csv("data/gapminder_data.csv", header=TRUE)
## extract the `country` column from a data frame (we'll see this later);
## convert from a factor to a character;
## and get just the non-repeated elements
countries <- unique(as.character(gapminder$country))
countries

#the clunky answer
(countries=="Myanmar" | countries=="Thailand" |
    countries=="Cambodia" | countries == "Vietnam" | countries=="Laos")

#cleaner answer: 
countries %in% seAsia

#Handling special values: missing, infinite, undefined

#is.na everything containing NA or NaN
#is.nan and is.infinite will do the sam for NaN and Inf
#is.finite will return everything that does not contain NA, NaN, or Inf
#na.omit will filter out missing values 


#Factor subsetting
# works the same way as vector subsetting
f <- factor(c("a", "a", "b", "c", "c", "d"))
f[f == "a"]

#List Subsetting
#can't extract more than one element at once 
xlist <- list(a = "Software Carpentry", b = 1:10, data = head(mtcars))
xlist[1]

#handy: use the $ sing to extract elements by name
xlist$data

#challenge 5 is eh
#skip challenge 6


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



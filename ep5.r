# ep 5

# re-read our cats csv into a dataframe if necessary:
cats <- read.csv(file = "output_data/feline-data.csv", stringsAsFactors = TRUE)


# Adding a column

# first make a vector for the column:
age <- c(2,3,5)
# then 'bind' that as a new column
cats <- cbind(cats, age)
str(cats)

# it won't work if we give it an incorrect number of values
wrong_age <- c(2,3,4,7)
cbind(cats, wrong_age)


# a new row: rbind
# give it a LIST
newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)

# it gets an NA because coat is a FACTOR
cats
# what are valid values?
levels(cats$coat)

# before we add a new value, we need to add it as a valid option
levels(cats$coat) <- c(levels(cats$coat), "tortoiseshell")
levels(cats$coat)

# so now we can add our new row, as on line 21
cats <- rbind(cats, newRow)
cats


# demo only
# we can change it to a character vector
# and lose the ability to do some data
# quality enforcement. Opens the doors to typos
str(cats)
cats$coat <- as.character((cats$coat))
str(cats)

# challenge 1
# Let’s imagine that 1 cat year is equivalent to 7 human years.

# 1. Create a vector called human_age by multiplying cats$age by 7.
# 2. Convert human_age to a factor.
# 3. Convert human_age back to a numeric vector using 
#    the as.numeric() function. Now divide it by 7 to 
#    get the original ages back. Explain what happened.

human_age <- cats$age * 7
human_age <- as.factor(human_age)
human_age
human_age <- as.numeric(human_age) / 7
human_age

# 1/7, 2/7, 3/7, 4/7, 4/7 

# removing rows
# let's clean up cats
# by removing that row
cats

cats[-4,]

# or all rows with NA's. Same result.
na.omit(cats)

# don't forget to re-assign.
cats <- na.omit(cats)

# we can remove columns similarly
cats
str(cats)

cats[,-4]

# appending to dataframes
# columns are vectors (all same type)
# rows are lists (mixed types, which we skipped)

# you can add 2 dataframes together
cats <- rbind(cats, cats)

# alt challenge: can you 
# use cbind to add 2 dataframes together?
cats <- cbind(cats, cats)
# indeed you can.
cats

# skip challenge 2?


##########
# GapMinder: under 'Realistic example'
gapminder <- read.csv("data/gapminder_data.csv", stringsAsFactors = TRUE)

# first thing to do is re-inforce factors.
# country and continent are the factors here.
str(gapminder)

# don't worry about the alternatives for reading in files.

# quick summary statistics on each column
# for the factors, it shows a count of each
# value
summary(gapminder)

str(gapminder$country)

# weird eh?
# factors are stored as integers
typeof(gapminder$country)
# but display as text.
gapminder$country

# measure the size of it
nrow(gapminder)
ncol(gapminder)
dim(gapminder)
colnames(gapminder)


# Challenge 3
# middle and end of your data

# challenge 4
# write a new script that downloads
# gapminder from the internet
# and creates a dataframe.
# call it challenge4.r
# and save it to the root of your project folder.
# Clean your environment and run your script

# hint: the lesson script shows you how.
# we skipped it.


# challenge 5 is good if we are going into a break.







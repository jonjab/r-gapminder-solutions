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

# lets clean up cats
cats

cats[-4,]

# or all rows with NA's. Same result.
na.omit(cats)

# don't forget to re-assing
cats <- na.omit(cats)

# we can remove coluns similarly






##########
# GapMinder: under 'Realistic example'

# first thing to do is re-inforce factors.



####################
# Where's this come from?
x <- c(5.3, 6.2, 7.1, 4.8, 7.5)
names(x) <- c(letters[1:5])

x

# 3 ways to pull out values
# like letters above
x[1]
x[4]

# we can get multiples
x[c(1, 3)]

x[1:4]

1:4

# arbitrarily bring them out over and over
x[c(1,3,4,2,2,1)]

# place zero is empty
# beyond the end is NA
x[0]
x[10]

# exclude
x[-2]


# challenge 1
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

# get out b, c, and d
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

# subset with ==
# and call by name
x[names(x) == "a"]

# & --logical and
# | --logical or
# both return a logical (True or False)

# challenge 2
# same vector if you haven't changed it:
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

x[x > 4 & x < 7]

# more readable
x[(x > 4) & (x < 7)]

x_LT_example <- x[(x > 4) & (x < 7)]
x_LT_example

# I think challenge 3 goes here






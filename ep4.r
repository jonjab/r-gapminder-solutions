# episode 4

# toy dataset saved to output directory

# create an example dataset: a table of information about cats 
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))

# demonstrate write.csv to write a dataframe to a csv file
write.csv(x = cats, file = "output_data/feline-data.csv", row.names = FALSE)

# demonstrate read.csv to read a csv file and create a dataframe
cats <- read.csv(file="output_data/feline-data.csv", stringsAsFactors = TRUE)

# we  cab access columns in the data frame by the variable name
cats$weight
cats$coat

# we can perform operations on all values in the column.
# This returns a new list of values, each weight + 2
cats$weight + 2

# what about this? It prints a warning message: "‘+’ not meaningful for factors"
# cats$weight + cats$coat

# demonstrate typeof to find a variable's type
# cats$weight has "double" values (a numeric value that can be of fractional value)
typeof(cats$weight)
typeof(cats$coat)

# lets read this file
cats2 <- read.csv(file="data/feline-data_v2.csv")

# this won't work -- why? R wasn't able to read every "weight" value as a "double"
# as before because the final row isn't formatted as a number. As a result, all 
# values are convertedcharacters. Columns in a dataframe all have to have the 
# same type: 
# cats2$weight + 2

# the weights columns 
typeof(cats2$weight)


#
# Vectors&  Type Coercion
#

# A vector is an ordered list of things with the same type. 

# create an empty vector: if we don't specify a type, the default is "logical"
my_vector <- vector(length = 3)
# my_vector: FALSE, FALSE, FALSE

# we can specify a type for the vector items this way
another_vector <- vector(mode='character', length=3)
# another vector: "", "", ""

# demonstrate str to print "structure" of the variable
# we can use this to tell something is a vector
str(another_vector)

# Discussion question
# In R, each column of a tabular dataset is typically represented as a Vector and
# all values in the column must be the same type. This may sounds constraining, 
# but there are some good reasons to enforce this pattern. Why do you think R is 
# design this way? By keeping everything in a column the same, we allow ourselves
# to make simple assumptions about our data; if you can interpret one entry in 
# the column as a number, then you can interpret all of them as numbers, so we 
# don’t have to check every time. This consistency is what people mean when they
# talk about clean data; in the long run, strict consistency goes a long way to
# making our lives easier in R.


# you can also create vectors with the c() function
combine_vector <- c(2,6,3)

# What about these examples
quiz_vector <- c(2,6,'3')
coercion_vector <- c('a', TRUE)
another_coercion_vector <- c(0, TRUE)

# in these example the arguments to c(), look like different types, however the
# the resulting vector still has the same type. This is called type coercion: if
# you use variable with different types in a context that requires a variables of
# the same type (such as in a vector), R will "coerce" the values into the same 
# type. The rules are:
# logical -> integer -> numeric -> complex -> character, 
# where -> can be read as are transformed into.

# lets convert cats$like_string to logical
cats$likes_string <- as.logical(cats$likes_string)

#
# exploring vectors more
# the follow is needed for challenge #1
#

# create a vector with a sequence of numbers
sequence_example <- seq(10) # or 1:10

# demonstrate head/tail/length functions
head(sequence_example, n=2)
tail(sequence_example, n=4)
length(sequence_example)

# naming elements of a vector
my_example <- 5:8
names(my_example) <- c("a", "b", "c", "d")

# Challenge 1: Start by making a vector with the numbers 1 through 26. Multiply 
# the vector by 2, and give the resulting vector names A through Z (hint: there
# is a built in vector called LETTERS)

letters <- 1:26 * 2
names(letters) <- LETTERS
letters

#
# Data Frame
#

# the columns of data frames are vectors
str(cats$weight)

# demonstrate names() to rename dataframe columns
names(cats)[2] <- "weight_kg"
names

#
# Factors
# factors are categorical variables, examples: state you live in, your major.

# to create a factor, you often start with a vector of terms (i.e., categories)
coats <- c('tabby', 'tortoiseshell', 'tortoiseshell', 'black', 'tabby')

# at this point these are just regular "chr" values
str(coats)

# demonstrate factor() to create factor from a vector
CATegories <- factor(coats)
str(CATegories)


# Challenge Is there a factor in our cats data.frame? what is its name? Try using
# ?read.csv to figure out how to keep text columns as character vectors instead
# of factors; then write a command or two to show that the factor in cats is
# actually a character vector when loaded in this way.

cats <- read.csv("output_data/feline-data.csv")
str(cats$coat)


#
# Lists
#


# unlike vectors, lists can include values with mixed types.
list_example <- list(1, "a", TRUE, 1+4i)

# rows from dataframes are lists
row <- cats[1,]
typeof(row)

# Challenge
# There are several subtly different ways to call variables, observations and 
# elements from data.frames:
# cats[1]
# cats[[1]]
# cats$coat
# cats["coat"]
# cats[1, 1]
# cats[, 1]
# cats[1, ]
#Try out these examples and explain what is returned by each one. #Hint: Use the 
# function typeof() to examine what is returned in each case.


# Challenge
# Create a list of length two containing a character vector for each of the 
# sections in this part of the workshop: Data types, Data structures, Populate 
# each character vector with the names of the data types and data structures 
# we’ve seen so far.

dataTypes <- c('double', 'complex', 'integer', 'character', 'logical')
dataStructures <- c('data.frame', 'vector', 'factor', 'list', 'matrix')
answer <- list(dataTypes, dataStructures)


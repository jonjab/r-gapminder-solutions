# ep 4

cats <- data.frame (coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1,0,1))

cats
str(cats$coat)

# let's save that so we don't need to type that in ever again.
write.csv(x= cats, file = "output_data/feline-data.csv", row.names = FALSE)

# reading it in, we force a factor
cats <- read.csv(file = "output_data/feline-data.csv", stringsAsFactors = TRUE)
cats

# note that string field is now a `Factor`
str(cats$coat)
cats$coat

# operate on columns
#math
cats$weight + 2

#output
paste("My cat is ", cats$coat)

# a nice error
cats$weight + cats$coat

# btw: quick challenge. 
# What are the values of weight?
cats

# they are still the same.

# you need to re-assign if you want that change to stay:
cats$weight <- cats$weight + 2

# data types
typeof(cats$weight)
typeof(cats)

typeof(42)
typeof(1+1i)
typeof(TRUE)


# next version of cats
# this is a great place for type-ahead if we haven't covered it.
cats <- read.csv(file="data/feline-data_v2.csv", stringsAsFactors = TRUE)
typeof(cats$weight)

# why is it an integer now instead of a double? Because that's what a factor really is.
# class() can be more informative than typeof()
class(cats)

str(cats$weight)
typeof(cats$weight)


# vectors: we've already used them
test <- c("one", "two", "three")
str(test)

# from the lesson
combine_vector <- c(2,6,3)
combine_vector

# columns need to be of the same type because each is a vector
quiz_vector <- c(2,6,"3")
quiz_vector

# this is coercion

# you can force a type
quiz_vector <- as.numeric(quiz_vector)
quiz_vector
str(quiz_vector)

# now that we know types, let's make
# cats better
cats$likes_string
cats$likes_string <- as.logical(cats$likes_string)

# you can also add on to a vector
# use c() as before
ab_vector <- c("a", "b")
combine <- c(ab_vector, "defg")
combine

# you can make a longer vector automatically
# one way
mySeries <- 1:10
mySeries

# another
seq(10)
# more verbose
seq(1,10,by=0.1)

sequence_example <- seq(10)
head(sequence_example, n=2)
tail(sequence_example, n=4)

# Data Frames & Factors


# Challenge 1
# hint: LETTERS is built in.

# ep 5

# friday silent run: 2:15

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

### dataframes

# interrogating gapminder down hear the bottom
gapminder <- read.csv("data/gapminder_data.csv", header=TRUE)
length(gapminder)
nrow(gapminder)

# get both at once
dim(gapminder)

colnames(gapminder)

head(gapminder$year)




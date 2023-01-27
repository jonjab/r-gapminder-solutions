# ep. 5 dress rehearsal
cats <- read.csv("output_data/feline-data.csv", stringsAsFactors = TRUE)

age <- c(2,3,5)
cats
cbind(cats, age)
str(cats)

age <- c(2,3,5)
age
cbind(cats,age)
nrow(cats)
length(age)

age <- c(2,3,5)
cats <- cbind(cats,age)
str(cats)

newRow <- list("tortoiseshell", 3.3, TRUE, 9)
str(newRow)
cats <- rbind(cats, newRow)
cats
str(cats)

levels(cats$coat)
levels(cats$coat) <- c(levels(cats$coat), "tortoiseshell")

cats <- rbind(cats, newRow)
cats

# challenge
# Let’s imagine that 1 cat year is equivalent to 7 human years.

# 1. Create a vector called human_age by multiplying cats$age by 7.
# 2. Convert human_age to a factor.
# 3. Convert human_age back to a numeric vector using 
#    the as.numeric() function. Now divide it by 7 to 
#    get the original ages back. Explain what happened.

cats$age
human_age <- cats$age * 7

human_age
human_age <- as.factor(human_age)
(human_age)
human_age <- as.numeric(human_age/7) 
human_age


cats
cats <- cats[-4,]
cats
cats <- na.omit(cats)
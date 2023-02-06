# ep 9 solutions

library(tidyverse)

gapminder <- read.csv("data/gapminder_data.csv", stringsAsFactors = TRUE)

# Filter countries located in the Americas
americas <- gapminder[gapminder$continent == "Americas", ]

# Make the plot
# this time I'll tilt the text
ggplot(data = americas, mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))


# Do both steps in one line with pipes
# you don't wind up with a big object in memory
gapminder %>%
  # Filter countries located in the Americas
  filter(continent == "Americas") %>%
  # Make the plot
  ggplot(mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))


# you can mutate too
gapminder %>%
  # extract first letter of country name into new column
  # that's substr(x, start, finish)
  mutate(startsWith = substr(country, 1, 1)) %>%
  # only keep countries starting with A or Z
  filter(startsWith %in% c("A", "Z")) %>%
  # plot lifeExp into facets
  ggplot(aes(x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(vars(country)) +
  theme_minimal()


# grand challenge
# build it up line by line
lifeExp_2countries_bycontinents <- gapminder %>%
  filter(year==2002) %>%
  group_by(continent) %>%
  sample_n(2) %>%
  summarize(mean_lifeExp=mean(lifeExp)) %>%
  arrange(desc(mean_lifeExp))
lifeExp_2countries_bycontinents

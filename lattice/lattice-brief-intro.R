##################################
### lattice brief introduction ###
##################################

#
#   Useful in multivariate data
# 

library(lattice)

#   Example 1: singer data
str(singer)
head(singer)

#   1. relationship between height and voice part
histogram(~ height | voice.part, data = singer)
bwplot(height ~ voice.part, data = singer)

#   2. mean height for each voice part
library(dplyr)
singerCopy = singer %>%
  group_by(voice.part) %>%
  mutate(avg_height = mean(height))

barchart(avg_height ~ voice.part, data = singerCopy)

#   Example 2: mtcars
str(mtcars)

#   1. density of data
densityplot(~ mpg, data = mtcars)
densityplot(~ mpg | cyl, data = mtcars)

#   2. scatter plot
xyplot(mpg ~ wt | cyl, data = mtcars)

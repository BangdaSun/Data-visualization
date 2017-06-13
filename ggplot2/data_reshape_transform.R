#   In practice, the form of data is important for visualization
#   origin <=> long/wide <=> tidy

#   Extension of part 9.2 in ggplot-data-processing.R

library(ggplot2)
library(tidyr)
library(reshape2)

#   Check the example of melt
?melt
example("melt.data.frame")
head(airquality)
head(melt(airquality, id=c("month", "day")))
str(melt(airquality, id=c("month", "day")))

#   Reshape iris
head(iris)
iris_long = melt(iris, id = "Species")

#   Transform into tidy form
#   split variable into part and measure: sepal.length => sepal, length
iris_tidy = iris_long %>%
  separate(variable, c("Part", "Measure"), sep = "\\.")

#   1. distribution of length and width on different part, condition on species
ggplot(iris_tidy, aes(x = Measure, y = value, color = Part)) + 
  geom_boxplot() + 
  facet_grid(.~ Species)

#   2. distribution of length and width on different species and part
ggplot(iris_tidy, aes(x = Species, y = value, color = Part)) + 
  geom_boxplot() + 
  facet_grid(.~ Measure)

##########################
### Chapter 5. Toolbox ###
##########################

### 5.1 Intro
#   we will introduce:
#      basic plot - we can spell their name out
#      data distributions
#      overlap problem in scatter plot, useful in large scale data
#      3-D plot on 2-D
#      statistical summary
#      geographical plot, map plot
#      show the uncertainty and error
#      add notice
#      plot weighted data

### 5.2 Strategy to add layers
#   three aspects:
#      (1) data itself: almost all visualization will have this
#      (2) summary of data
#      (3) metadata (e.g. map background in geographical data), notice

### 5.3 Basic plot types
#   all geom objects are 2-D, therefore x, y is necessary
#   also with: color, size, fill, shape, linetype

#   example:
df = data.frame(
  x = c(3, 1, 5),
  y = c(2, 4, 6),
  label = c("a", "b", "c")
)

library(ggplot2)
p = ggplot(df, aes(x = x, y = y)) + xlab(NULL) + ylab(NULL)
p + geom_point() + labs(title = "geom_point")
p + geom_bar(stat = "identity") +
  labs(title = "geom_bar(stat=\"identity\")")
p + geom_line() + labs(title = "geom_line")
p + geom_area() + labs(title = "geom_area")
p + geom_path() + labs(title = "geom_path")
p + geom_text(aes(label = label)) + labs(title = "geom_text")
p + geom_tile() + labs(title = "geom_tile")
p + geom_polygon() + labs(title = "geom_polygon")

### 5.4 Distribution
#   for unvariate distribution, binwidth and breaks are necessary

p = ggplot(diamonds, aes(x = depth))
p + geom_histogram(aes(y = ..density..), binwidth = .5)
p + geom_histogram(aes(y = ..density..), binwidth = .3) + xlim(58, 68)

p + geom_histogram(aes(y = ..density..), binwidth = .1) +
  facet_grid(cut ~.)
p + geom_bar(aes(fill = cut), binwidth = .1, position = "fill")

ggplot(diamonds, aes(x = cut, y = depth)) + 
  geom_boxplot()

ggplot(diamonds, aes(depth)) + geom_density()
ggplot(diamonds, aes(depth)) + geom_density(aes(fill = cut), alpha = .2)

### 5.5 Overplotting

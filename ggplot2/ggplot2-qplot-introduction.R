#####################################
### Chapter 2. Begin from qplot() ###
#####################################

### 2.1 Intro
#   qplot() means "quick plot"
#   similar to plot(), also has xlim, ylim, main, xlab, ylab
#   basis: mapping - aesthetic, geom object, facet etc
library(ggplot2)

### 2.2 Data
diamonds = diamonds
set.seed(1410)
dsmall = diamonds[sample(nrow(diamonds), 100), ]

### 2.3 Basic
#   the first two param are x, y, also with data = ...
qplot(carat, price, data = diamonds)           # exponential trend
qplot(log(carat), log(price), data = diamonds) # highly overlap...
qplot(carat, x * y * z, data = diamonds)

### 2.4 Color, Size, Shape etc
#   qplot() can convert categorical variables automatically, and generate legend
qplot(carat, price, data = dsmall, color = color)
qplot(carat, price, data = dsmall, shape = cut)
qplot(carat, price, data = dsmall, color = color, shape = cut)

#   to overcome the overlap in large scale data set, use alpha = I(1 / n),
#   n means it will not be transparent with n overlaps
qplot(carat, price, data = diamonds, alpha = I(1/10))
qplot(carat, price, data = diamonds, alpha = I(1/100))
qplot(carat, price, data = diamonds, alpha = I(1/200))

### 2.5 Geom object
#   2.5.1 add smooth line to scatter plot
#   for small n, use method = "loess", controlled by span = ...
#   for large n (n > 1000), use method = "gam"
#   also we can specify with method = "lm", and splines
library(splines)
qplot(carat, price, data = dsmall, geom = c("point", "smooth"))
qplot(carat, price, data = dsmall, geom = c("point", "smooth"), se = FALSE)
qplot(carat, price, data = dsmall, geom = c("point", "smooth"), method = "lm")
qplot(carat, price, data = dsmall, geom = c("point", "smooth"), method = "lm", 
      formula = y ~ ns(x, 5))

#    2.5.2 boxplot and jitter
#    when we have one categorical variable and one/multiple continuous variable
#    we may want to check situations under different levels of categorical variable
qplot(color, price / carat, data = diamonds, geom = "jitter")
qplot(color, price / carat, data = diamonds, geom = "jitter", alpha = I(1/10))
qplot(color, price / carat, data = diamonds, geom = "jitter", alpha = I(1/50), fill = "red")
qplot(color, price / carat, data = diamonds, geom = "jitter", alpha = I(1/100))

qplot(color, price / carat, data = diamonds, geom = "boxplot")
qplot(color, price / carat, data = diamonds, geom = "boxplot", fill = "red")

#     2.5.3 histogram and density plot
#     always try different binwidth = ...
#     ..density.. for density rather than count
qplot(carat, data = diamonds, geom = "histogram", bins = 50)
qplot(carat, data = diamonds, geom = "density")
qplot(carat, data = diamonds, geom = "histogram", fill = color)
qplot(carat, ..density.., data = diamonds, geom = "histogram")

#     2.5.4 bar plot
qplot(color, data = diamonds, geom = "bar")

#     2.5.5 line and path in time series
economics = economics
qplot(date, unemploy / pop, data = economics, geom = "line")
qplot(date, unemploy, data = economics, geom = "line")
qplot(unemploy / pop, uempmed, data = economics, geom = c("point", "path"))

year = function(x) {
  return(as.POSIXlt(x)$year + 1900)
}
qplot(unemploy / pop, uempmed, data = economics, geom = "path", color = year(date))

### 2.6 Plot by conditioning, facet()
#   row_var ~ col_var
qplot(carat, data = diamonds, facets = color ~., geom = "histogram")

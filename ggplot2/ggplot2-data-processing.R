##################################
### Chapter 9. Data Processing ###
##################################

### 9.1 Intro to plyr
# like faceting, ddply() can summmarize each subset
# as well as list, array
# ddply(.data, .variables, .fun, ...)
library(plyr)

# examples:
#   subset() function
#   (1) find the minimum carat in each color
ddply(diamonds, .(color), subset, carat == min(carat))

#   (2) find the minimum two diamonds in each color
ddply(diamonds, .(color), subset, order(carat) <= 2)

# (3) find the top 1% 
ddply(diamonds, .(color), subset, carat > quantile(carat, .99))

# (4) find the diamonds larger than mean price
ddply(diamonds, .(color), subset, price > mean(price))

# transform() function
# (1) standardize price in each color
ddply(diamonds, .(color), transform, price = scale(price))

# (2) minus mean
ddply(diamonds, .(color), transform, price = price - mean(price))

# application: fit multiple models

### 9.2 Turn "wide" data into "long" data

#   wide data:
#   var1 var2 var3
#   a1   b1   c1
#   a2   b2   c2
#   a3   b3   c3

#   long data:
#   id var  value
#   1  var1 a1
#   2  var1 a2
#   3  var1 a3
#   4  var2 b1
#   5  var2 b2
#   6  var2 b3
#   7  var3 c1
#   8  var3 c2
#   9  var3 c3

# to group data, it's easy to group based on "row",
# but it's difficult to group based on "column":
# we can group diamonds based on color - but ...
# we can't group into 2 groups based on carat and price
# therefore we turn the orginal data into long data, and then we can group based on "row" again!
# we use melt(), cast() function

##  9.2.1 multiple time series
# it's very useful to deal with time series for long format
# example:
# without melt
ggplot(economics, aes(date)) + 
  geom_line(aes(y = unemploy, color = "unemploy")) + 
  geom_line(aes(y = unemploy, color = "uempmed")) + 
  scale_color_hue("variable")

library(reshape2)
emp = melt(economics, id = "date", measure = c("unemploy", "uempmed"))
head(economics)
head(emp)
qplot(date, value, data = emp, geom = "line", color = variable)
qplot(date, value, data = emp, geom = "line") + 
  facet_wrap(~ variable, scales = "free_y", nrow = 2)
qplot(date, value, data = emp, geom = "line") + 
  facet_grid(variable ~., scales = "free_y")

##  9.2.2 parallel coordinates

### 9.3 ggplot() method
# ggplot() is a generic function

##  9.3.1 linear model
# fortify() method

# example:
qplot(displ, cty, data = mpg) + geom_smooth(method = "lm")
mpgmod = lm(cty ~ displ, data = mpg)
summary(mpgmod)

mod = lm(cty ~ displ, data = mpg)
basic = ggplot(mod)

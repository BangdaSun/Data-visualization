# install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(reshape2)
library(tidyr)

setwd("C://Users//Bangda//Desktop")

### import and subset
raw_data = read.spss("Hotel.Yintan.sav")
raw_data = as.data.frame(raw_data)
data = select(raw_data, Level, Distance, Reviews, Price)

### reshape
data_long = melt(data)
data_long = arrange(data_long, variable)

### original plot
p1 = ggplot(data = data_long) + 
  geom_histogram(mapping = aes(x = value, y = ..density..), bins = 15, fill = "lightblue", color = "black", alpha = .5) +
  geom_density(aes(x = value, y = ..density..), alpha = .2, fill = "lightblue") + 
  facet_wrap(~variable, nrow = 2, scales = "free")

### plot normal density on plot
sd_   = apply(data, 2, sd)
mean_ = colMeans(data)
min_  = apply(data, 2, min)
max_  = apply(data, 2, max)

# generate x_
x_ = matrix(0, nrow = 100, ncol = 4)
d_ = matrix(0, nrow = 100, ncol = 4)

for (i in seq(4)) {
  x_[, i] = seq(min_[i], max_[i], length.out = 100)
}

for (i in seq(4)) {
  d_[, i] = dnorm(x_[,i], mean = mean_[i], sd = sd_[i])
}

df = data.frame(d_, id = 1:100)
colnames(df) = c("Level.y", "Distance.y", "Reviews.y", "Price.y", "id")
dx = data.frame(x_, id = 1:100)
colnames(dx) = c("Level.x", "Distance.x", "Reviews.x", "Price.x", "id")

data2_long = melt(cbind(df, dx), id.vars = c("id"))
data2_long = data2_long %>%
  separate(variable, c("variable", "axis"), sep = "\\.") %>%
  dcast(variable + id ~ axis, value.var = "value")

colnames(data2_long) = c("variable", "id", "x", "y")
data2_long$variable = factor(data2_long$variable, levels = c("Level", "Distance", "Reviews", "Price"))

p1 + geom_line(data = data2_long, mapping = aes(x = x, y = y), col = "red") + 
  facet_wrap(~variable, nrow = 2, scales = "free")

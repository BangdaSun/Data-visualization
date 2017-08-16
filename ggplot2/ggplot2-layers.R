###############################################
### Chapter 4. Using layers to build a plot ###
###############################################

### 4.1 Intro
# Five elements of layers of plot
#   (1) data
#   (2) mapping - aesthetic
#   (3) geom object
#   (4) statistical transformation

### 4.2 Create plot object
# start using ggplot()!!

### 4.3 Layers
# using + to add layers:
# layers(geom, geom_param, stat, stat_param, data, mapping, position)
p = ggplot(diamonds, aes(x = carat))
p = p + layer(
  geom = "bar",
  geom_params = list(fill = "lightblue"),
  stat = "bin",
  stat_params = list(binwidth = 2)
)
p

# in short:
p = ggplot(diamonds, aes(x = carat)) +
  geom_bar(fill = "red") + 
  stat_bin(bins = 50)
p
summary(p)

### 4.4 Data
# HAVE TO USE data frame in ggplot

### 4.5 Aesthetics
# aes()
# for example: aes(x = weight, y = height, colour = age)
# it will map x coord to weight, y coord to height, colour to age
##  4.5.1 plot and layer
p = ggplot(mtcars)
summary(p)
p
p = p + aes(wt, hp)
summary(p)
p

# use '+' to add layers
p = ggplot(mtcars, aes(x = mpg, y = wt)) +
  geom_point()
p
# revise layers aesthetics
p1 = p + geom_point(aes(color = factor(cyl)))
p1
p2 = p + geom_point(aes(y = disp))
p2

##  4.5.2 setting and mapping
# we can also assgin param separately
# two different examples!
p = ggplot(mtcars, aes(mpg, wt))
print(p + geom_point(aes(color = "darkblue")))
print(p + geom_point(color = "darkblue"))

##  4.5.3 group
# geom object can be classified as 
# (1) individual - point ... one object for one obs
# (2) collective - histogram ... one object for multi obs
# to control which obs use which geom object, we use group

# example 1: multi groups and single aesthetic
# Oxboys dataset: record 26 boys' (subject) height and age at 9 occasions
library(nlme)
head(Oxboys, 15)
summary(Oxboys)
str(Oxboys)
ggplot(Oxboys, aes(age, height, group = Subject)) +
  geom_line()
ggplot(Oxboys, aes(age, height, color = Subject)) +
  geom_line()

# incorrect example
ggplot(Oxboys, aes(age, height)) + geom_line()

# example 2: different groups on different layers
# sometimes we want summarize different levels of data to plot
p = ggplot(Oxboys, aes(age, height, group = Subject)) +
  geom_line()
p + geom_smooth(aes(group = Subject), method = "lm", se = F)
#    right way:
p + geom_smooth(aes(group = 1), method = "lm", size = 2, se = F)

### 4.6 Geometric object

### 4.7 Statistical transformation
# summary the data, for example: smooth

# use ..var.. to avoid name conflict
ggplot(diamonds, aes(carat)) +
  geom_histogram(aes(y = ..density..), binwidth = .05)

ggplot(diamonds, aes(carat)) +
  geom_histogram(aes(y = ..density..), binwidth = .1)

ggplot(diamonds, aes(carat)) +
  geom_histogram(aes(y = ..density..), binwidth = .5)

### 4.8 Position
# dodge: side by side
# fill: height set to 1
# identity
# jitter
# stack

p = ggplot(diamonds, aes(clarity))
p + geom_bar(aes(fill = cut))  # default to be stack
p + geom_bar(aes(fill = cut), position = "dodge")
p + geom_bar(aes(fill = cut), position = "fill")
p + geom_bar(aes(fill = cut), position = "identity")

### 4.9 Put things together

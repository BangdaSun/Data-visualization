######################################
### Chapter 6. Scale, Axis, Legend ###
######################################

### 6.1 Intro
#   scale control the mapping from data to aesthetics (size, color, position, shape)
#   as well as axix and legend

#   three steps to execute scaling: transformation - training - mapping
#   

### 6.2 How scale works
#   first we need to the domain (data) and range (aesthetic)
#   then:
#   (1) transformation
#   e.g. logarithm

#   (2) training

#   (3) mapping

### 6.3 Usage

plot = qplot(cty, hwy, data = mpg)
plot

#   scale confilit
plot + aes(x = drv)

#   adjust default scale
plot + aes(x = drv) + scale_x_discrete()

#  to update scale:
#  + scale_ + aesthetic name (x_, y_, color_, shape_) + scale name (_gradient, _hue, _manual)
p = qplot(sleep_total, sleep_cycle, data = msleep, color = vore)
p

p + scale_color_hue()

p + scale_color_hue("What does\nit eat?",
                    breaks = c("herbi", "carni", "omni", NA),
                    labels = c("plants", "meat", "both", "unknown"))

p + scale_color_brewer(palette = "Set1")

### 6.4 More details
#   6.4.1 general parameters
#   (1) name
#   set the label of axis and legend, we can use string or expression (?plotmath)
#   with labs(), xlab(), ylab()
p = qplot(cty, hwy, data = mpg, color = displ)
p

p + scale_x_continuous(name = "City mpg")
p + xlab("City mpg")
p + ylab("High way mpg")
p + labs(x = "City mpg", y = "Highway", color = "Displacement")
p + xlab(expression(frac(miles, gallon)))

#   (2) limits
#   domain of scale

#   (3) breaks and labels
p = qplot(cyl, wt, data = mtcars)
p
p + scale_x_continuous(breaks = c(5.5, 6.5))
p  = qplot(wt, cyl, data = mtcars, color = "cyl")
p
p + scale_color_gradient(breaks = c(5.5, 6.5))
p + scale_color_gradient(limits = c(5.5, 6.5))

#   6.4.2 position scale
#   common task: revise the range of axis
#   every plot has x & y position scale: xlim(), ylim()

#   (1) continuous
#   revise data vs revise scale
qplot(log10(carat), log10(price), data = diamonds)
qplot(carat, price, data = diamonds) + 
  scale_x_log10() + scale_y_log10()
  # same as scale_x_continuous(trans = "log10")

#   (2) date and time
#   here only date and POSIXct class
#   three params: major, minor, format

#   6.4.3 color scale


#   example:
#   eruption: interval time of two eruption and waiting time
f2d = with(faithful, MASS::kde2d(eruptions, waiting, h = c(1, 10), n = 50))
df = with(f2d, cbind(expand.grid(x, y), as.vector(z)))
head(df)
class(f2d)
summary(f2d)
str(f2d)
names(df) = c("eruptions", "waiting", "density")
erupt = ggplot(df, aes(waiting, eruptions, fill = density))
erupt + geom_tile() + 
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0))

last_plot() + scale_fill_gradient(limits = c(0, .04))
last_plot() + scale_fill_gradient(limits = c(0, .04),
                                  low = "white", high = "black")
last_plot() + scale_fill_gradient2(limits = c(-.04, .04),
                                   midpoint = mean(df$density))


#   more color
library(vcd)


#   6.4.4 

#   6.4.5

### 6.5 Legend and axis
#   axis and coord are called guide element
#   legend tile - axis label, use name = ...
#   legend key - tick label, use break = ...

#   add legend manually (without melt data)
#   example of one - variable plot
df = data.frame(x1 = rnorm(1000000, mean = 2, sd = 3),
                x2 = rnorm(1000000, mean = 10, sd = 6))
ggplot(df) + 
  geom_density(aes(x = x1, y = ..density.., fill = 'less sd'), alpha = I(1/2)) + 
  geom_density(aes(x = x2, y = ..density.., fill = 'more sd'), alpha = I(1/2)) + 
  labs(x = 'x') + 
  theme(legend.position = 'top') +
  scale_fill_discrete(name = 'Distributions')

#   example of two - variables plot
df = data.frame(x = 1:20,
                y = 5.3 * 1:20 + rnorm(20),
                z = 3.4 * 1:20 + rnorm(20))
ggplot(df) + 
  geom_point(aes(x = x, y = y, color = 'line1')) + 
  geom_point(aes(x = x, y = z, color = 'line2')) +
  labs(x = 'x') + 
  scale_color_manual(name = '', values = c('line1' = 'red', 'line2' = 'blue'))

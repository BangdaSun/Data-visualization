##############################
### Chapter 7. Positioning ###
##############################

### 7.1 Intro
#   Positioning has four aspects:
#   (1) adjust position, in overplotting
#   (2) scale, linear/logarithm
#   (3) facet, small multiples
#   (4) coordinate system
library(ggplot2)

### 7.2 Facet
#   compare the differences among subsets of data
#   two types facets in ggplot2: facet_grid, facet_wrap
#   facet_grid is true 2-D: with row variable and col variable
#   facet_wrap is just rearrange the layout of plots

#   data:
mpg2 = subset(mpg, cyl != 5 & drv %in% c("4", "f"))

#   7.2.1 facet grid
#   (1) no facet
qplot(cty, hwy, data = mpg2) + facet_null()

#   (2) one row ~ multi col
#   . ~ var, useful for data display
qplot(cty, hwy, data = mpg2) + facet_grid(. ~ cyl)

#   (3) multi row ~ one col
#   b ~., useful for distribution display
qplot(cty, data = mpg2, geom = "histogram", binwidth = 1) +
  facet_grid(cyl ~.)

#   (4) multi row ~ multi col
#   a ~ b
qplot(cty, hwy, data = mpg2) +
  facet_grid(drv ~ cyl)

#   margin plot
#   just like a contingency table, or 2-D discrete distribution
p = qplot(displ, hwy, data = mpg2) + 
  geom_smooth(method = "lm", se = F)
p + facet_grid(cyl ~ drv)
p + facet_grid(cyl ~ drv, margins = TRUE)

#   7.2.2 facet warp
#   useful in dealing with multi level data

#   7.2.3 scale control
#   in facet_grid and facet_wrap, you can use scales = ...
#   scales = "fixed", default case
#   scales = "free", scales of x & y can be different
#   scales = "free_x"
#   scales = "free_y"
p = qplot(cty, hwy, data = mpg)
p + facet_wrap( ~ cyl, ncol = 2, scale = "free")

#   useful to display different scale of time series
library(reshape2)
em = melt(economics, id = "date")
head(em)
head(economics)
qplot(date, value, data = em, geom = "line", group = variable) +
  facet_grid(variable ~ ., scale = "free_y")

#   there is one more constraints in facet_grid()
#   scale of x should same for same column
#   scale of y should same for same row
#   we can use space = ... to deal with it
mpg3 = within(mpg2, {
  model = reorder(model, cty)
  manufacturer = reorder(manufacturer, -cty)
})

models = qplot(cty, model, data = mpg3)
models
models + facet_grid(manufacturer ~., 
                    scales = "free",
                    space = "free") +
  theme(strip.text.y = element_text())

#   7.2.4 missing data

#   7.2.5 group and facet

#   7.2.6 side by side and facet

#   7.2.7 continuous variable
#   to facet based on continuous variable:
#   (1) cut data into n parts with same length
#   cut_interval(x, n = 10)
#   cut_interval(x, length = 1)

#   (2) cut data into n parts with same number of obs
#   cut_number(x, n = 10)

mpg2$disp_ww = cut_interval(mpg2$displ, length = 1)
mpg2$disp_wn = cut_interval(mpg2$displ, n = 6)
mpg2$disp_nn = cut_number(mpg2$displ, n = 6)

plot = qplot(cty, hwy, data = mpg2) + labs(x = NULL, y = NULL)
plot + facet_wrap( ~ disp_ww, nrow = 1)
plot + facet_wrap( ~ disp_wn, nrow = 1)
plot + facet_wrap( ~ disp_nn, nrow = 1)

### 7.3 Coordinate system

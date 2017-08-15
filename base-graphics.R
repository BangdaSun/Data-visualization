##################################
### Base Graphic packages in R ###
##################################

# GGPLOT2 IS NOT THE WHOLE WORLD OF R DATA VISUALIZATION!!!

### 0. Basic args

#   save the plot into files
pdf('fig1.pdf')
attch(mtcars)
plot(wt, mpg)
abline(lm(mpg ~ wt))
detach(mtcars)
dev.off()

#   symbol and line: specify with number or name
# * type 
# * pch
# * cex
# * lty
# * lwd

#   color: we can specify it with number, color name, hexdecimal, RGB, HSV
# * col
# * col.axis
# * col.lab
# * col.main
# * col.sub
# * fg
# * bg
?colors()

# create continuous color vector: rainbow(), heat.colors(), terrain.colors(), topo.colors()


#   text: font size, font, font style (bold...)
# * cex
# * cex.axis
# * cex.lab
# * cex.main
# * font (style)
# * font.axis
# * font.lab
# * font.main
# * ps (size)
# * family: serif, sans, mono

#   figure position and size
# * pin: width, height
# * mai: (down, left, up, right)
# * mar: 

#   axis: specify axis style with axis()
# * side: position to put axis
# * at: position of ticks
# * labels: ticks label
# * pos
# * lty
# * col
# * las: label parallel(=0) or vertical (=2)
# * tck: length of tick, default -0.01 ***
plot(x, y, type = 'p')
axis(side = 1, tck = 1)
axis(side = 2, tck = 1)

#   reference line: abline()

#   legend:
# * location
# * title
# * legend

#   text note: text()
# * location
# * pos (1, 2, 3, 4)
# * side

?plotmath

#   also we can include these args into par() 

#   multiple-plots
#   use par() and layout()

#   par(mfrow = c(nrows, ncols)), mfrow can be nfcol = ..

#   layout(mat), mat is used to specify location, e.g.: (fig 1 at row 1, fig 2 and 3 at row 2, 2x2 layout)
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE), widths = c(3, 1), heights = c(1, 2))


### 1. Bar plot

#   Simpliest case
library(vcd)
head(Arthritis)
counts <- with(Arthritis, table(Improved))
counts

barplot(counts, main = 'simpliest barplot',
  xlab = 'improvement', ylab = 'frequency')

barplot(counts, main = 'horizontal barplot',
  xlab = 'frequency', ylab = 'improvement', horiz = TRUE)

# or we can just use plot() if the data is factor
with(Arthritis, plot(Improved))

#   Multiple groups
counts <- with(Arthritis, table(Improved, Treatment))
counts  # matrix like object

barplot(counts, main = 'Stacked barplot',
  xlab = 'treatment', ylab = 'frequency',
  col = c('red', 'yellow', 'green'),
  legend = rownames(counts))

barplot(counts, main = 'Stacked barplot',
  xlab = 'treatment', ylab = 'frequency',
  col = c('red', 'yellow', 'green'),
  legend = rownames(counts), beside = TRUE)

#   Combined with aggregation data
states <- data.frame(state.region, state.x77)
head(states)
aggr_mean <- aggregate(states$Illiteracy, by = list(state.region), mean)
aggr_mean
aggr_mean_ordered <- aggr_mean[order(aggr_mean$x), ]
aggr_mean_ordered

#   Customize barplot
# * cex.names --> font size
# * names.arg --> labels
# * las = ..  --> rotate labels
counts <- with(Arthritis, table(Improved))
par(mar = c(5, 8, 4, 2))
barplot(counts, main = 'Treatment outcome', horiz = TRUE,
  cex.names = .8, names.arg = c('no improvement', 'some improvement', 'marked improvement'),
  las = 2)


### 2. Pie plot


### 3. Histogram

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

#   symbol and line
# * type 
# * pch
# * cex
# * lty
# * lwd

#   color
# * col
# * col.axis
# * col.lab
# * col.main
# * col.sub
# * fg
# * bg


#   also we can include these args into par() 

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

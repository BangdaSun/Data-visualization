#
# hexbin
#  
# reference:
#   https://cran.r-project.org/web/packages/hexbin/vignettes/hexagon_binning.pdf
# 
# Hexagon binning is a form of bivariate histogram useful for visualizing large data set.
# 
# the x-y plane over the set is tessellated by a regular grid of hexagons
# the number of points falling in each hexagon are counted and stored
# plot the hexagon using a color ramp or varying the radius of the hexagon prop to counts
#
# in terms of packing, hexagon is 13% more efficient for covering the plane than squares
# effective for displaying the structure of data set with n >= 1e6
#
library(hexbin)

# example
x    = rnorm(1000000)
y    = rnorm(1000000)
hbin = hexbin(x, y, xbins = 30) 
class(hbin)
plot(hbin)
gplot.hexbin(hbin, style = 'centroids')
gplot.hexbin(hbin, style = 'lattice')
gplot.hexbin(hbin, style = 'nested.lattice')
gplot.hexbin(hbin, style = 'constant.col', colramp = NULL)

# more color option
?colorRamp

# in ggplot2
library(ggplot2)
df = data.frame(x = x, y = y)
ggplot(df) +
  geom_hex(aes(x = x, y = y), bins = 40)

##########################
### ggmap introduction ###
##########################

#
# ggmap: Spatial visualization with ggplot2, David Kahle and Hadley Wickham
#

library(ggmap)
library(ggplot2)

# Get the map around columbia university (use quick map plot - qmap)
qmap("columbia university", zoom = 13, color = "bw")

# Data: crime in houston
murder = subset(crime, offense == "murder")
head(murder)
qmplot(lon, lat, data = murder, color = "red", size = 3, darken = .3)

### How ggmap works?
#   basic idea: download map image, plot is as context layer
#   using ggplot2

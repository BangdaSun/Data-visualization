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
# basic idea: download map image, plot is as context layer
# using ggplot2

##  (1) get_map function
# in ggmap, downloading a map as an image and formatting the
# image for plotting is done with 
#
# get_map function
#
# More specifically, it's a wrapper function for the underlying
# functions get_googlemap, get_openstreetmap, get_stamenmap, get_cloudmademap
# which accepts a wide array of arguments and returns a classed raster object for plotting
# The most important argument of get_map is the location - long/lat, which 
# specify the center of the map, accompanied by a zoom argument (3 to 20)

# we can get the location by geocode(), where the argument should be a viable location
geocode("columbia university")
geocode("169 manhattan ave")

##  (2) tile style - source and maptype of get_map
# Different map sources:
# Google Maps, OpenStreetMap, StamenMaps, CloudMade Maps (by different producer)
# This are specified with the maptype argument of get_map, must agree with source argument
qmap("columbia university", zoom = 14)
qmap("columbia university", zoom = 14, maptype = "watercolor")
qmap("columbia university", zoom = 14, maptype = "toner")

# access to google map api
# example: draw markers and paths
# from apartment to company
df = data.frame(
  x = c(geocode("hanweck")[,1], geocode("169 manhattan ave")[,1]),
  y = c(geocode("hanweck")[,2], geocode("169 manhattan ave")[,2])
)
df = round(df, digits = 5)

map =  get_googlemap('empire state building', markers = df, path = df, zoom = 12)
ggmap(map, extent = 'device')

# example: travel history
travel = data.frame(
  x = c(geocode("169 manhattan ave")[,1],
        geocode("washington dc")[,1],
        geocode("orlando")[,1],
        geocode("cancun")[,1],
        geocode("chemax")[,1],
        geocode("nassau")[,1]),
  y = c(geocode("169 manhattan ave")[,2],
        geocode("washington dc")[,2],
        geocode("orlando")[,2],
        geocode("cancun")[,2],
        geocode("chemax")[,2],
        geocode("nassau")[,2])
)
travel = round(travel, digits = 5)

map =  get_googlemap("jacksonville", markers = travel, path = travel, zoom = 4)
ggmap(map, extent = "device")

##  (3) ggmap function
# The purpose of ggmap is to take the map from the raster object to the screen,
# it fulfills this purpose by creating a ggplot object
#   
# ggmap need a ggmap object, with params:
# extent = ..., normal, panel, device
# base_layer = ...
# maprange = ...
# legend = ...
# padding = ...
# darken = ...

ny = get_map(location = "times square", zoom = 13)
str(ny)

ggmap(ny, extent = "normal")
ggmap(ny, extent = "panel")
ggmap(ny, extent = "device")


### ggmap in action

# Data: from Houston Police Department's website
str(crime)
qmap("houston", zoom = 13)

# to determine a bounding box, use gglocator
gglocator(2)

# only violent crimes
violent_crimes = subset(crime, offense != "auto theft" & offense != "theft" & offense != "burglary")

# order violent crimes
violent_crimes$offense = factor(violent_crimes$offense,
                                levels = c("robbery", "aggravated assault", "rape", "murder"))

# restrict to downtown
violent_crimes = subset(violent_crimes,
                        -95.39681 <= lon & lon <= -95.34188 &
                         29.73631 <= lat & lat <=  29.78400)

### Analysis
##  (1) look at where the individual crimes took place
theme_set(theme_bw(16))
houstonmap = qmap("houston", zoom = 14, color = "bw", legend = "topleft")
houstonmap + 
  geom_point(aes(x = lon, y = lat, color = offense, size = offense),
             data = violent_crimes)
houstonmap + 
  stat_bin2d(
    aes(x = lon, y = lat, color = offense, fill = offense),
    size = .5, bins = 30, alpha = 1/2,
    data = violent_crimes
  )

##  (2) what about violent crimes in general
houstonmap + 
  stat_density2d(
    aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
    size = 2, bins = 4, geom = "polygon",
    data = violent_crimes
  )

overlay = stat_density2d(
  aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
  bins = 4, geom = "polygon",
  data = violent_crimes
)

#   ???
houstonmap + overlay + inset(
  grob = ggplotGrob(ggplot() + overlay + theme_inset()),
  xmin = -95.35836, xmax = Inf, ymin = -Inf, ymax = 29.75062
)

##  (3) different days
Houston = get_map(location = "houston", zoom = 14, color = "bw")
HoustonMap = ggmap(Houston, base_layer = ggplot(aes(x = lon, y = lat),
                                                data = violent_crimes))
HoustonMap + 
  stat_density2d(aes(x = lon, y = lat, fill = ..level.., alpha = ..level..),
                 bins = 5, geom = "polygon",
                 data = violent_crimes) + 
  scale_fill_gradient(low = "black", high = "red") +
  facet_wrap(~ day)

### ggmap utility functions
##  (1) geocode()
geocode(c("columbia unversity", "169 manhattan ave"), output = "more")

##  (2) revgeocode()
school = geocode("columbia university")
school = as.numeric(school)
revgeocode(school) # output = all to return entire JSON object reported by google

##  (3) mapdist()
from = c("169 manhattan ave")
to = c("columbia university")
mapdist(from, to)

##  (4) route()

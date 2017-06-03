############################
### Chapter 8. Polishing ###
############################

### 8.1 Theme

#   8.1.1 build-in theme
#   default: theme_gray(), theme_bw()

hgram = qplot(hwy, data = mpg2, binwidth = 1)
hgram

previous_theme = theme_set(theme_gray())
hgram

previous_theme = theme_set(theme_bw())
hgram

previous_theme = theme_set(theme_classic())
hgram

#   overlap initial theme
hgram + previous_theme

#   8.1.2 theme element and element function
#   theme is controled by multiple elements
#   there are three elements can control x and y direction:
#   axis.text, axis.title, strip.text

#   build-in element function has four basic types:
#   (1) text
#   element_text() can draw label and title
hgramt = hgram + labs(title = "This is a histogram")
hgramt

hgramt + theme(plot.title = element_text(size = 20))
hgramt + theme(plot.title = element_text(size = 20, color = "red"))
hgramt + theme(plot.title = element_text(size = 20, hjust = .2))
hgramt + theme(plot.title = element_text(size = 20, face = "bold"))
hgramt + theme(plot.title = element_text(size = 20, angle = 180))

#   (2) line
#   element_line() can draw line and segment
hgram + theme(panel.grid.major = element_line(color = "red"))
hgram + theme(panel.grid.major = element_line(size = 2))
hgram + theme(panel.grid.major = element_line(linetype = "dotted"))
hgram + theme(axis.line = element_line(color = "red"))
hgram + theme(axis.line = element_line(size = .5, linetype = "dashed"))

#   (3) rectangle
#   element_rect() provide the background rectangle
hgram + theme(plot.background = element_rect(fill = "grey80", color = NA))
hgram + theme(plot.background = element_rect(size = 2))
hgram + theme(plot.background = element_rect(color = "red"))
hgram + theme(panel.background = element_rect())
hgram + theme(panel.background = element_rect(color = NA))
hgram + theme(panel.background = element_rect(linetype = "dotted"))

#   (4)

### 8.2 Self-defined scale and geom_point

### 8.3 Output

### 8.4 Multiple plot in one page

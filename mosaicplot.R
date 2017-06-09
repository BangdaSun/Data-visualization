###################
### Mosaic plot ###
###################

#   Mosaic plot is a graphic method for visualizing data from 
#   two or more qualitative variables.
#   The area of the tiles, also known as the bin size, is 
#   proportional to the number of observations within that category
#   https://en.wikipedia.org/wiki/Mosaic_plot

#
#   https://www.stat.auckland.ac.nz/~ihaka/120/Lectures/lecture17.pdf
#   http://www.stat.ufl.edu/~presnell/Courses/sta4504-2000sp/R/R-CDA.pdf
#   https://github.com/jtr13/GR5702/blob/master/EDAVlecture20170117.pdf
#

#   Example: survival on titantic
#   4 categorical variables:
#   class: 1 / 2 / 3 / crew
#   sex: male / female
#   age: child / adult
#   survived: yes / no

library(dplyr)
library(ggplot2)

Titanic = data.frame(Titanic)
head(Titanic)

#   Calculate total survival numbers
df = Titanic %>%
  group_by(Survived) %>%
  summarise(Freq = sum(Freq))

df

#   Some visualization
#   Survival vs Non-survival
ggplot(df, aes(x = Survived, y = Freq)) + 
  geom_bar(stat = "identity")

#   By Sex
ggplot(Titanic, aes(x = Survived, y = Freq, fill = Sex)) + 
  geom_bar(stat = "identity")
ggplot(Titanic, aes(x = Survived, y = Freq, fill = Sex)) + 
  geom_bar(stat = "identity", position = "fill")
ggplot(Titanic, aes(x = Survived, y = Freq , fill = Sex)) +
  geom_bar(stat = "identity", position = "dodge")

#   By Class
ggplot(Titanic, aes(x = Survived, y = Freq, fill = Class)) + 
  geom_bar(stat = "identity")
ggplot(Titanic, aes(x = Survived, y = Freq, fill = Class)) + 
  geom_bar(stat = "identity", position = "fill")
ggplot(Titanic, aes(x = Survived, y = Freq, fill = Class)) + 
  geom_bar(stat = "identity", position = "dodge")

#   By Age
ggplot(Titanic, aes(x = Survived, y = Freq, fill = Age)) + 
  geom_bar(stat = "identity")
ggplot(Titanic, aes(x = Survived, y = Freq, fill = Age)) + 
  geom_bar(stat = "identity", position = "fill")
ggplot(Titanic, aes(x = Survived, y = Freq, fill = Age)) + 
  geom_bar(stat = "identity", position = "dodge")

### Mosaic plot
#   Survived or not in total
mosaicplot(~ Survived, data = Titanic, color = TRUE)

#   Check the survival which group by Class
mosaicplot(~ Survived + Class, data = Titanic, color = TRUE)

#   Check the survival which groub by Sex
mosaicplot(~ Survived + Sex, data = Titanic, color = FALSE)

#   Check the survival which group by multiple variables
mosaicplot(~ Survived + Class + Sex, data = Titanic)

#   Compare the Sex distribution by different class
mosaicplot(~ Class + Sex, data = Titanic)
mosaicplot(~ Sex + Class, data = Titanic)

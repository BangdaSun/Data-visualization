#
# ggpubr tutorial
#

library(ggpubr)

### 1. Probability distribution
df <- data.frame(sex = factor(rep(c('f', 'm'), each = 200)),
                 weight = c(rnorm(200, 55), rnorm(200, 58)))

ggdensity(df, x = 'weight', add = 'mean', rug = FALSE,
          color = 'sex', fill = 'sex') 

gghistogram(df, x = 'weight', add = 'mean', rug = FALSE,
          color = 'sex', fill = 'sex')


### 2. Boxplot 
data('ToothGrowth')
df <- ToothGrowth
head(df)

ggboxplot(df, x = 'dose', y = 'len', color = 'dose',
          add = 'jitter', shape = 'dose')


### 3. Barplot
df <- mtcars
head(df)

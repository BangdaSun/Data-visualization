#
# ggfortify
# 
# Fortified ggplot2
#
# Reference
#    http://rpubs.com/sinhrks/basics

library(ggfortify)

### 1. Plotting diagnostics for linear models
#   ggfortify let ggplot2 know how to interpret lm objects
lm_model1 <- lm(Petal.Width ~ Petal.Length, data = iris)
ggplot2::autoplot(lm_model1)
ggplot2::autoplot(lm_model1, which = 1:6, ncol = 3)

#   some decorations
ggplot2::autoplot(lm_model1, which = 1:6, ncol = 3, 
                  colour = 'dodgerblue3',  # can be treated as aesthetics
                  smooth.color = 'black',
                  smooth.linetype = 'dashed',
                  ad.color = 'blue',
                  label.color = 'blue')

### 2. Probability distributions
ggdistribution(dnorm, seq(-3, 3, .1), mean = 0, sd = 1)
ggdistribution(pnorm, seq(-3, 3, .1), mean = 0, sd = 1, fill = 'skyblue')

ggplot2::autoplot(density(rnorm(1:100)), fill = 'green')


### 3. Matrix object
str(eurodist)
ggplot2::autoplot(eurodist) + 
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

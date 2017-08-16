#
# ggfortify
# 
# Fortified ggplot2
#
# Reference
#    http://rpubs.com/sinhrks/basics

library(ggfortify)

### 1. Plotting diagnostics for linear models
# ggfortify let ggplot2 know how to interpret lm objects
lm_model1 <- lm(Petal.Width ~ Petal.Length, data = iris)
ggplot2::autoplot(lm_model1)
ggplot2::autoplot(lm_model1, which = 1:6, ncol = 3)

# some decorations
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


### 4. Time series
# autoplot() can handle various time-series objects include zoo, xts, ts
# Single series
class(AirPassengers)
head(AirPassengers)
ggplot2::autoplot(AirPassengers)
ggplot2::autoplot(AirPassengers, ts.colour = 'red', ts.linetype = 'dashed')  # color and colour is different here
ggplot2::autoplot(AirPassengers, ts.geom = 'bar')

# Multivariate series
library(vars)
data(Canada)
class(Canada)
Canada[1:10, 4]  # matrix like object

ggplot2::autoplot(Canada)
ggplot2::autoplot(Canada, facets = FALSE)

# work with forecast package
library(forecast)
ts_model1 <- auto.arima(AirPassengers)
ts_model1_pred <- forecast(ts_model1, level = c(95), h = 25)
ggplot2::autoplot(ts_model1)
ggplot2::autoplot(ts_model1_pred, predict.colour = 'red', predict.linetype = 'dashed')

# work with changepoint package
library(changepoint)


# work with Time series statistics

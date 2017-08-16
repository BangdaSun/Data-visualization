#   
#   borrow cost: the higher to borrow, the higher the borrow cost
#   borrow rate: b = log(B / S + 1) / T
#   deep in money: K << S for call and K >> S for put
#   at the money: K = S
#

# Import data with borrow rate (raw data from phd server)
setwd("C://Users//bsun//Desktop//conversion analysis")
brate = read.csv("borrowRate.csv", header = TRUE)
str(brate)

library(dplyr)
library(ggplot2)
library(reshape2)

# Remove NA, get the ticker, get the subset
brate1 = brate %>%
  filter(!is.na(stockPrice)) %>%
  mutate(ticker = substr(as.character(ownCode), start = nchar(as.character(ownCode)) - 3, stop = nchar(as.character(ownCode)))) %>%
  select(ticker, optType, stockPrice, strikePrice, borrowRate1, borrowRate2, borrowRate3)

# Convert into long format
brate_long = melt(brate1, 
                  id.vars = c("ticker", "strikePrice", "stockPrice", "optType"), 
                  measure.vars = c("borrowRate1", "borrowRate2", "borrowRate3"))

# Call and put for AAPL
ggplot(subset(brate_long, ticker == "AAPL")) + 
  geom_line(aes(x = strikePrice, y = value, col = variable), size = 1) + 
  facet_grid(.~ optType) +
  geom_abline(slope = 0, intercept = 0, linetype = 2) +
  labs(y = "borrow rate", color = "AAPL")

# Call and put for TSLA
ggplot(subset(brate_long, ticker == "TSLA")) + 
  geom_line(aes(x = strikePrice, y = value, col = variable), size = 1) + 
  facet_grid(.~ optType) +
  geom_abline(slope = 0, intercept = 0, linetype = 2) +
  labs(y = "borrow rate", color = "TSLA")

# Combine TSLA and AAPL
ggplot(brate_long) +
  geom_line(aes(x = strikePrice, y = value, col = variable), size = 1) +
  facet_wrap(~ ticker, scales = "free", nrow = 2) +
  geom_abline(slope = 0, intercept = 0, linetype = 2) +
  labs(y = "borrow rate", color = "three borrow rate")

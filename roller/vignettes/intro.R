## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library("roller")

## ------------------------------------------------------------------------
# Let's simulate a fair coin!
fair_coin <- device(sides = c("top", "bottom"), prob = c(0.5, 0.5))
fair_coin

## ------------------------------------------------------------------------
# Now, we want to create a device that has 4 facets named 'a', 'b', 'c', and 'd' with probabilities 0.2, 0.7, 0.05, 0.05
weird_device <- device(sides = c('a', 'b', 'c', 'd'), prob = c(0.2, 0.7, 0.05, 0.05))
weird_device

## ------------------------------------------------------------------------
#Let's now try to toss 'fair_coin' 17 times using roll().
coin_17 <- roll(fair_coin, 17)
coin_17


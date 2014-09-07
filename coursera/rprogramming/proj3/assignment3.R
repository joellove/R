## 1. Plot the 30-day mortality rates for heart attack
outcome <- read.csv("outcome-of-care-measures.csv", colClasses="character")
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])

## 2. Finding the best hospital in a state

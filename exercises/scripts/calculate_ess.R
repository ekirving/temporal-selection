#!/usr/bin/env Rscript

library(coda)

# load the model parameters
param <- read.delim("exercises/horse-MC1R.param")

# discard the first 500 observations as a burn-in
param.burn <- param[-c(1:500),]

# calculate the ESS for the five parameters of interest
effectiveSize(param.burn[c("lnL", "pathlnL", "alpha1", "alpha2", "age")])

library(testthat)
# load necessary packages
library(geodist)
library(dplyr)

# source local functions
source("src/R/util/sourceFunctions.R")
sourceFunctions("src/R")

# load data
load("pub/main.RData")
load("data/ships.RData")
load("data/cleanShips.RData")
load("data/cleanShipTypeName.RData")

test_dir("tests/testthat")

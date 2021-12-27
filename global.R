# load necessary packages
library(shiny)
library(shiny.semantic)
library(dplyr)
library(leaflet)

# source local functions
source("src/R/util/sourceFunctions.R")
sourceFunctions("src/R/util")
sourceFunctions("src/R/app")

# load app data
load("pub/main.RData")

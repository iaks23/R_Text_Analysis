################ Clearing everything ################

rm(list = ls())

################ Loading Packages ################
library(here)
library(tidyverse) 
library(ggplot2)
library(janitor)
library(dplyr)
library(RColorBrewer)
library(tm) # for text mining
library(SnowballC) # for text stemming
library(wordcloud) # word-cloud generator 
library(syuzhet) # for sentiment analysis
library(gridExtra)

#Loading the dataset
getwd()
setwd("/Users/akshayaparthasarathy/Desktop/WORK/R_Text_Analysis/Dataset")
dset <- read_csv("regrets.csv")

View(dset)

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
head(dset)
summary(dset)

dset <- clean_names(dset)

############### Text Analysis ###################
#Splitting dataset into different age groups 

dset_young <- dset %>% filter(age >= 5 & age < 25)
dset_mid <- dset %>% filter(age >= 25 & age < 50)
dset_old <- dset %>% filter(age>=50 & age < 76)

#Alternatively, we can split based on gender
dset_f <- dset %>% filter(gender=="F")
dset_m <- dset %>% filter(gender=="M")

#Working with required columns for text analysis
dset_analysis <- dplyr::select(dset, c('regret'))
#Converting Dataframe into a Text Corpse
TextDoc <- Corpus(VectorSource(dset_analysis))
head(dset_analysis)
#Replacing : - and , with space
toSpace <- content_transformer(function(x , pattern) gsub(pattern," ", x))
TextDoc <- tm_map(TextDoc, toSpace, ",")
TextDoc <- tm_map(TextDoc, toSpace, "\"")
TextDoc <- tm_map(TextDoc, toSpace, "-")

#Convert all text to lowercase
TextDoc <- tm_map(TextDoc, content_transformer(tolower))

#Remove punctuations
TextDoc <- tm_map(TextDoc, removePunctuation)

#Eliminate extra white spaces
TextDoc <- tm_map(TextDoc, stripWhitespace)

TextDoc <- tm_map(TextDoc, removeWords, c("that","the","and","not","when","was","with","for","regrets","regret"))


#Building the term-document matric
TextDoc_tdm <- TermDocumentMatrix(TextDoc)
dtm_m <- as.matrix(TextDoc_tdm)

#Sort by decreasing value of Freq
dtm_v <- sort(rowSums(dtm_m), decreasing=TRUE)
dtm_d <- data.frame(word = names(dtm_v), freq=dtm_v)

#Display top 10
head(dtm_d, 10)

#generate word cloud
set.seed(1234)
wordcloud(words = dtm_d$word, freq = dtm_d$freq, min.freq = 1,
          max.words=100, random.order=FALSE, rot.per=0.40, 
          colors=brewer.pal(8, "BuPu"))



#Sentiment Analysis

#Performing emotion classification 
dset <- get_nrc_sentiment(dset$regret)
head(dset,10)
nrow(dset)
td <- data.frame(t(dset))
#Computing column sums for each individual row and each level
td_new <- data.frame(rowSums(td[1:71]))
#Data cleaning and transformation
names(td_new)[1] <- "count"
td_new <- cbind("Sentiment" = rownames(td_new), td_new)
rownames(td_new) <- NULL
td_new2<- td_new[1:8,]



#Plot One - count of words associated with each sentiment
quickplot(Sentiment, data=td_new2, weight=count, geom="bar", fill=Sentiment, ylab="count")+ggtitle("Regret Sentiments")



#Plot two - count of words associated with each sentiment, expressed as a percentage
barplot(
  sort(colSums(prop.table(dset[, 1:8]))), 
  horiz = TRUE, 
  cex.names = 0.7, 
  las = 1, 
  main = "Emotions in Text", xlab="Percentage"
)


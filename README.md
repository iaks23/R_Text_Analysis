[![star-useful](https://img.shields.io/badge/🌟-If%20useful-red.svg)](https://shields.io) 
[![view-repo](https://img.shields.io/badge/View-Repo-blueviolet)](https://github.com/iaks23?tab=repositories)
[![view-profile](https://img.shields.io/badge/Go%20To-Profile-orange)](https://github.com/iaks23) 

# R Text Analysis 📑

> Text Analysis performed on a custom dataset using RStudio. 

## Table of Contents 🕹

* [The Dataset](#dataset)
* [Pre-Requisites](#requisites)
* [Text Analysis](#analysis)


# 📂 The Dataset <a name='dataset'></a>

### What is your biggest regret? 

The idea for this project sprung from a popular [YouTube video](https://www.youtube.com/watch?v=N8i6rUL4UIY) by Glamour. People between the ages of 5 and 75 were asked a question about their biggest regret. 

![Screenshot](https://github.com/iaks23/R_Text_Analysis/blob/main/images/screenshot.png)

In order to convert the video into a workable dataset, I transcribed the responses provided by the individuals into an Excel sheet, which was then exported as a CSV file. 

The resulting CSV file contained 3 columns, age, gender, and the response and 75 rows. 

|Age|Regret|Gender|
|---|---|---|
|5|"I went to the play ground and I want to go again today"|F|

# 🚨 Pre-Requisites <a name='requisites'></a>

The entire code is done using R and [RStudio](https://www.rstudio.com). More details about necessary libraries can be found in the code, which remaind the same for most text analysis and sentiment analysis. 

* [SnowballC](https://cran.r-project.org/web/packages/SnowballC/index.html): An R interface to the C 'libstemmer' library that implements Porter's word stemming algorithm for collapsing words to a common root to aid comparison of vocabulary. 
* [wordcloud](https://cran.r-project.org/web/packages/wordcloud/index.html): Functionality to create pretty word clouds, visualize differences and similarity between documents, and avoid over-plotting in scatter plots with text.
* [syuzhet](https://cran.r-project.org/web/packages/syuzhet/index.html): Extracts sentiment and sentiment-derived plot arcs from text using a variety of sentiment dictionaries conveniently packaged for consumption by R users. 

# 📊 Text Analysis <a name='analysis'></a>

For the prupose of this project and due to the limited amount of data available, I have performed text analysis on the entire dataset. Depedning on the size, type, and genre of dataset at hand text analysis can be performed by splitting the data into personalized categories (eg: age groups, gender, genre etc.) 

The final results produced include a wordcloud of the most frequently appearing terms in the term document matrix as well as a sentiment analysis graphh which shows the percentage of occurence of the 8 most common emotions. 

To read more details about NLP/ Text Analysis in R, please refer the article [here](https://www.red-gate.com/simple-talk/databases/sql-server/bi-sql-server/text-mining-and-sentiment-analysis-with-r/)

-----
© Akshaya Parthasarathy, 2022

Feedback is always welcome, drop a message on

[![LINKEDIN](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/akshaya-parthasarathy23)
[![INSTAGRAM](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/aks_sarathy/)
[![REDDIT](https://img.shields.io/badge/Reddit-FF4500?style=for-the-badge&logo=reddit&logoColor=white)](https://www.reddit.com/user/longstoryshort_)



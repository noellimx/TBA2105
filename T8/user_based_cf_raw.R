#Ex 62f217738b1e5a10a4ba2aed
#read https://cran.r-project.org/web/packages/recommenderlab/vignettes/recommenderlab.pdf for more details

library(recommenderlab)

#load movielens dataset
data("MovieLense")

#b)
#convert MovieLense to data.frame type to see the list of ratings
#Complete implementation...
movieLenseTransactions <-


View(movieLenseTransactions)

#convert MovieLense to matrix type to see the list of ratings
#Complete implementation...
movieLenseMat <-


View(movieLenseMat)


#c)
#Use the [ ] indexing notations (used for the case of dataframes) to divide
#MovieLense into testing and training set:
#make the first 2 rows the testing data
#and the remaining rows the training data
#Complete implementation...
test <-
train <-


#if we want to view the data we could do this:
library(dplyr)
test %>% as("matrix") %>% View()
train %>% as("matrix") %>% View()


#d)
#Generate a UBCF model using the Recommender() function and the training dataset
#Complete implementation...
model <-


#e)
#Generate the top 10 predictions of each of the testing data instance using the 
#model and predict()
#Complete implementation...
recommendations <-


#convert it into a list to be able to view it
recommendationsList <- as(recommendations, "list")
recommendationsList

#f)
#if we want to see the predicted ratings (of the testing dataset), we can supply 
#the type="ratingMatrix" argument to the predict() function.
#Complete implementation...
recommendationsRatings <-


recommendationsRatings <- as(recommendationsRatings, "matrix")
View(recommendationsRatings)

#g)
#It is also possible to supply our own parameters. For example we want:
#5 nearest neighbors
#cosine similarity
#normalization by centering the data
#we can specify param=list(normalize = "center", method="Cosine",nn=5) to the
#Recommender() function
#Try generate a new model (model1) with the above parameters
model1 <-





#suppose we have a csv of utility matrix form
mydata <- read.csv("movielense.csv")
test1 <- mydata[1:2,]
train1 <- mydata[3:nrow(mydata),]

test1 <- as(test1, "matrix")
train1 <- as(train1, "matrix")

#need to convert to realRatingMatrix form for it to work with recommenderlab
test.matrix <- as(test1,"realRatingMatrix")
train.matrix <- as(train1,"realRatingMatrix")

#h)
#Generate a UBCF model using the Recommender() function and train.matrix
#Complete implementation...
model2 <-


#Generate the top 10 predictions of test.matrix using model2 and predict()
#Complete implementation...
recommendations2 <-


recommendationsList2 <- as(recommendations2, "list")
recommendationsList2

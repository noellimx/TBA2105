#Ex 62f217738b1e5a10a4ba2aed
#read https://cran.r-project.org/web/packages/recommenderlab/vignettes/recommenderlab.pdf for more details

library(recommenderlab)

#load movielens dataset
ml <-  data("MovieLense")

#b)
#convert MovieLense to data.frame type to see the list of ratings
#Complete implementation...
movieLenseTransactions <- as(MovieLense,"data.frame")
movieLenseMat <- as(MovieLense,"matrix")

test <- MovieLense[1:2,]

train <- MovieLense[3:nrow(MovieLense),]

test_real_rating <- as(test,"realRatingMatrix")
test.matrix <- test_real_rating
train_real_rating <- as(train, "realRatingMatrix")
model <- Recommender(train, "UBCF")

recommendations <- recommenderlab::predict(model,test,n=10)
recommendationsList <- as(recommendations, "list")

recommendationsRatings <-recommenderlab::predict(model,test,type="ratingMatrix",n=10)
recommendationsRatings <- as(recommendationsRatings, "matrix")


model1 <- Recommender(train, "UBCF", parameter = list(normalize = "center", method="Cosine",nn=5))




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
model2 <- Recommender(train.matrix, "UBCF")
  
  
  #Generate the top 10 predictions of test.matrix using model2 and predict()
  #Complete implementation...
  recommendations2 <- recommenderlab::predict(model2,test.matrix,n=10)
  
  
  recommendationsList2 <- as(recommendations2, "list")
recommendationsList2


  

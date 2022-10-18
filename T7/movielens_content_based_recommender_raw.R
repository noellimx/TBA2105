#Ex 62f217738b1e5a10a4ba2ae0
#install and load the recommenderlab package
library(recommenderlab)

#load movielens dataset
data("MovieLense")

#see a list of features for each movie
# c)
View(MovieLenseMeta)

data <- MovieLenseMeta

#remove the url column from data
data$url <- NULL

#Make the title column the row names of the data and remove the title column
rownames(data) <- data$title
data$title <- NULL


#Note: for the purpose of autograding, do not reuse variables

#f)
#Complete this function that will take in a vector of movie title and return 
#a vector of the top 10 most similar movies to the preference
question_f <- function(preference){
  #First transpose the data and obtain the correlation matrix of the movies
  #Complete implementation...
  dataT <-
  cor_mat <-

  
  #Obtain the row in cor_mat that matches preference
  #Complete implementation...
  cor_with_preference <-

  
  #Filter out this movie preference from cor_with_preference since correlation 
  #with itself will always be 1
  #Similar to column names and row names for data frames, it is also possible to
  #have names for the items of a vector using the names() function
  #Complete implementation...
  cor_without_preference <-

  
  #sort cor_without_preference and obtain the top 10 most similar items
  #Complete implementation...

  
  return (top10MostSimilar)
}
question_f("Toy Story (1995)")


#g)
#Complete this function that will take in a vector of movie title
#and return a vector of the top 10 most similar movies to the preferences
question_g <- function(preferences){
  #first combine the 3 vectors of features into a data frame named preference_vectors
  #Complete implementation...
  preference_vectors <-

  
  #then average each column to return a combined vector
  #Complete implementation...
  combine_preference_vector <-

  
  #first combine combine_preference_vector and data by row, making 
  #combine_preference_vector the first row and then transpose this dataframe
  #Complete implementation...
  data1T <-

  
  #after generating the correlation matrix, obtain the correlation values
  #of the first row (i.e. the combine_preference_vector)
  cor_mat <- cor(data1T)
  correlation_values <- cor_mat[,1]
  
  #ignore the first entry since it is the correlation with the preference
  correlation_values <- correlation_values[2:length(correlation_values)]

  #we probably should also ignore the movies in the preferences
  for (i in 1:length(preferences)){
    correlation_values <- correlation_values[names(correlation_values) != preferences[i]]
  }
  
  #using correlation_values obtain top10MostSimilar
  #Complete implementation...

  
  return (top10MostSimilar)
}

preferences <- c("Star Wars (1977)", "Stargate (1994)", "Men in Black (1997)")
# question_g(preferences)

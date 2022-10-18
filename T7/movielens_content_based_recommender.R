# Ex 62 f217738b1e5a10a4ba2ae0
# install and load the recommenderlab package
library(recommenderlab)

# load movielens dataset
data("MovieLense")

# see a list of features
# for each moviex
# c)

View(MovieLenseMeta)

data <- MovieLenseMeta

data$url <- NULL

# Make the title column the row names of the data and remove the title column
rownames(data) <- data$title
data$title <- NULL


# f)
# Complete this function that will take in a vector of movie title and return
# a vector of the top 10 most similar movies to the preference
question_f <- function(preference) {
  # First transpose the data and obtain the correlation matrix of the movies
  # Complete implementation...
  dataT <- t(data)
  cor_mat <- cor(dataT)

  cor_with_preference <- cor_mat[preference, ]

  cor_without_preference <- cor_with_preference
  cor_without_preference2 <- cor_without_preference[!names(cor_without_preference) %in% c(preference)]

  cor_without_preference2 <- sort(cor_without_preference2, decreasing = TRUE)

  top10MostSimilar <- names(cor_without_preference2[1:10])

  return(top10MostSimilar)
}

preference <- "Toy Story (1995)"
question_f(preference)
###




####

foo <- function(preferences) {
  preference_vectors <- data[preferences, ]
  print("preference_vectors")
  print(preference_vectors)

  # then average each column to return a combined vector
  # Complete implementation...

  combine_preference_vector <- colMeans(preference_vectors[sapply(preference_vectors, is.numeric)])
  data1 <- rbind(data, combine_preference_vector)


  return(data1)
}
# g)
# Complete this function that will take in a vector of movie title
# and return a vector of the top 10 most similar movies to the preferences
question_g <- function(preferences) {
  # first combine the 3 vectors of features into a data frame named preference_vectors
  # Complete implementation...


  preference_vectors <- data[preferences, ]
  print("preference_vectors")
  print(preference_vectors)

  # then average each column to return a combined vector
  # Complete implementation...

  combine_preference_vector <- colMeans(preference_vectors[sapply(preference_vectors, is.numeric)])
  data1 <- rbind(data, combine_preference_vector)

  View(data1)
  data1T <- t(data1)
  cor_mat <- cor(data1T)


  correlation_values <- cor_mat[, 1]

  # ignore the first entry since it is the correlation with the preference
  correlation_values <- correlation_values[2:length(correlation_values)]

  print("2:")

  # we probably should also ignore the movies in the preferences
  correlation_values <- correlation_values[!names(correlation_values) %in% preference_vectors]


  # using correlation_values obtain top10MostSimilar
  # Complete implementation...
  correlation_values <- sort(correlation_values, decreasing = TRUE)

  View(correlation_values[1:10])
  top10MostSimilar <- names(correlation_values[1:10])

  return(top10MostSimilar)
}


preferences <- c("Star Wars (1977)", "Stargate (1994)", "Men in Black (1997)")
l <- question_g(preferences)
foo_result <- foo(preferences)
View(foo_result)

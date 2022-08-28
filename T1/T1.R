#Ex 62f217738b1e5a10a4ba2ab8
#a) 
#Load the dplyr and ggplot2 packages
#load stats library first to prevent method conflict between stats and dplyr
library(stats)
library(dplyr)
library(ggplot2)


#b)
#assume that the dataset (googleplaystore.csv) is found in the 
#current working directory
#Load in dataset into a variable gplay and remove any rows 
#that contain NA values

#Complete implementation...
gplay <-



#c) 
#Apply string manipulation to the "Installs" column
#and convert the column to numeric form
#Hint: read up on gsub()

#Complete implementation...



#d)
#Read up on the ggplot2 cheatsheet
#https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf
#Try generate a scatterplot of Reviews (y-axis) vs Rating (x-axis)

question_d <- function(){
  #Complete implementation...

}
question_d()


#e)
#Enhance the plot from d) by performing a log transformation to the Reviews
#Hint: Take a look at the ggplot2 documentation - there is a function that 
#      can do that easily

question_e <- function(){
  #Complete implementation...

}
question_e()


#f)
#Add another dimension of information to the plot from e) by coloring the 
#scatterplot by Category

question_f <- function(){
  #Complete implementation...

}
question_f()


#g)
#this question will not be evaluated by autograder


#h)
#Using dplyr to filter gplay to return just the Paid apps

question_h <- function(){
  #Complete implementation...

  
  return(gplay_paid)
}
View(question_h())



#i)
#Use the group_by() and summarize() functions to obtain the mean rating (meanRating) and
#mean number of reviews (meanReviews)
#The output should be a tibble with 3 columns: Category, meanRating, meanReviews

question_i <- function(){
  #Complete implementation...

  
  return(gplay_summary)
}
View(question_i())


#j)
#Use ggplot to plot a bar chart results from i) (particularly meanRating vs Category)
#making the meanRating the y-axis and Category the x-axis
#you should color the bars with the meanRating value
#you should also rotate x-axis 90degrees

question_j <- function(){
  #Complete implementation...

}
question_j()

#-----------------

#k)
#Generate a regression model (model1) using Rating as the response and the 
#Reviews and Installs as the predictors

#Complete implementation...

summary(model1)

#l)
#Generate a histogram that looks like the figure

question_l <- function(){
  #Complete implementation...

}
question_l()

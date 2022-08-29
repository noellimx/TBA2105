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
gplay <- read.csv("googleplaystore.csv")

#c) 
#Apply string manipulation to the "Installs" column
#and convert the column to numeric form
#Hint: read up on gsub()

#Complete implementation...
installs__ <- gsub(",", "", gplay_without_any_na$Installs)
gplay_col_clean_install <- as.numeric(gsub("\\+", "", installs__))
gplay_without_any_na$Installs <- gplay_col_clean_install

gplay_without_any_na$log10Reviews <- log10(gplay_without_any_na$Reviews)
gplay <- gplay_without_any_na

#d)
#Read up on the ggplot2 cheatsheet
#https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf
#Try generate a scatterplot of Reviews (y-axis) vs Rating (x-axis)

question_d <- function(){
  #Complete implementation...
  plot_gplay_y_Reviews_x_Rating <- ggplot(data = clean_gplay, aes(y = Reviews, x = Rating)) +
    geom_point()
}
question_d()

#e)
#Enhance the plot from d) by performing a log transformation to the Reviews
#Hint: Take a look at the ggplot2 documentation - there is a function that 
#      can do that easily

question_e <- function(){
  #Complete implementation...
  plot_gplay_y_logReviews_x_Rating <- ggplot(data = clean_gplay, aes(y = log10Reviews, x = Rating)) +
    geom_point()
}
question_e()
#f)
#Add another dimension of information to the plot from e) by coloring the 
#scatterplot by Category

question_f <- function(){
  #Complete implementation...
  plot_gplay_y_logReviews_x_Rating_fill_Category <- ggplot(data = clean_gplay, aes(y = log10Reviews, x = Rating, color = factor(Category))) +
    geom_point()
}
question_f()
#g)
#this question will not be evaluated by autograder
question_g <- function(){
  plot_gplay_y_logReviews_x_Rating_fill_Type <- ggplot(data = clean_gplay, aes(y = log10Reviews, x = Rating, color = factor(Type))) +
    geom_point()
}


#h)
#Using dplyr to filter gplay to return just the Paid apps

question_h <- function(){
  #Complete implementation...
  
  clean_gplay_only_paid <- filter(clean_gplay,Type=="Paid")
  clean_gplay_not_paid <- filter(clean_gplay,Type!="Paid")
  gplay_paid <- clean_gplay_only_paid
  return(gplay_paid)
}
View(question_h())

#i)
#Use the group_by() and summarize() functions to obtain the mean rating (meanRating) and
#mean number of reviews (meanReviews)
#The output should be a tibble with 3 columns: Category, meanRating, meanReviews

question_i <- function(){
  #Complete implementation...
  
  gplay_summary_by_category <- summarise(group_by(clean_gplay,Category),
                                         meanReviews = mean(Reviews),
                                         meanRating = mean(Rating)
  )
  
  gplay_summary <- gplay_summary_by_category
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
  plot_gplay_summary_by_category <- ggplot(data=filter(gplay_summary_by_category),aes(x=Category,y=meanRating,fill=Category,color=Category)) + geom_bar(stat="identity") + labs(x="Category",y="meanRating") + coord_flip()
  
}
question_j()

#k)
#Generate a regression model (model1) using Rating as the response and the 
#Reviews and Installs as the predictors

#Complete implementation...

linear_x_Reviews_Installs_y_Rating <-lm(Rating ~ Reviews+Installs,gplay_without_any_na)

model1 <- linear_x_Reviews_Installs_y_Rating
summary(model1)


#l)
#Generate a histogram that looks like the figure

question_l <- function(){
  #Complete implementation...
  plot_stacked_histogram_of_cat_by_rating <- ggplot(data=gplay_without_any_na,aes(x=Rating,fill=Type,color=Type)) + geom_histogram(binwidth=0.1,alpha=0.8)
  
}
question_l()







# Ex 62f217738b1e5a10a4ba2ab8
# a)
# Load the dplyr and ggplot2 packages
# load stats library first to prevent method conflict between stats and dplyr
library(stats)
library(dplyr)
library(ggplot2)


# b)
# assume that the dataset (googleplaystore.csv) is found in the
# current working directory
# Load in dataset into a variable gplay and remove any rows
# that contain NA values

# Complete implementation...
gplay <- read.csv("googleplaystore.csv", na.strings = c("NaN"))

gplay <- na.omit(gplay)

# c)
# Apply string manipulation to the "Installs" column
# and convert the column to numeric form
# Hint: read up on gsub()

# Complete implementation...
gplay$Installs <- as.numeric(gsub("\\+", "", gsub(",", "", gplay$Installs)))

# d)
# Read up on the ggplot2 cheatsheet
# https://raw.githubusercontent.com/rstudio/cheatsheets/master/data-visualization-2.1.pdf
# Try generate a scatterplot of Reviews (y-axis) vs Rating (x-axis)

question_d <- function() {
  # Complete implementation...
  plot_gplay_y_Reviews_x_Rating <- ggplot(data = gplay, aes(y = Reviews, x = Rating)) +
    geom_point()
  print(plot_gplay_y_Reviews_x_Rating)
}
question_d()


# e)
# Enhance the plot from d) by performing a log transformation to the Reviews
# Hint: Take a look at the ggplot2 documentation - there is a function that
#      can do that easily

question_e <- function() {
  # Complete implementation...
  plot_gplay_y_logReviews_x_Rating <- ggplot(data = gplay, aes(y = log10(gplay$Reviews), x = Rating)) +
    geom_point()
  print(plot_gplay_y_logReviews_x_Rating)
}
question_e()

# f)
# Add another dimension of information to the plot from e) by coloring the
# scatterplot by Category


question_f <- function() {
  # Complete implementation...
  plot_gplay_y_logReviews_x_Rating_fill_Category <- ggplot(data = gplay, aes(y = log10(gplay$Reviews), x = Rating, color = Category)) +
    geom_point()
  print(plot_gplay_y_logReviews_x_Rating_fill_Category)
}
question_f()

# g)
# this question will not be evaluated by autograder


# h)
# Using dplyr to filter gplay to return just the Paid apps

question_h <- function() {
  # Complete implementation...

  gplay_only_paid <- filter(gplay, Type == "Paid")
  gplay_not_paid <- filter(gplay, Type != "Paid")
  gplay_paid <- gplay_only_paid
  return(gplay_paid)
}
View(question_h())


# i)
# Use the group_by() and summarize() functions to obtain the mean rating (meanRating) and
# mean number of reviews (meanReviews)
# The output should be a tibble with 3 columns: Category, meanRating, meanReviews

question_i <- function() {
  # Complete implementation...
  gplay_summary_by_category <- summarise(group_by(gplay, Category),
    meanRating = mean(Rating),
    meanReviews = mean(Reviews)
  )


  gplay_summary <- gplay_summary_by_category
  return(gplay_summary)
}
View(question_i())



# j)
# Use ggplot to plot a bar chart results from i) (particularly meanRating vs Category)
# making the meanRating the y-axis and Category the x-axis
# you should color the bars with the meanRating value
# you should also rotate x-axis 90degrees

question_j <- function() {
  # Complete implementation...
  gplay_summary_by_category <- summarise(group_by(gplay, Category),
    meanRating = mean(Rating),
    meanReviews = mean(Reviews)
  )
  plot_gplay_summary_by_category <- ggplot(data = gplay_summary_by_category, aes(x = Category, y = meanRating, color = meanRating, fill = meanRating)) +
    geom_col() +
    labs(x = "Category", y = "meanRating") +
    theme(axis.text.x = element_text(angle = 90))
  print(plot_gplay_summary_by_category)
}
question_j()

#-----------------

# k)
# Generate a regression model (model1) using Rating as the response and the
# Reviews and Installs as the predictors

# Complete implementation...

linear_x_Reviews_Installs_y_Rating <- lm(Rating ~ Reviews + Installs, gplay)

model1 <- linear_x_Reviews_Installs_y_Rating
print(summary(model1))


# l)
# Generate a histogram that looks like the figure

question_l <- function() {
  # Complete implementation...
  plot_stacked_histogram_of_cat_by_rating <- ggplot(data = gplay, aes(x = Rating, fill = Type, color = Type)) +
    geom_histogram(binwidth = 0.1, alpha = 0.8)

  print(plot_stacked_histogram_of_cat_by_rating)
}
question_l()

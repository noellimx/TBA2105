# Ex 62f217738b1e5a10a4ba2a9e
# Do not use additional R packages when solving this exercise.
# a)
# assume that titanic.csv is in the current working directory
# load the titanic dataset into a variable called titanic
# do not put setwd() in your codes

# Complete implementation...
titanic <- read.csv("titanic.csv")


# b)
# obtain the number of records in the dataset
numRecords <- nrow(titanic)


# c)
# filter the dataset (using the dataframe indexing operator) to obtain
# a dataframe with only female passengers
femalePassengers <- titanic[titanic[5] == "female", ]



# d)
# what is the ratio of female passenger who survived over the total number
# of female passengers?
question_d <- function() {


  # Complete implementation...

  female_total <- nrow(femalePassengers)
  survived_flag <- 1
  female_survived <- nrow(femalePassengers[femalePassengers[2] == survived_flag, ])
  ratio <- female_survived / female_total
  print(ratio)
  return(ratio)
}

question_d()


# dataframes (contingency table)
print(ncol(iris)) # length is column
print(nrow(iris)) # nrow is row


# head rows
count_head <- 10
sample_head <- head(iris, count_head)
stopifnot(nrow(sample_head) == count_head)

# column head values
first_three_values_of_sepal_length <- iris$Sepal.Length[1:3]
stopifnot(length(first_three_values_of_sepal_length) == 3)

# column access

stopifnot(iris$Sepal.Length == iris[["Sepal.Length"]])

stopifnot(iris$Sepal.Length == iris[, 1])
# row access

count_head <- 1
sample_head <- head(iris, count_head)

sample_head_by_brackets <- iris[count_head, ]
stopifnot(sample_head == sample_head_by_brackets)

# grid access

sub_grid <- iris[1:2, 1:3]
stopifnot(nrow(sub_grid) == 2)
stopifnot(length(sub_grid) == 3)

# functional arrays

iris_2 <- iris
iris_2$Sepal.Length <- NULL # delete column

stopifnot(ncol(iris) == 5)
stopifnot(ncol(iris_2) == 4)

iris_2$SomeNewCol <- iris_2$Petal.Width * 2

stopifnot(ncol(iris_2) == 5)


SomeNewOrphanCol <- iris_2$Sepal.Width * 3

attached_col <- cbind(iris_2, SomeNewOrphanCol)
print(ncol(attached_col))
stopifnot(ncol(attached_col) == 6)


attached_row <- rbind(iris_2, c(1, 2, 3, "setosa", 2))

stopifnot(nrow(attached_row) - 1 == nrow(iris_2))

print(colnames(iris_2))

newcolnames <- c(
    "1",
    "2",
    "3",
    "4",
    "5"
)

colnames(iris_2) <- newcolnames
stopifnot(colnames((iris_2))[1] == "1")


# filter by column values

setosas <- iris[iris$Species == "setosa", ]
print(nrow(setosas))


# Dataframe Generation

col1 <- c("col1val1", "col1val2")
col2 <- c("col2val2", "col2val2")

mydata <- data.frame(col1, col2)
stopifnot(colnames(mydata)[1] == "col1")
stopifnot(colnames(mydata)[2] == "col2")

# Reading / Extracting
url_csv <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/01-01-2021.csv"

csv_data <- read.csv(url_csv)

wanted_columns <- c("Country_Region", "Confirmed", "Deaths")

csv_data_with_wanted_columns <- csv_data[1:10, wanted_columns]

setwd("~/")

write.csv(csv_data_with_wanted_columns, "dumb.csv") # comma delimited
write.table(csv_data_with_wanted_columns, "dumb.table") # space delimited




# value count
column_is_a_vector <- iris[, 1]
stopifnot(length(column_is_a_vector) == 150)

#Ex 62f217738b1e5a10a4ba2aa3
#a)
#assume that AutoInsurSweden.txt is in the current working directory
#load the AutoInsurSweden dataset into a variable called data using 
#read.table()
#make sure 2 headers (X, Y) are read in properly as the column names

#Complete implementation...
data <- read.table("AutoInsurSweden.txt",skip=10, header=TRUE)


#b)
#European countries often use comma to separate the integer
#from the decimal part
#read up on gsub() and try convert the Y column of data to 
#the proper numeric form

print(data)
print(class(data$Y)) # character
data$Y <- as.numeric(gsub(",",".", data$Y))
print(data)
print(class(data$Y))


model <- lm(X~Y,data)

print(summary(model))





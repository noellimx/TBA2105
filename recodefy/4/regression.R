#Ex 62f217738b1e5a10a4ba2aa3
#a)
#assume that AutoInsurSweden.txt is in the current working directory
#load the AutoInsurSweden dataset into a variable called data using 
#read.table()
#make sure 2 headers (X, Y) are read in properly as the column names

#Complete implementation...
data <-



#b)
#European countries often use comma to separate the integer
#from the decimal part
#read up on gsub() and try convert the Y column of data to 
#the proper numeric form
class(data$Y) # character

#Complete implementation...
data$Y <-


class(data$Y) # should be numeric

#c)
#keeping the original scale
#X = number of claims
#Y = total payment of all claims (thousands)
#generate a linear regression to predict the total payment

#Complete implementation...
model <-


#this should show the model details
summary(model)

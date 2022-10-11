#Ex 62f217738b1e5a10a4ba2ac9
#would need to first install the arules package
#install.packages('arules')
library(arules)

#a)
#Read up and use the read.transactions() function in the arules package to 
#read in the transaction from groceries.csv
#Complete implementation...
transactions <-


results <- summary(transactions)
results

#to access the fields programmatically, can call the slotNames() function
slotNames(results)


density <- slot(results, "density")
density

#b)
#Make use of the slot names of summary(transactions)to obtain Num_transaction 
#and Num_items and calculate the Total_Num_Of_Items_Purchased
question_b <- function(){
  #Complete implementation...
  numTransactions <-
  numItems <-

  totalNumberOfItemsPurchased <- density * numTransactions * numItems
  return (totalNumberOfItemsPurchased)
}
question_b()


#c)
#We should get the same result if we were to add up the number of different 
#k-itemsets from the 3rd section
question_c <- function(){
  #get the vector of possible k of k-itemsets
  possibleKValues <- rownames(slot(results, "lengths"))
  
  totalNumberOfItemsPurchased <- 0
  for (k in possibleKValues){
    #Complete implementation...
    #get size of each k-itemsets
    size <-

    
    totalNumberOfItemsPurchased <- totalNumberOfItemsPurchased + (size * as.integer(k))
  }
  return (totalNumberOfItemsPurchased)
}
question_c()


#d)
#Using the slot names we can also access other useful information
#get the S4 slotnames of the transactions object and try getting a vector of
#the unique items
question_d <- function(){
  #Complete implementation...
  items <-

  return (items) #should be a vector
}
question_d()


#we can also see the first 10 transaction using inspect()
inspect(transactions[1:10])

#or if we want to see all the transaction
df <- as(transactions, "data.frame")
View(df)

#we can also get a (sparse) matrix of the transaction 
#(table format)
mat <- as.matrix(slot(transactions, "data"))
View(mat)


#e)
#Use the read.transactions() function to read in the transactions from 
#bakery_1000_single.csv
#Complete implementation...
bakeryTransactions <-


inspect(bakeryTransactions[1:2])
#it should look like this
#    items     transactionID
#[1] {2,3,4,5} 1            
#[2] {1,2,5}   10


#not using read.transactions(), instead we cast an 
#existing DF to transactions type
#the foreign package provides other read.XXX functions
#for reading other types of datasets
library(foreign)
weather <- read.arff("weather.nominal.arff")
weatherTransactions <- as(weather, "transactions")



#f)
#use the apriori() function to generate the rules for the transactions object 
#with the following parameters:
#min support = 0.001
#min confidence = 0.8
#max length = 10 (i.e. only allow maximum of 10 items per itemset)
#Complete implementation...
rules <-


#can use inspect() to view the rules
inspect(rules[1:5])

#g)
#use the subset() function to filter the rules keeping only those rules with
#a lift of more than 5
#Complete implementation...
rulesFilteredByLift <- 


rulesFilteredByLift #should have 32 rules

#h)
#when we have a lot of rules, we might want to sort the rules by different conditions
#use the sort() function in arules to sort the rules (from question f) in 
#descending order by support
#Complete implementation...
sortedRulesBySupport <-


inspect(sortedRulesBySupport[1:3])
#can also sort by confidence and lift

#i)
#apriori() can also be used to generate the frequent itemsets by changing setting
#the target argument = "frequent itemsets". Generate the frequentItemsets using 
#the same parameters as question f and sort the results in descending order by support
#Complete implementation...
sortedFrequentItemsets <-



# Ex 62f217738b1e5a10a4ba2ac9
# would need to first install the arules package
# install.packages('arules')
library(arules)

# a)
# Read up and use the read.transactions() function in the arules package to
# read in the transaction from groceries.csv
# Complete implementation...
transactions <- read.transactions("groceries.csv", header = F, format = "basket", sep = ",")

results <- summary(transactions)

print(results)
# to access the fields programmatically, can call the slotNames() function
slotNames <- slotNames(results)

density <- slot(results, "density")
density

lengthSummary <- slot(results, "lengthSummary")
lengths_ <- slot(results, "lengths")

items_count <- 0

for (i in 1:length(lengths_)) {
  items_count <- items_count + i * lengths_[i]
}

# b)
# Make use of the slot names of summary(transactions)to obtain Num_transaction
# and Num_items and calculate the Total_Num_Of_Items_Purchased
question_b <- function() {
  # Complete implementation...
  
  dim_ <- slot(results, "Dim")
  numTransactions <- dim_[1]
  numItems <- dim_[2]

  totalNumberOfItemsPurchased <- density * numTransactions * numItems
  return(totalNumberOfItemsPurchased)
}
q_b <- question_b()


actual_length <- 43367
stopifnot(q_b == actual_length)

possibleKValues <- rownames(slot(results, "lengths"))
# c)
# We should get the same result if we were to add up the number of different
# k-itemsets from the 3rd section
question_c <- function() {
  # get the vector of possible k of k-itemsets
  print("---question_c---")

  totalNumberOfItemsPurchased <- 0
  for (k in possibleKValues) {
    # Complete implementation...
    # get size of each k-itemsets
    size <- as.numeric(lengths_[k])
    totalNumberOfItemsPurchased <- totalNumberOfItemsPurchased + (size * as.integer(k))
  }
  return(totalNumberOfItemsPurchased)
}

q_c <- question_c()

stopifnot(actual_length == q_c)

# d)
# Using the slot names we can also access other useful information
# get the S4 slotnames of the transactions object and try getting a vector of
# the unique items

question_d <- function () {
  
  bakery_map <- as(transactions,"matrix")
  items <- colnames(bakery_map)
  
  return(items)
}

q_d <- question_d()


print(q_d)

itemSummary <- slot(results, "itemSummary")
itemInfo <- slot(results, "itemInfo")



# e)
# Use the read.transactions() function to read in the transactions from
# bakery_1000_single.csv
# Complete implementation...
bakeryTransactions <- read.transactions("bakery_1000_single.csv", format = "single", header = TRUE, sep = ",", cols = c(1, 2))

library(foreign)

weather <- read.arff("weather.nominal.arff")
weather_tx <- as(weather,"transactions")
bakerydf <- as(bakeryTransactions, "data.frame")
print("----bakerydf----")

print(nrow(bakerydf))

rules <- apriori(data = bakerydf, parameter = list(supp = 0.001, conf = 0.8, maxlen = 10, target = "rules"))

rules_df <- as(rules,"data.frame")

View(rules_df)

rulesFilteredByLift <- subset(rules, subset = lift > 5)
View(as(rulesFilteredByLift,"data.frame"))
rulesFilteredByLift # should have 32 rules

sortedRulesBySupport <- sort(x = rulesFilteredByLift, by = "support", decreasing = TRUE)

inspect(sortedRulesBySupport[1:3])

sortedFrequentItemsets <- apriori(data = bakerydf, parameter = list(supp = 0.001, conf = 0.8, maxlen = 10, target = "frequent itemsets"))

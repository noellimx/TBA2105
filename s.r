sortedFrequentItemsets <- apriori(data = sale_transactions_cleaned_factors_only, parameter = list(supp = 0.05, conf = 0.8, maxlen = 10, target = "frequent itemsets"))

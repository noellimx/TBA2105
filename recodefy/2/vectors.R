# Ex 62f217738b1e5a10a4ba2a9a
# Generate a vector of 100 random numbers using rnorm()
# (keeping the default arguments of mean = 0 and sd = 1)
# and call the sample() function to get a sample of 10 numbers
# and return this vector. You should set the seed value to  123
# to ensure that the results are always the same.

ans <- function() {
  set.seed(123)
  count_set <- 100
  set_ <- rnorm(count_set)

  count_subset <- 10
  subset_ <- sample(set_, count_subset)
  # Complete implementation...

  return(subset_)
}
ans()

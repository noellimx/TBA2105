# Ex 62f217738b1e5a10a4ba2a97
# Read up on the `rnorm()` function and try to generate a random number
# with **mean of 10** and **standard deviation of 3**.
# Assign the output to a variable named `n1`

ans <- function() {
  # enter the codes in here
  arr <- rnorm(10, 10, 3)
  print(arr)
  stopifnot(length(arr) == 10)
}
ans()

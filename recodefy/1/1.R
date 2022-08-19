
# basic type and variable initialization
x <- 1
x <- 2

stopifnot(x == 2)
stopifnot(class(x) == "numeric")

x <- as.integer(x)

stopifnot(x == 2)

stopifnot(class(0.2) == "numeric")

# basic arithmetic and conditionals

stopifnot(5^2 + 2 == 27)

stopifnot(!(TRUE == FALSE))
stopifnot(!(T == F))


print(class(0.2 * 3))
print(class(0.6))
print((0.2 * 3) == 0.6)

print(format(0.6, scientific = TRUE))
print(format((0.2 * 3), scientific = TRUE))
stopifnot(0.6 == 0.6)
stopifnot(!(0.2 * 3) == 0.6) # float comparison


stopifnot(log(1000, 10) == 3)
print("---end---")

# branches and loops

p <- 10

# NOTE: conditionals syntax must be written in a single line
if (p > 1) {
  # do something
} else if (p < 1) {
  # do something
} else {
  # do something
}

start_inclusive <- 1
end_inclusive <- 3

for (i in start_inclusive:end_inclusive) {
  stopifnot(start_inclusive <= i)
  stopifnot(i <= end_inclusive)
}

# lambda

lambda_ <- function(arg1, arg2) {
  arg1
  arg2
}

lambda_(1, 2)

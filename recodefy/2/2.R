print("in 2")

# vectors
vector_of_numeric <- c(1, 2, 3, 4)
vector_of_booleans <- c(T, FALSE, F, TRUE)

stopifnot(class(vector_of_numeric) == "numeric")
vector_of_transformed_integer <- as.integer(vector_of_numeric)
stopifnot(class(vector_of_transformed_integer) == "integer")
stopifnot(class(vector_of_booleans) == "logical")

vector_typed_coerced <- c(1, T, "some", 0.2)
print(class(vector_typed_coerced) == "character")


# seeds and vector generation

s <- set.seed(1)
stopifnot(class(s) == "NULL")
vector_with_seed_1 <- rnorm(19)
s <- set.seed(2)
vector_with_seed_2 <- rnorm(19)


stopifnot(1:3 == 1:3)

vector_int_by_range_verbose <- c(1:3)
vector_int_by_range <- 1:3
stopifnot(vector_int_by_range_verbose == vector_int_by_range)

vector_numeric_by_range_and_step <- seq(1, 3, 0.5)
stopifnot(length(vector_numeric_by_range_and_step) == 5)

repeat_count <- 10
vector_by_repeat_elements <- rep(x = 10, repeat_count)
stopifnot(length(vector_by_repeat_elements) == repeat_count)

# indexing and index access
vector_123 <- 11:20
first_index <- 1

print(vector_123[first_index] == 11)

indexes_to_read <- c(2, 4, 6)
print(c(12, 14, 16) == vector_123[indexes_to_read])
indexes_to_read_range <- c(1:5)
print(vector_123[indexes_to_read_range] == c(11, 12, 13, 14, 15))

indexes_to_read_by_flag <- c(T, F)

stopifnot(length(vector_123[indexes_to_read_by_flag]) == 5)
# read flags will be repeated if indexes to read is less than length of source


# use negative value of index to omit element from index
indexes_to_omit <- -c(1, 2, 3)
stopifnot(length(vector_123[indexes_to_omit]) == 7)

# value assignment to index
vector_123[10] <- 999
stopifnot(vector_123[10] == 999)

vector_123[c(1, 2)] <- 282

stopifnot(vector_123[1] == 282)
stopifnot(vector_123[2] == 282)

# map



should_be283 <- only_282 + 1
stopifnot(should_be283[1] == 283)

should_be283_flags <- should_be283 == 283
stopifnot(c(T, T) == should_be283_flags)


# filter

only_282 <- vector_123[vector_123 == 282]
stopifnot(length(only_282) == 2)

# zip

z <- c(1) + c(2)
stopifnot(z[1] == 3)

stopifnot(sum(z) == 3)
stopifnot(max(z) == 3)

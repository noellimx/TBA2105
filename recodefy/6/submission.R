# Ex 62f217738b1e5a10a4ba2aab
# Using the iris dataset

# For simplicity, we will just work with the Petal.Length
# and Petal.Width only
irisPetal <- iris[, c("Petal.Length", "Petal.Width")]
print(irisPetal)


seedValue <- 1
set.seed(seedValue)

colorMap <- c("red", "green", "blue")

randomIndexes <- sample(c(1, 2, 3), size = nrow(irisPetal), replace = TRUE)


colors <- colorMap[randomIndexes]

plot(irisPetal, col = colors)


rrr <- colors == "red"
redDF1 <- irisPetal[rrr, ]

ggg <- colors == "green"
greenDF1 <- irisPetal[ggg, ]

bbb <- colors == "blue"
blueDF1 <- irisPetal[bbb, ]


# c)
# Using each of the dataframes (redDF, blueDF, greenDF), obtain the centroid value
# for the red, green, blue points
# The centroid value is arithmetic mean position of the 2 columns
# Complete implementation...
meanPetalLengthForRed1 <- mean(redDF1$Petal.Length)
meanPetalWidthForRed1 <- mean(redDF1$Petal.Width)
meanPetalLengthForGreen1 <- mean(greenDF1$Petal.Length)
meanPetalWidthForGreen1 <- mean(greenDF1$Petal.Width)
meanPetalLengthForBlue1 <- mean(blueDF1$Petal.Length)
meanPetalWidthForBlue1 <- mean(blueDF1$Petal.Width)

points(x = meanPetalLengthForRed1, y = meanPetalWidthForRed1, col = "red", pch = 19, lwd = 5)
points(x = meanPetalLengthForGreen1, y = meanPetalWidthForGreen1, col = "green", pch = 19, lwd = 5)
points(x = meanPetalLengthForBlue1, y = meanPetalWidthForBlue1, col = "blue", pch = 19, lwd = 5)

colorIter1 <- rep("white", nrow(irisPetal))

for (i in 1:nrow(irisPetal)) {
  row_ <- irisPetal[i, ]
  row_x <- row_$Petal.Length
  row_y <- row_$Petal.Width


  red_centroid_to_x <- meanPetalLengthForRed1 - row_x
  red_centroid_to_y <- meanPetalWidthForRed1 - row_y
  green_centroid_to_x <- meanPetalLengthForGreen1 - row_x
  green_centroid_to_y <- meanPetalWidthForGreen1 - row_y
  blue_centroid_to_x <- meanPetalLengthForBlue1 - row_x
  blue_centroid_to_y <- meanPetalWidthForBlue1 - row_y

  euclid_dist_red <- sqrt(red_centroid_to_x^2 + red_centroid_to_y^2)
  euclid_dist_green <- sqrt(green_centroid_to_x^2 + green_centroid_to_y^2)
  euclid_dist_blue <- sqrt(blue_centroid_to_x^2 + blue_centroid_to_y^2)

  euclid_dists <- c(euclid_dist_red, euclid_dist_green, euclid_dist_blue)
  min_pos <- which.min(euclid_dists)

  to_recolor_as <- colorMap[min_pos]
  colorIter1[i] <- to_recolor_as
}

plot(irisPetal, col = colorIter1)

rrr <- colorIter1 == "red"


ggg <- colorIter1 == "green"


bbb <- colorIter1 == "blue"


redDF2 <- irisPetal[rrr, ]
greenDF2 <- irisPetal[ggg, ]
blueDF2 <- irisPetal[bbb, ]


meanPetalLengthForRed2 <- mean(redDF2$Petal.Length)
meanPetalWidthForRed2 <- mean(redDF2$Petal.Width)
meanPetalLengthForGreen2 <- mean(greenDF2$Petal.Length)
meanPetalWidthForGreen2 <- mean(greenDF2$Petal.Width)
meanPetalLengthForBlue2 <- mean(blueDF2$Petal.Length)
meanPetalWidthForBlue2 <- mean(blueDF2$Petal.Width)
# add the centroid points
points(x = meanPetalLengthForRed2, y = meanPetalWidthForRed2, col = "red", pch = 19, lwd = 5)
points(x = meanPetalLengthForGreen2, y = meanPetalWidthForGreen2, col = "green", pch = 19, lwd = 5)
points(x = meanPetalLengthForBlue2, y = meanPetalWidthForBlue2, col = "blue", pch = 19, lwd = 5)


colorIter2 <- rep("white", nrow(irisPetal))
for (i in 1:nrow(irisPetal)) {
  row_ <- irisPetal[i, ]
  row_x <- row_$Petal.Length
  row_y <- row_$Petal.Width


  red_centroid_to_x <- meanPetalLengthForRed2 - row_x
  red_centroid_to_y <- meanPetalWidthForRed2 - row_y
  green_centroid_to_x <- meanPetalLengthForGreen2 - row_x
  green_centroid_to_y <- meanPetalWidthForGreen2 - row_y
  blue_centroid_to_x <- meanPetalLengthForBlue2 - row_x
  blue_centroid_to_y <- meanPetalWidthForBlue2 - row_y

  euclid_dist_red <- sqrt(red_centroid_to_x^2 + red_centroid_to_y^2)
  euclid_dist_green <- sqrt(green_centroid_to_x^2 + green_centroid_to_y^2)
  euclid_dist_blue <- sqrt(blue_centroid_to_x^2 + blue_centroid_to_y^2)

  euclid_dists <- c(euclid_dist_red, euclid_dist_green, euclid_dist_blue)
  min_pos <- which.min(euclid_dists)

  to_recolor_as <- colorMap[min_pos]
  colorIter2[i] <- to_recolor_as
}

plot(irisPetal, col = colorIter2)

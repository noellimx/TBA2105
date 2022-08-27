#Ex 62f217738b1e5a10a4ba2aab
#Using the iris dataset

#For simplicity, we will just work with the Petal.Length 
#and Petal.Width only
irisPetal <- iris[,c("Petal.Length", "Petal.Width")]
irisPetal


#Set the seed value in order to replicate the exact result
#since K-means involve randomization
set.seed(1)


#We know that K should be 3 in this case so we use 3 colors to denote
#each cluster
#colorMap will be indexed to generate the initial colors later
colorMap <- c("red", "green", "blue")


#a)
#We will first generate a vector of random integers/indexes (1, 2, 3) that
#will be used to index colorMap in order so that we will eventually get
#a vector of random colors (one for each data instance)
#to generate the random indexes, it turns out that we could use sample() and 
#specify the argument replace = T

#Generate the vector of integers containing (1, 2, 3) with same size as the 
#number of data instance in the irisPetal dataset
#Complete implementation...
randomIndexes <-


#this should look like
#"blue" "green" "green" "red ....
#a total of 150 colors (since there are 150 instances in the irisPetal dataset)
colors <- colorMap[randomIndexes]

#plot the points
#the initial clusters are random since we randomly color the points
plot(irisPetal, col=colors)


#b)
#Obtain 3 dataframes (redDF1, blueDF1, greenDF1) for the 1st iteration with the 
#rows that are currently colored red, blue, green respectively
#Complete implementation...
redDF1 <- 
greenDF1 <- 
blueDF1 <- 



#c)
#Using each of the dataframes (redDF, blueDF, greenDF), obtain the centroid value
#for the red, green, blue points
#The centroid value is arithmetic mean position of the 2 columns
#Complete implementation...
meanPetalLengthForRed1 <-
meanPetalWidthForRed1 <-
meanPetalLengthForGreen1 <- 
meanPetalWidthForGreen1 <- 
meanPetalLengthForBlue1 <- 
meanPetalWidthForBlue1 <- 



#add the 3 centroid values onto the scatterplot
points(x=meanPetalLengthForRed1, y=meanPetalWidthForRed1, col="red", pch=19, lwd=5)
points(x=meanPetalLengthForGreen1, y=meanPetalWidthForGreen1, col="green", pch=19, lwd=5)
points(x=meanPetalLengthForBlue1, y=meanPetalWidthForBlue1, col="blue", pch=19, lwd=5)


#currently the 3 centroid values are quite close together but they will become
#more distinct after the 1st iteration


#d)
#Go through all the points in irisPetal and determine whether each point is 
#closer to the red/blue/green centroid
#using the Euclidean distance formula
#https://en.wikipedia.org/wiki/Euclidean_distance

#We will create another colors vector (colorIter1) to capture the new colors.
#For each point, we modify the corresponding color of the point in colorIter1 
#to the color of the closest centroid
colorIter1 <- rep("red", nrow(irisPetal))
for (i in 1:nrow(irisPetal)){
#Complete implementation...

}

#Should now see that the points are grouped into 3 distinct clusters.
#The number of points for each cluster might look disproportional for now 
#but after we run through more iteration, it should look better.
plot(irisPetal, col=colorIter1)


#e)
#repeat what we did in b) & c)
#Complete implementation...
redDF2 <- 
greenDF2 <- 
blueDF2 <- 
meanPetalLengthForRed2 <-
meanPetalWidthForRed2 <-
meanPetalLengthForGreen2 <- 
meanPetalWidthForGreen2 <- 
meanPetalLengthForBlue2 <- 
meanPetalWidthForBlue2 <- 


#add the centroid points 
points(x=meanPetalLengthForRed2, y=meanPetalWidthForRed2, col="red", pch=19, lwd=5)
points(x=meanPetalLengthForGreen2, y=meanPetalWidthForGreen2, col="green", pch=19, lwd=5)
points(x=meanPetalLengthForBlue2, y=meanPetalWidthForBlue2, col="blue", pch=19, lwd=5)


#f)
#repeat what we did in d)
colorIter2 <- rep("red", nrow(irisPetal))
for (i in 1:nrow(irisPetal)){
  #Complete implementation...

}

#Should now see that the distribution of the points is much better 
#compared to colorIter1
plot(irisPetal, col=colorIter2)


#In real life, we will repeat this process until the coloring are more or less
#stable. In addition, since the initial color randomization can affect the results
#significantly, it is common for us to repeat the whole procedure multiple times
#to obtain the final set of more stable results

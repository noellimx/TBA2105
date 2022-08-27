#Ex 62f217738b1e5a10a4ba2aa6
#For this exercise, we will be doing KNN without using any additional libraries
#we will be using the iris data set

#dataLabels will give us the species of each data instance reference by its index
dataLabels <- iris$Species

#for this exercise, we will be select one of the data instance and treating it
#as the testing point, and the remaining 149 instances as the training point
#we can change this arbitrarily to switch to another testing point
testingDataIndex <- 1


#a) Obtain the expected species (class) of the testing point
#Complete implementation...
testingLabel <-


#Using the dist() function, we can obtain a matrix of the pairwise distances
#between 2 points
#matrix is a data structure similar to data frame (2d-array)
irisWithoutSpecies <- iris
irisWithoutSpecies$Species <- NULL
distanceMatrix <- as.matrix(dist(irisWithoutSpecies))


#b) Using the distanceMatrix, obtain the row at testingDataIndex
#which is the distance between the testing point to other points.
#The way how we index a matrix is similar to data frame. Use [ ] to 
#obtain the row for the testing data. We will also convert the row to
#a vector.
#Complete implementation...
distances <- as.vector(...)



#c) We need to then exclude the testingDataIndex since the distance
#of the testing point to itself will be 0. Modify distances to retain the 149 distances
#Complete implementation...
distancesWithoutTestingData <-


#Specify the K value 
K <- 3


#d) We need to obtain the vector of closestIndexes - determined by its distances
#between each of the training data with the testing point sorted by the shortest 
#distance. To do that we will use the sort() function. Note that we would need
#the indexes rather than the actual distances, you should make use of the 
#index.return argument in sort()
#Complete implementation...
closestIndexes <-



#count how many of the K nearest neighbors are setosa, versicolor & virginica
setosaCount <- 0
versicolorCount <- 0
virginicaCount <- 0

for (i in 1:K){
  closestIndex <- closestIndexes[i]
  label <- dataLabels[closestIndex]
  print(label)
  
  if (label == "setosa"){
    setosaCount = setosaCount + 1
  } else if (label == "versicolor"){
    versicolorCount = versicolorCount + 1
  } else{
    virginicaCount = virginicaCount + 1
  }
}

#the final class will then be the class of the majority count
maxCount <- max(setosaCount, versicolorCount, virginicaCount)
if (maxCount == setosaCount){
  print("setosa")
} else if (maxCount == versicolorCount){
  print("versicolor")
} else{
  print("virginica")
}


#play around with different values of testingDataIndex & K to see whether
#this classifier that you have built by hand works

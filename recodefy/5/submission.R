#Ex 62f217738b1e5a10a4ba2aa6
#For this exercise, we will be doing KNN without using any additional libraries
#we will be using the iris data set

#dataLabels will give us the species of each data instance reference by its index
dataLabels <- iris$Species


#for this exercise, we will be select one of the data instance and treating it
#as the testing point, and the remaining 149 instances as the training point
#we can change this arbitrarily to switch to another testing point
testingDataIndex <- 12


print("--- testingDataIndex ")
print(testingDataIndex)
testingLabel <- iris[testingDataIndex,]$Species


print("--- testingLabel")
print(testingLabel)

irisWithoutSpecies <- iris
irisWithoutSpecies$Species <- NULL
distanceMatrix <- as.matrix(dist(irisWithoutSpecies))


#print(distanceMatrix)

distances <- as.vector(distanceMatrix[testingDataIndex,])

print(distances)


distancesWithoutTestingData <- distances[-c(testingDataIndex)]

K <- 3

closestIndexes <- sort(distancesWithoutTestingData,index.return = TRUE)



sss <- closestIndexes$ix
closestIndexes <- sss


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
  print("max is setosa")
} else if (maxCount == versicolorCount){
  print("max is versicolor")
} else{
  print("max is virginica")
}

print("testing label is")
print(testingLabel)

print(setosaCount)
print(versicolorCount)
print(virginicaCount)
#play around with different values of testingDataIndex & K to see whether
#this classifier that you have built by hand works


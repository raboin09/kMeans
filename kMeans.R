setwd("C:/Users/james.raboin/Desktop/kMeansDataset/")

trainingFile = "iris.txt"

Xtrain = as.matrix(read.table(trainingFile))

k = 3

numOfAtts= dim(Xtrain)[2]
numOfPoints = dim(Xtrain)[1]

centroids <- matrix(, k, numOfAtts)
#usedPoints <- vector(mode="numeric", length=k)

classifiers <- rep(1, numOfPoints)

randInts = sample(1:numOfPoints, k)

for(i in 1:k){
  
  centroids[i,] <- Xtrain[randInts[i],] 
  
}

Xtrain <- cbind(Xtrain, Label=classifiers)

numOfAtts= dim(Xtrain)[2]

euclidCompare <- function(row){
  
  #find euclid dist for this row foreach centroid
  
  #if returned euclid is less than prior, assign newClass from passed index
  
  for(i in 1:k){
    
    
    
  }
  
  
}



euclidCalc <- function(row, centroid, oldClass){
  
  #calc euclid distance between centroid and row, if centroid[oldClass] distance is greater than new dist, assign 
  
  dist(rbind(row, centroid))
  
}







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

iterations = 0

while(iterations < 20){
  
  for(i in Xtrain){
    
    for(centroid in centroids){
      
      
      
    }
    
  }
  
}


euclidDist <- function(){
  
  
  
}









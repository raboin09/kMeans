setwd("C:/Users/raboi/Desktop/kMeans-master")

trainingFile = "iris.txt"

Xtrain = as.matrix(read.table(trainingFile))

k = 3

numOfAtts= dim(Xtrain)[2]
numOfPoints = dim(Xtrain)[1]

centroids <- matrix(, k, numOfAtts)

classifiers <- rep(1, numOfPoints)

randInts = sample(1:numOfPoints, k)

for(i in 1:k){
  
  centroids[i,] <- Xtrain[randInts[i],] 
  
}

Xtrain <- cbind(Xtrain, Label=classifiers)

numOfAtts= dim(Xtrain)[2]

iterations = 0

while(iterations < 10){
  
  for(i in 1:numOfPoints){
    
    for(j in 1:k){
      former <- dist(rbind(Xtrain[i,1:numOfAtts-1],centroids[j,]))[1]
      latter <- dist(rbind(Xtrain[i,1:numOfAtts-1],centroids[Xtrain[i,numOfAtts],]))[1]
      if(former < latter){
        Xtrain[i,numOfAtts] = j
      }
      
    }
    
  }
  
  iterations = iterations+1
  
}

print(Xtrain)

plot(Xtrain[,1:2], col=Xtrain[,numOfAtts], main = paste("Clusters of", fname), xlab = "Attribute 1", ylab = "Attribute 2")



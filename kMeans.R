library(matrixStats)

setwd("C:/Users/raboi/Desktop/kMeans-master")

trainingFile = "twoCircles.txt"

Xtrain = as.matrix(read.table(trainingFile))

k = 2

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

while(iterations < 20){
  
  for(i in 1:numOfPoints){
    
    for(j in 1:k){
      former <- dist(rbind(Xtrain[i,1:numOfAtts-1],centroids[j,]))[1]
      latter <- dist(rbind(Xtrain[i,1:numOfAtts-1],centroids[Xtrain[i,numOfAtts],]))[1]
      if(former < latter){
        Xtrain[i,numOfAtts] = j
      }
      
    }
    
  }
  
  if(iterations>0){
    for(t in 1:k){
      centLabel = which(Xtrain[,numOfAtts] ==t)
      centroids[t,] <- colMeans(Xtrain[centLabel,1:numOfAtts-1])
    }
  }
  
  iterations = iterations+1
  
}

print(Xtrain)
print(centroids)


plot(Xtrain[,1:2], col=Xtrain[,numOfAtts], main = paste("Clusters of", trainingFile), xlab = "Attribute 1", ylab = "Attribute 2")



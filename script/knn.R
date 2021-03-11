"We will do some KNN modelling on the IRIS dataset"

head(iris)

sapply(iris, class)
"All of the data is in the correct class."

any(is.na(iris))
"There is no NA in the data."

"We will normalize the data"
iris.normal <- scale(iris[,-5])

#Splitting the data into training and testing data
library(caTools)
set.seed(100)
sample <- sample.split(iris.normal[,1], 0.7)

train <- iris.normal[sample,]
test <- iris.normal[!sample,]

train.species <- iris[sample, "Species"]
test.species <- iris[!sample, "Species"]

rm(sample)

#Finding the best k value
library(class)
predicted <- NULL
error <- NULL
for (i in 1:20){
  predicted <- knn(train, test, train.species, k = i)
  error[i] <- mean(predicted != test.species)
}
rm(i, predicted, error)

#Plotting the error rate
library(ggplot2)
k <- 1:20
k.error <- data.frame(cbind(k, error))
ggplot(k.error, aes(k, error)) +
  geom_point() +
  geom_line() +
  theme_bw()

"We can see that the error rate jumps around after k went larger than 9. We will
simply use k = 9. But there is something interesting. k = 17 gives 0% error rate.
Meaning the accuracy of the model is 100%. We should check the k = 17 model."

Predicted <- knn(train, test, train.species, k = 17)
result <- data.frame(Species = test.species, Predicted)

"This model has the accuracy of 100%. Is this a coincidence? Well, nevertheless
we will simply use this model."

rm(test, train, k, Predicted, test.species, train.species)
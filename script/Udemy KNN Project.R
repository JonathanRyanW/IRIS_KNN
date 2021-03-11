#Use the ISLR libary to get the iris data set.
library(ISLR)
iris

#Check the head of the iris Data Frame.
head(iris)

#Use scale() to standardize the feature columns of the iris dataset.
#Set this standardized version of the data as a new variable.
iris.normal <- data.frame(scale(iris[-5]))

#Check that the scaling worked by checking the variance of the columns.
sapply(iris.normal, var)

#Join the standardized data with the response/target/label column
#(the column with the species names)

iris.normal$Species <- iris$Species

#Use the caTools library to split your standardized data into training and test
#data. Use a 70/30 split.
library(caTools)
set.seed(101)
sample <- sample.split(iris.normal$Sepal.Length, 0.7)
train <- iris.normal[sample,]
test <- iris.normal[!sample,]

rm(sample)

#Call the class library.
library(class)

#Use the knn function to predict Species of the test set. Use k=1
Prediction <- knn(train[1:4], test[1:4], train$Species, k = 1)
Prediction

#What was your misclassification rate?
error <- mean(Prediction != test$Species)

"What was the seed used in the project? There is no information about this in
the HTML file."

#Create a plot of the error (misclassification) rate for k values from 1 to 10.
Prediction <- NULL
Error <- NULL
for (i in 1:10) {
  Prediction <- knn(train[1:4], test[1:4], train$Species, k = i)
  Error[i] <- mean(Prediction != test$Species)
}

library(ggplot2)
k <- 1:10
k.error <- data.frame(k, Error)
ggplot(k.error, aes(k, Error)) +
  geom_point() +
  geom_line() +
  theme_bw()

"The resulting plot is different from the HTML file used in the course."
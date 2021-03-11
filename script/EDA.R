head(iris)
names(iris)

table(iris$Species)

"There are 3 different species of flowers. Each one of them make up for exactly
1/3 of the data."

tapply(iris$Sepal.Length, iris$Species, mean)

"We can see that in general the Virginica species have longest Sepal Length 
followed by Versicolor and Setosa"

tapply(iris$Sepal.Width, iris$Species, mean)

"Now we can see that the Setosa have the widest sepal followed by virginica and
versicolor"

tapply(iris$Petal.Width, iris$Species, mean)
"Virginica, followed by versicolor and Setosa"

tapply(iris$Petal.Length, iris$Species, mean)
"Virginica, followed by versicolor and Setosa"

"It seems that Virginicas have larger flowers in general."

library(corrplot)
corrplot(cor(iris[1:4]), method = "color")

"We can see that sepal length, petal length, and petal width all have strong
positive correlation. Sepal width has negative correlation with all the other
variables.

I am not a biologist but it could be that when plants are making their sepal
longer and ther petal bigger, they can't use the resources to make the sepal
wider."

library(ggplot2)
ggplot(iris, aes(Sepal.Length, Petal.Length)) +
  geom_point(aes(color = Species), size = 2) +
  ggtitle("Sepal Length vs Petal Length") +
  xlab("Sepal Length") +
  ylab("Petal Length") +
  theme_bw()

ggplot(iris, aes(Sepal.Length, Petal.Width)) +
  geom_point(aes(color = Species), size = 2) +
  ggtitle("Sepal Length vs Petal Width") +
  xlab("Sepal Length") +
  ylab("Petal Width") +
  theme_bw()

ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_point(aes(color = Species), size = 2) +
  ggtitle("Petal Length vs Petal Width") +
  xlab("Petal Length") +
  ylab("Petal Width") +
  theme_bw()

ggplot(iris, aes(Sepal.Width, Petal.Length)) +
  geom_point(aes(color = Species), size = 2) +
  ggtitle("Sepal Width vs Petal Length") +
  xlab("Sepal Width") +
  ylab("Petal Length") +
  theme_bw()

ggplot(iris, aes(Sepal.Width, Petal.Width)) +
  geom_point(aes(color = Species), size = 2) +
  ggtitle("Sepal Width vs Petal Width") +
  xlab("Sepal Width") +
  ylab("Petal Width") +
  theme_bw()

ggplot(iris, aes(Sepal.Width, Sepal.Length)) +
  geom_point(aes(color = Species), size = 2) +
  ggtitle("Sepal Width vs Sepal Length") +
  xlab("Sepal Width") +
  ylab("Sepal Length") +
  theme_bw()

"We can see that the distribution are very neat. The plots are very beautiful"
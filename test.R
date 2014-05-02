cube <- function(x, n) {
  x^3
}

x <- 1:10
if(x > 5) {
  x <- 0
}

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}

library(datasets)
names(iris)
x<-iris[iris$Species == 'virginica',1]
x
mean(x)
summary(x)
apply(iris[,1:4],2, mean)
colMeans(iris[,1:4])

tapply(iris$Sepal.Length, iris$Species, mean)

## take group means
# method 1
lapply(split(mtcars$mpg, mtcars$cyl), mean)
# method 2
sapply(split(mtcars$mpg, mtcars$cyl), mean)
# method 3
tapply(mtcars$mpg, mtcars$cyl, mean)

x<-tapply(mtcars$hp, mtcars$cyl, mean)
abs(x["4"] -  x["8"])


makeVector <- function(x = numeric()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmean <- function(mean) m <<- mean
    getmean <- function() m
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}

cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}



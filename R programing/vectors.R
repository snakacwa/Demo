library(tidyverse)
library(dplyr)
#logical vectors(used with comparison operators)

10%%3==0
sqrt(2) ^ 2 == 2
near(sqrt(2) ^ 2, 2)

10%%2==5
near(10/2, 5)

#numerical vectors(Integer and double). By default numbers are doubles,
#to make them integers, add L after the number.

typeof(1)   #yields a double

typeof(1L)     #yields an integer


x <- sample(20, 100, replace = TRUE)
y <- x > 10
sum(y) # how many are greater than 10?

mean(y) 

##Subseting
x<- c("one","two","three","four","five")
x[c(3,2,5)]

x[c(-1, -3, -2)]


##Recursive vectors(lists)
x<-list(1,2,3)
x

y<-list(a=1, b=2, c=3)
str(y)

##Unlike atomic vectors, lists can contain a mix of objects

y <- list("a", 1L, 1.5, TRUE)
str(y)


##Lists can even contain other lists!

z <- list(list(1, 2), list(3, 4))
str(z)


##Factors:represents categorical data which takes 
#a fixed set of possible values.

x<- factor(c("ab", "cd", "ab"),levels = c("ab", "cd", "ef"))
typeof(x)
attributes(x)

##Dates and Date times
x <- as.Date("1971-01-01")
unclass(x)
class(x)
attributes(x)
typeof(x)

library(lubridate)
x <- ymd_hm("1970-01-01 01:00")
unclass(x)
attributes(x)
typeof(x)





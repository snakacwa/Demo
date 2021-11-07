#functions allow you automate common tasks in a more general way.
library(tidyverse)
library(magrittr)
library(dplyr)

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10) )
df$a <- (df$a - min(df$a, na.rm = TRUE)) /
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$b <- (df$b - min(df$b, na.rm = TRUE)) /
  (max(df$b, na.rm = TRUE) - min(df$b, na.rm = TRUE))
df$c <- (df$c - min(df$c, na.rm = TRUE)) /
  (max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))
df$d <- (df$d - min(df$d, na.rm = TRUE)) /
  (max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE, finite= TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
#rescale01(c(0, 5, 10))
df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)
x <- c(1:10,Inf)
rescale01(x)


#conditional execution-------------------
identical(0L, 0)
#Instead of == operator, use dplyr::near() for comparisons,
x<-sqrt(2)^2
x
x==2
near(x,2)
y<- sqrt(4)^2
y
near(y,4)
near(y,3.9)
is.na(y)
z<- 1
if(z>10){
  print("greater than ten")
} else if(z<10){
  print("less than ten")
} else {
  print("equal to ten")
}
?switch()
x<-2
y<-4
function( x , y, op) {
 switch(op,
 plus = x + y,
 minus = x - y,
 times = x * y,
 divide = x / y,
 stop("Unknown op!")
 )
}


y<-10
if (y < 20) {
  x <- "Too low"
} else {
  x <- "Too high"
}
x

??ifelse()
library(lubridate)
x<- now()
if (6<x<12){
  print("good morning babe!")
}else if(12<x<4){
  print("good afternoon babe!")
}else if(4<x<6){
  print("good evening babe!")
}


x<-9
x/3
x/3==0


x <- c(1, 2)
#sum(x, na.mr = TRUE)
#as.list(x, ...)
is.list(x)


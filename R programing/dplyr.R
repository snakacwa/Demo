library(tidyverse)
library(dplyr)
?flights
nycflights13::flights
view("flights")
??flights
view(nycflights13::flights)
flights
?flights

#using filter()
filter(nycflights13::flights, month==1,day==1)
view(flights)
filter(Flights, month==1,day==1)
filter(nycflights13::flights, month==12,day==25)
dec25 <-filter(nycflights13::flights, month==12,day==25) 

#comparision
sqrt(2)^2==2
1/49*49==1
near(1/49*49,1)
near(#comparision
  sqrt(2)^2,2)

#using logical operators
filter(nycflights13::flights, month==11/month==12)
nov_dec <- filter(nycflights13::flights, month %in% c(11, 12))

filter(nycflights13::flights, month%in% c(11,12))
x <- NA
y <- NA
x==y
is.na(x)

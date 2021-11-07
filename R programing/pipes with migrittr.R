library(magrittr)
library(tidyverse)
library(dplyr)
diamonds <- ggplot2::diamonds
diamonds2 <- diamonds %>%
  dplyr::mutate(price_per_carat = price / carat)
pryr::object_size(diamonds)

#When working with more complex pipes, it's sometimes useful
#to call a function for its side effects. Maybe you want to print
#out the current object, or plot it, or save it to disk. Many times,
#such functions don't return anything, effectively terminating the
#pipe.
#To work around this problem, you can use the "tee" pipe. %T>%

rnorm(100) %>%
  matrix(ncol = 2) %T>%
  plot() %>%
  str()
#without a tee piple , the above code would return a null.
rnorm(100) %>%
  matrix(ncol = 2) %>%
  plot() %>%
  str()
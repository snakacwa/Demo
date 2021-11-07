library(tidyverse)
library(ggplot2)
library(datasets)
data("iris")
view(iris)
unique(iris$Species)
install.packages("GGALLY")
install.packages("GGally", repos = "https://cran.r-project.org", type= "source")
library(GGally)
ggpairs(iris,mapping=ggplot2::aes(colour= Species))


library(GGally)
ggpairs(iris, mapping=ggplot2::aes(colour = Species))
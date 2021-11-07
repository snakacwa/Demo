library(tidyverse)
library(forcats)
#creating factors
#first, create a list of valid levels

X1<-c("dec","apr","jan","mar")
x2 <- c("dec", "apr", "jam", "mar") 
#(#with typos in string Jan)

months_levels<-c("jan","feb","mar",
                 "apr","may","jun","jul","aug","sept","oct","nov","dec")

y1<-factor(X1, levels = months_levels)
y1
sort(y1)

#note that any values not in the level will be silently converted to NA
 y2<-factor(x2, levels = months_levels)
 y2
 
 #if you prefer the order of the levels match the
 #order of the first apearence,you can do that by setting levels
 #to unique() in the created factor or use fct_inorder() ie;
 
 y1<-factor(X1, levels = unique(X1))
 y1
 
 f2 <- X1 %>% factor() %>% fct_inorder()
 f2
 
 #General Social Survey
 # It's a sample of data from the General Social
 #Survey, which is a long-running US survey conducted by the inde-
# pendent research organization NORC at the University of Chicago.
 
 s<-forcats::gss_cat
gss_cat%>%
  count(race)
ggplot(gss_cat, aes(race))+
  geom_bar()+
#by default, ggplot2 drops levels that do not have any values,
#to force their display,

scale_x_discrete(drop = FALSE)

ggplot(gss_cat, aes(rincome))+
  geom_bar()+
  coord_flip()
gss_cat%>%
  count(relig)%>%
  arrange(desc(n))%>%
head(1)
levels(gss_cat$denom)

gss_cat%>%
  filter(!denom %in% c("No answer","other",
                       "Dont know","Not applicable","No denomination"))%>%
  count(relig)

gss_cat%>%
  count(relig, denom)%>%
  ggplot(mapping = aes(x=relig, y=denom))+
  geom_point()+
  
  gss_cat%>%
  ggplot(mapping = aes(x=relig, y=tvhours))+
  geom_point()+
  theme(axis.text.x = element_text(angle = 45))
  
#Modifying Factor order
#finding the average number of hours spent watching tv per day across religions

relig <- gss_cat%>%
  group_by(relig)%>%
  summarise(
    age=mean(age,na.rm=T ),
    tvhours=mean(tvhours, na.rm=TRUE),
    n=n()
  )%>%
  ggplot(relig, mapping = aes(tvhours, relig)) + geom_point()


relig <- gss_cat %>%
  group_by(relig) %>%
  summarize(
    age = mean(age, na.rm = TRUE),
    tvhours = mean(tvhours, na.rm = TRUE),
    n = n()
  )
ggplot(relig, aes(tvhours, relig)) + geom_point()

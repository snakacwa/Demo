#DATES AND TIMES WITH LUBRIDATE
library(tidyverse)
library(lubridate)
library(nycflights13)

#To get the current date or date-time you can use today() or now():
today()
now()
ymd(20211011)

flights %>%
  select(year, month, day, hour, minute)
#To create a date/time from this sort of input, use make_date()
#for dates, or make_datetime() for date-times:

flights%>%
  select(year,month,day,hour, minute)%>%
  mutate(depature= make_datetime(year, month,day,hour,minute))

make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100) }
flights_dt <- flights %>%
  filter(!is.na(dep_time), !is.na(arr_time)) %>%
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(
      year, month, day, sched_dep_time
    ),
    sched_arr_time = make_datetime_100(
      year, month, day, sched_arr_time
    )
  ) %>%
  select(origin, dest, ends_with("delay"), ends_with("time"))
flights_dt
#With this data, I can visualize the distribution of departure times
#across the year:
flights_dt %>%
  ggplot(aes(dep_time)) +
  geom_freqpoly(binwidth = 86400) # 86400 seconds = 1 day

##Or within a single day
flights_dt %>%
  filter(dep_time < ymd(20130102)) %>%
  ggplot(aes(dep_time)) +
  geom_freqpoly(binwidth = 600) # 600 s = 10 minutes
flights_dt%>%
  filter(dep_time<ymd(20130103))%>%
  ggplot(aes(dep_time))+
  geom_freqpoly(binwidth=600)
#You may want to switch between a date-time and a date. That's he
#job of as_datetime() and as_date()
as_datetime(today())
as_date(now())
ymd(c("2010-10-10", "2021-11-11"))

##Use the appropriate lubridate function to parse each of the fol-
#lowing dates:
d1 <- "January 1, 2010"
mdy(d1)
d2 <- "2015-Mar-07"
ymd(d2)
d3 <- "06-Jun-2017"
dmy(d3)
d4 <- c("August 19 (2015)", "July 1 (2015)")
mdy(d4)
d5 <- "12/30/14" # Dec 30, 2014
mdy(d5)

#Getting components
#You can pull out individual parts of the date with the accessor
#functions year(), month(), mday() (day of the month), 
#yday() (day of the year), wday() (day of the week), hour(),
#minute(), and second():

datetime <- ymd_hms("2016-07-08 12:34:56")
year(datetime)
month(datetime, label = TRUE, abbr = FALSE)
mday(datetime)
yday(datetime)
wday(datetime, label = TRUE, abbr = FALSE)
hour(datetime)
minute(datetime)
second(datetime)
flights_dt%>%
  mutate(
    wday=wday(dep_time, label=TRUE))%>%
      ggplot(aes(wday))+  
      geom_bar()
flights_dt

##average departure delay by minute
##there is minimum delay between minutes 20-30 and 50-60
flights_dt%>%
  mutate(minutes=minute(dep_time))%>%
  group_by(minutes)%>%
  summarise(
    average_delay=mean(arr_delay, na.rm=TRUE),
    n=n())%>%
  ggplot(aes(minutes, average_delay))+
    geom_line()
  
##if we use sched_dep_time, we dont get such a strong corelation
flights_dt%>%
  mutate(minutes=minute(sched_dep_time))%>%
  group_by(minutes)%>%
  summarise(
    average_delay=mean(arr_delay, na.rm=TRUE),
    n=n())%>%
  ggplot(aes(minutes, average_delay))+
  geom_line()
##Rounding
#An alternative approach to plotting individual components is to
#round the date to a nearby unit of time, with floor_date(),
#round_date(), and ceiling_date(). Each ceiling_date()function
#takes a vector of dates to adjust and then the name of the unit to
#round down (floor), round up (ceiling), or round to.

##no of flights in a week
flights_dt%>%
  count(week=floor_date(dep_time, "week"))%>%
  ggplot(aes(week, n))+
  geom_line()

#You can also use each accessor function to set the components of a
#date/time:
  (datetime <- ymd_hms("2016-07-08 12:34:56"))
year(datetime)
month(datetime)
hour(datetime)  
update(datetime, year=2020, month=11, mday=25, hour=2)
datetime


##From the exercise, On what day of the week should you leave
#if you want to minimize the chance of a delay?
flights_dt%>%
  mutate(
    wday=wday(dep_time, label = TRUE))%>%
  
group_by(wday)%>%
  summarise(
    av_delay=mean(dep_delay, na.rm=TRUE))%>%
ggplot(aes(wday, av_delay))+
  geom_bar(stat = "identity")
#Durations
h_age <- today() - ymd(19941125)
h_age
#A difftime class object records a time span of seconds, minutes,
#hours, days, or weeks. This ambiguity can make difftimes a little
#painful to work with, so lubridate provides an alternative that
#always uses seconds-the duration:

as.duration(h_age)

#NB; there are flights that arrived before their departure time.
#ie, overnight flights, we rectify them by using periods
#We can fix this by adding days(1) to the arrival
#time of each overnight flight:

flights_dt%>%
  mutate(
    overnight=arr_time< dep_time,
    arr_time= arr_time+ days(overnight*1),
    sched_arr_time=sched_arr_time + days(overnight*1))%>%
  filter(overnight, arr_time<dep_time)

#Create a vector of dates giving the first day of every month in
#2015. Create a vector of dates giving the first day of every month
#in the current year.
ymd("2015-01-01")+months(0:11)

#Write a function that, given your birthday (as a date),
#returns how old you are in years.

my_age<- today()- ymd(19941125)
as.duration(my_age)
 
age<- function(bday){
  (bday%--% today())%/% years(1)
}
age(ymd("19941125"))

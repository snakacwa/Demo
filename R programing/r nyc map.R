x<- 1
x+100
q
y<-"4"
y
1+1
z <- 1+1
z
install.packages("leaflet")
library(leaflet)
nyc_latitude = 40.7128
nyc_longitude = -74.0060
m <- leaflet() %>%
  setView(lng = nyc_longitude, 
          lat = nyc_latitude, 
          zoom = 12)
m %>% addTiles()
nyc_latitude= 40.7128
nyc_latitude= -70.0060
m<-leaflet()%>%
  setView(lat=nyc_latitude, lang=nyc_longitude, zoom=12)
m%>%
  addTiles()


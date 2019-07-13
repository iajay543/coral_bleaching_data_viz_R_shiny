#loading the packages
library(ggplot2)
library(leaflet)

#reading the coral bleaching dataset
df<-read.csv("assignment-02-data-formated.csv")

#Viewing the dataset
View(df)

#converting the bleach percentage values to decimal values and preparing a new column
df$Bleach_Value<-as.numeric(sub("%","",df$value))/100

#ordering site location based on latitude
df$location<-reorder(df$location,-df$latitude)

#plotting a scatter plot with multiple facets based on coral types and site locations
plt1<-ggplot(df,aes(year,Bleach_Value))+geom_point(aes(color=coralType))+facet_grid(coralType~location)

#adding a smoothing function to the plot with method 'lm'
plt1<-plt1+geom_smooth(color='grey',method='lm',se=FALSE)

#reformatting the axis and title labels
plt1<-plt1+labs(title='Coral Bleaching across different sites',x='Time Period',y='Bleach Value',color='Coral Types')

#rotating the x axis ticks in a vertical manner
plt1<-plt1+theme(axis.text.x=element_text(angle=90),legend.title = element_text(size=12))

#displaying the final plot
plt1


#creating a leaflet that shows the location of coral bleaching sites

leaflet(data = df) %>% addTiles() %>%
  addMarkers(~longitude, ~latitude, popup = ~as.character(location))

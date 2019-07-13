#loading the required libraries

library(shiny)
library(leaflet)
library(ggplot2)

#reading the dataset
df<-read.csv("assignment-02-data-formated.csv")

#converting the bleach percentage values to decimal values
df$Bleach_Value<-as.numeric(sub("%","",df$value))/100

#reordering site location based on latitude
df$location<-reorder(df$location,-df$latitude)

# Define server logic required to draw a scatter plot
shinyServer(function(input, output) {
   
  output$coralPlot <- renderPlot({
    
    #filtering rows based on user input and creating the plot
    df1<-df[(df$coralType==input$corals),]
    plt1<-ggplot(df1,aes(year,Bleach_Value))+geom_point()+facet_wrap(~location,nrow=1)
    plt1<-plt1+labs(title='Coral Bleaching from 2010 to 2017 across various sites',x='Time Period',y='Bleach Value',color='Location')
    
    plt1<-plt1+geom_smooth(color="blue",method=input$smooth,se=FALSE)
    plt1<-plt1+theme(axis.text.x = element_text(angle = 90))
    plt1<-plt1+theme(axis.title = element_text(size=15))
    plt1<-plt1+theme(plot.title=element_text(size=18,face="bold",family="Calibri"))
    plt1
     })
  
  #creating a map leaflet
  output$mymap <- renderLeaflet({
    df2=df[(df$coralType==input$corals),]
    leaflet(data = df2) %>% addTiles() %>%
      
      #text markers to link the site son the map to the corresponding facets
      addMarkers(~longitude, ~latitude, popup = ~as.character(location))

  })
})

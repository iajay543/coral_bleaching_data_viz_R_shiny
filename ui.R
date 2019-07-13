#loading the required libraries

library(shiny)
library(leaflet)

#reading the dataset
df<-read.csv("assignment-02-data-formated.csv")

# Defining UI for application that draws a scatter plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Coral Bleaching Interactive Visualisation"),
  
  # Sidebar with two dropdowns for input selection
  sidebarLayout(
    sidebarPanel(
      selectInput("corals","Coral Types:",choices=levels(df$coralType)),
      selectInput("smooth","Choice of smoother:",c("lm","gam","loess"))
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("coralPlot")
    )
  ),
  
  #Shows a plot of generated map
  leafletOutput("mymap") 
  
))

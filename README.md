# coral_bleaching_data_viz_R_shiny

Static and Interactive Visualisation of Coral Bleaching Data using R and Shiny package

Please refer the file Problem Statement.png to understand the problem statement.

Below is a short description of files under this repository:

1. assignment-02-data-formated.csv - Formatted, clean Excel Dataset
2. facets.R - This is an R code which shows a static tabular visualisation depicting how the bleaching varies from year to year for each kind of coral and at each site. ggplot2 package is used to create this static visualisation. Also, a map is created using leaflet package which shows the location of the sites. 
3. ui.R and server.R - These are UI and server R Shiny codes using which an interactive visualisation is created that allows the user to vary the kind of coral displayed and the choice of smoother. A map showing the location of sites is also merged into this interactive visualisation. 
4. vis_1.png and vis_2.png - static visualisations
5. int_vis_1.png and int_vis_2.png - interactive visualisations

Note: Before running these codes in R Studio, Please run the below commands:

1. install.packages("ggplot2") #to install ggplot2 library
2. install.packages("leaflet") #to install leaflet library
3. install.packages("shiny") #to install shiny library

Also, please make sure that the dataset is in same directory as of R codes.


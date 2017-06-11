# ui of app

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Bias-variance trade off example"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("dp", "degree of polynomial:", min = 1, max = 20, value = 1)
    ),
    
    # Show a plot
    mainPanel(
       plotOutput("distPlot")
    )
    
  )
  
))

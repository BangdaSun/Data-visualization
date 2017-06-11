# author: Bangda Sun
# 12/7/2016
# show the bias - variance trade off

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    # data is from hw 7 in gr5205 linear regression model
    
    x <- c(-0.289,  0.054, -1.946, -1.810, -1.611,  1.114,  
            1.997,  1.602, -1.063, -0.443, -1.379, -1.324, 
           -1.274, -0.741,  0.962, 0.4866,  0.530,  0.575,  
            0.285, -1.622,  1.072,  0.086, -1.382,  0.213, 1.208, 
            0.358,  1.946, -1.115, -1.308, -0.613, -1.253, 0.615, 
           -1.432,  0.361,  0.319, -0.269, -0.756,  1.487,  0.421, -0.599)
    
    y <- c( 1.515, -0.514, -3.367, -1.216,  1.653, -3.682, 
            4.734, -1.093,  4.436,  2.459,  2.679,  3.282,  4.238,  
            2.984, -3.330, -2.251, -3.256, -3.454, -1.474,  1.461, 
           -4.461, -1.603,  3.069, -2.293, -3.747, -1.929,  2.522, 
            3.071,  2.908,  3.788,  4.154, -3.195,  2.822, -1.969, 
           -2.304,  1.906,   3.11, -2.620, -2.861,  3.077)
    
    p <- input$dp
    
    # draw the fitness
    
    df           <-  data.frame(x = x, y = y)
    model        <- lm(y ~ poly(x, p))
    newdata      <- data.frame(x = seq(min(x), max(x), by = 0.001))
    newdata$pred <- predict(model, newdata = newdata)
    # plot(x, y, type = "p", cex = .5)
    # with(newdata, lines(x = x, y = pred, lty = 1, lwd = 1.5))
    
    ggplot() +
      geom_point(aes(x = x, y = y), data = df) +
      geom_line(aes(x = x, y = pred), data = newdata, color = "red") + 
      labs(x = "x", y = "y")
    
  })
  
})

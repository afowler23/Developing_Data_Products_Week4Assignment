
library(shiny)

# Loading "datasets" package
library(datasets)

p <- USArrests
p_transpose <- t(p)

# Color palettte for the bar graph
colors = c("gold3", "dimgrey", "darkseagreen3")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$prediction <- renderPrint({sum(p_transpose[1:3,input$USStates])})
  output$sum <- renderPrint({p_transpose[4,input$USStates]})
    
    # Fill in...
    output$CrimePlot <- renderPlot({
      barplot(p_transpose[1:3,input$USStates],
              main = input$USStates,
              ylab = "Violent Crime Rates by US State",
              xlab = "Type of Crime",
              col = colors)
      })
})
    
    
  
  



library(shiny)

# Loading "datasets" package
library(datasets)


p <- USArrests
p <- p[,c(4, 1:3)]
p_transpose <- t(p)


# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Violent Crime Rates by US State in 1973"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("USStates", "Pick a state:", choices = colnames(p_transpose)),
                   hr(),
                   helpText("This data set contains statistics, in arrests per 100,000 residents for assault, murder, 
                            and rape in each of the 50 US states in 1973. Also given is the percent of 
                            the population living in urban areas.")),
                  
    
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("CrimePlot"),
       h3("Total Crime Rate per 100,000 Residents by US State"),
       verbatimTextOutput("prediction"),
       h3("Percent of Urban Population"),
       verbatimTextOutput("sum")
    )
  )
))

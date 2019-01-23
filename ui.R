library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  headerPanel("Interactive Statistical Distribution"),
  
  # Sidebar with a slider input for number of bins 
  sidebarPanel(
    numericInput("n", "Generate this many points", 
                 min = 1, value = 500),
    selectInput("family", "From this family",
                choices = c("Normal",
                            "Uniform",
                            "Exponential"),
                selected = "normal"),
    sliderInput("bins", "number of bins", 
                min = 1, max = 50, value = 30)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("histogram")
  )
)
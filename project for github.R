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

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  data <- reactive({ 
    FUN <- switch(input$family,
                  "Normal" = rnorm,
                  "Uniform" = runif,
                  "Exponential" = rexp)
    FUN(input$n)
  })
  
  output$histogram <- renderPlot({  
    
  
      # draw the histogram with the specified number of bins
    hist(data(), breaks = input$bins)
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)


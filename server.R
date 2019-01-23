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


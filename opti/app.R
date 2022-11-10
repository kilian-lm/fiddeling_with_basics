library(shiny)

ui <- fluidPage(
  
  titlePanel("Optimizing a Marketing YouTube Campaign"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("budget", 
                  "Budget", 
                  min = 0, 
                  max = 1000, 
                  value = 500),
      
      sliderInput("views", 
                  "Views", 
                  min = 0, 
                  max = 10000, 
                  value = 1000),
      
      sliderInput("likes", 
                  "Likes", 
                  min = 0, 
                  max = 1000, 
                  value = 100)
    ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output) {
  
  output$plot <- renderPlot({
    
    x <- seq(0, input$budget)
    y <- seq(0, input$views)
    
    z <- outer(x, y, function(x, y) {
      x * y + input$likes
    })
    
    contour(x, y, z, nlevels = 20)
    
  })
  
}

shinyApp(ui = ui, server = server)
library(shiny)
library(httr)

ui <- fluidPage(
  
  titlePanel("HTTP POST Request"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("text", "Text to POST", ""),
      actionButton("goButton", "Submit")
    ),
    
    mainPanel(
      verbatimTextOutput("response")
    )
  )
)

server <- function(input, output) {
  
  observeEvent(input$goButton, {
    
    res <- POST("http://httpbin.org/post", 
                body = list(text = input$text))
    
    output$response <- renderText(content(res, "text"))
    
  })
  
}

shinyApp(ui = ui, server = server)
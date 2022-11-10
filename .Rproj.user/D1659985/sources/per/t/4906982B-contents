library(shiny)

ui <- fluidPage(
  
  titlePanel("Uploading Files"),
  
  sidebarLayout(
    sidebarPanel(
      
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')),
      
      tags$hr(),
      checkboxInput('header', 'Header', TRUE),
      radioButtons('sep', 'Separator',
                   c(Comma=',',
                     Semicolon=';',
                     Tab='\t'),
                   ','),
      radioButtons('quote', 'Quote',
                   c(None='',
                     'Double Quote'='"',
                     'Single Quote'="'"),
                   '"'),
      
      actionButton("goButton", "Submit")
      
    ),
    
    mainPanel(
      
      tableOutput('contents')
      
    )
  )
)

server <- function(input, output) {
  
  values <- reactiveValues(data = NULL)
  
  observeEvent(input$goButton, {
    
    req(input$file1)
    
    values$data <- read.csv(input$file1$datapath, 
                            header = input$header, 
                            sep = input$sep, 
                            quote = input$quote)
    
  })
  
  output$contents <- renderTable({
    
    if(is.null(values$data))
      return(NULL)
    
    values$data
    
  })
  
}

shinyApp(ui = ui, server = server)
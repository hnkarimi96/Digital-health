library(shiny)
library(ggplot2)

# User Interface (UI)
ui <- fluidPage(
  titlePanel("Mental Health"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload CSV File:", accept = c(".csv")),
      selectInput("xvar", "Select X Variable:", choices = NULL),
      selectInput("yvar", "Select Y Variable:", choices = NULL),
      checkboxInput("showTable", "Show Data Table", value = TRUE),
      sliderInput("sampleSize", "Number of Samples to Display:",
                  min = 10, max = 100, value = 30)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Plot", plotOutput("scatterPlot")),
        tabPanel("Data Table", tableOutput("dataTable"))
      )
    )
  )
)

# Server Logic
server <- function(input, output, session) {
  
  # Data Cleaning Function
  clean_data <- function(data) {
    data <- na.omit(data)
    
        data <- data[!duplicated(data), ]
    
        numeric_cols <- sapply(data, function(col) all(!is.na(suppressWarnings(as.numeric(as.character(col))))))
    for (col in names(data)[numeric_cols]) {
      data[[col]] <- as.numeric(as.character(data[[col]]))
    }
    
    
    for (col in names(data)[numeric_cols]) {
      if (col != "Age") {
        Q1 <- quantile(data[[col]], 0.25, na.rm = TRUE)
        Q3 <- quantile(data[[col]], 0.75, na.rm = TRUE)
        IQR <- Q3 - Q1
        lower <- Q1 - 1.5 * IQR
        upper <- Q3 + 1.5 * IQR
        data <- data[data[[col]] >= lower & data[[col]] <= upper, ]
      }
    }
    
    return(data)
  }
  
  # Reactive Dataset
  dataset <- reactive({
    req(input$file) 
    data <- read.csv(input$file$datapath, stringsAsFactors = FALSE)
    data <- clean_data(data) 
    updateSelectInput(session, "xvar", choices = names(data))
    updateSelectInput(session, "yvar", choices = names(data))
    return(data)
  })
  
  # Generate Scatter Plot
  output$scatterPlot <- renderPlot({
    req(dataset())
    data <- dataset()
    ggplot(data[1:input$sampleSize, ], aes_string(x = input$xvar, y = input$yvar)) +
      geom_point(color = "blue", size = 3) +
      labs(title = "Scatter Plot", x = input$xvar, y = input$yvar) +
      theme_minimal()
  })
  
  # Display Data Table
  output$dataTable <- renderTable({
    req(dataset())
    if (input$showTable) {
      head(dataset(), input$sampleSize)
    }
  })
}

# Run the Shiny App
shinyApp(ui = ui, server = server)

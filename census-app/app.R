library(shiny)
library(bslib)

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  title = 'Hello World!',
  sidebar = sidebar(
    sliderInput(
      inputId = 'bins',
      label = 'Number of bins:',
      min = 5,
      max = 50,
      value = 30
    )
  ),
  plotOutput(outputId = 'distPlot')
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = '#007bc2', border = 'orange',
         xlab = 'Waiting time to next eruption (in mins)',
         main = 'Histogram of waiting times')
  })
}

# Execute the application
shinyApp(ui = ui, server = server)

library(dplyr, warn.conflicts = FALSE)
library(ggplot2, warn.conflicts = FALSE)
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

  # Application title
  titlePanel("Shiny Fishies"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      varSelectInput(inputId = "qvar",
                     "Quantitative Variable:",
                     ddt[,c("LENGTH", "WEIGHT","DDT")],
                     selected =  "LENGTH"),

      varSelectInput(inputId = "catvar",
                     "Categorical Variable:",
                     ddt[,c("SPECIES","RIVER")],
                     selected =  "SPECIES"),

      sliderInput(inputId = "alpha",
                  "Alpha Level:",
                  min = 0,
                  max = 0.2,
                  value = 0.05),

      sliderInput(inputId = "alpha2",
                  "Alpha2 Value:",
                  min = 0,
                  max = 1,
                  value = 0.02),

      sliderInput(inputId = "mu0",
                  "Mu Naught:",
                  min = 0,
                  max = 100,
                  value = 45),

      sliderInput(inputId = "epsilon",
                  "Espilon:",
                  min = 1,
                  max = 10,
                  value = 4),

      sliderInput(inputId = "bins",
                  "Number of Bins:",
                  min = 1,
                  max = 40,
                  value = 25)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("hist"),
      tableOutput("data")
    )
  )
)

# server
server <- function(input, output) {

  output$hist <- renderPlot({

    ggplot(data = ddt, aes(x = !!input$qvar, fill = !!input$catvar)) +
      geom_histogram(bins = input$bins)

  })

  output$data <- renderTable({
    l
  })
}

# Run the application
shinyApp(ui = ui, server = server)

library(shiny)
source("the_third_edition.R")
ui <- fluidPage(
  titlePanel("search"),

  sidebarLayout(

    sidebarPanel(
      helpText("The shiny application is used to find other information about a region, such as ID and type"),
      textInput("name",
                h3("type the name of the region"),
                value = "Lund"
                )

    ),

    mainPanel(textOutput("info"))

  )
)

server <- function(input, output) {

  output$info <- renderText({
    kolada_api_2(input$name)
  })


}

shinyApp(ui <- ui, server <- server)

library(shiny)
id <- readRDS("data/id.rds")

# Define uI----
ui <- fluidPage(
  titlePanel("investigation"),

  sidebarLayout(

    sidebarPanel(
      helpText("search for the ID of one city in Lund"),
      br(),
      selectInput("var",
                  label = "choose the name of the city",
                  choice = as.list(id$vector_2),
                  selected = "Ale")
      ),

    mainPanel(textOutput("text"))

  )
)

# Define server----
server <- function(input, output){

  output$text <- renderText({
    index <- which(id$vector_2 == input$var)
    ID <- id$vector_1[index]
    paste("the ID of the region is", ID)
  })
}

# Run the app----
shinyApp(ui = ui, server = server)


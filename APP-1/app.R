library(shiny)

# Define UI ----
ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      p("Create demographic maps with information from the 2010 US Census."),
      
      selectInput("var",strong("Choose a variable to display"), 
                  choices = list("Percentage White",
                                 "Percentage Black",
                                 "Percentage Hispanic",
                                 "percentage Aisa")),
      sliderInput("range",strong("Range of interest"),min = 0,max = 100,value = c(0,100))
      
    ),
    
    mainPanel(textOutput("selected_var"),textOutput("selected_var2"))
    
  )
  
)

# Define server logic ----
server <- function(input, output) {
  
  output$selected_var <- renderText({ 
    paste("You have selected", input$var)
  })
  output$selected_var2 <- renderText({
    paste("You have chosen a range that goes from", input$range[1],"to", input$range[2])
  })
  
  
}

# Run the app ----
shinyApp(ui = ui, server = server)
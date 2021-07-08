#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(googlesheets4)



# Define UI ----
ui <- navbarPage("Finance Tracker",
                 
                 tabPanel("Annual Trend"),
                 # Import data
                 
                 tabPanel("Monthly Trends"),
                 navbarMenu("Categories",
                            tabPanel("Food"),
                            tabPanel("Grocerries")),
                column(2, "Buttons"),
                    actionButton("action", "Action"),
                    br(),
                    br(),
      fluidRow(           
                column(3,
                    selectInput("select", h3("Categories"), 
                    choices = list("Food" = 1,
                                   "Grocerries" = 2,
                                   "Choice 3" = 3), selected = 1)),
                              submitButton("Submit")
      )
)

# Define server logic ----
server <- function(input, output) {
    
}

# Run the app ----
shinyApp(ui = ui, server = server)
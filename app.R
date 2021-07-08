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
source("ui.R")

#get ui from the ui.R file
ui <- ui()

# Define server logic ----
server <- function(input, output) {
    
}

# Run the app ----
shinyApp(ui = ui, server = server)
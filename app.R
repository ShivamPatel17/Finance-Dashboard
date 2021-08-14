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
library(tidyverse)
source("ui.R")



# Reads data from Google sheet and stores it in the variable, "financeData"
financeData <- read_sheet("https://docs.google.com/spreadsheets/d/1nyrWHc-LFwaIcaCVwfRUVKP5X5tUBFKheu7py1isnZE/edit?usp=sharing")

# Extracts unique categories from dataset
uniqueCategories <- (unique(financeData$Category))
uniqueCategories <- as.list(uniqueCategories)

tabPanelList <- list()
tabPanelList <- append(tabPanelList, tabPanel("Hi"))
tabPanelList <- append(tabPanelList, tabPanel("Bye"))
tabPanelList <- append(tabPanelList, tabPanel("Good morning"))

print(typeof(uniqueCategories))
print(uniqueCategories)


# get ui from the ui.R file
ui <- function(){
  fluidPage(
    
    #main navbar
    navbarPage("Finance Tracker",
               
               #tab for Trends
               tabPanel("Trend"),
               
               #tab with dropdown
               #TODO: iterate over categories and insert dynamic
               navbarMenu("Categories"

               ),
               tabPanel("Testing",
                        sidebarLayout(
                          sidebarPanel(
                            
                          ),
                          mainPanel(
                            dataTableOutput("testingPlot")
                          )
                        )
               )
               
    )
  )
}
    
  
  

# Define server logic ----
server <- function(input, output) {
  
   output$testingPlot <- renderDataTable(
     financeData
   )
}

# Run the app ----
shinyApp(ui = ui, server = server)
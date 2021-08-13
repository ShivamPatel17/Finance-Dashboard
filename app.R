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
financeData <- read_sheet("https://docs.google.com/spreadsheets/d/1ThNMemTz_HrpkVQSWEy3SFu0TdMn4OZDu0s9NGI5fNQ/edit#gid=0")

# Extracts unique categories from dataset
uniqueCategories <- (unique(financeData$Category))
uniqueCategories <- as.list(uniqueCategories)

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
               navbarMenu("Categories", 
                          
                          do.call(tabPanel, uniqueCategories) 
                          , 
                          tabPanel(uniqueCategories[1]), 
                          tabPanel("Grocerries")), 
               
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
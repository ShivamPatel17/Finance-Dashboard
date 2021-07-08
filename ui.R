ui <- function(){
  fluidPage(
    
    #main navbar
    navbarPage("Finance Tracker",
      
      #tab for Trends
      tabPanel("Trend"),
      
      #tab with dropdown
      #TODO: iterate over categories and insert dynamic
      navbarMenu("Categories",
                tabPanel(uniqueCategories),
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


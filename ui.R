ui <- function(){
  fluidPage(
    navbarPage("Finance Tracker",
      
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
    
  )
}


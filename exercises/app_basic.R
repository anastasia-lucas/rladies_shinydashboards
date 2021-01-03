### Create the most basic dashboard

## UI ##
library(shinydashboard)

dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

## App ##

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody()
)

## UI and App can also be split into ui.R and app.R files

server <- function(input, output) { }

shinyApp(ui, server)

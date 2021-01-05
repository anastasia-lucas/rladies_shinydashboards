# To install these packages run: source("utils.R") in the RStudio console

# Below packages required to complete exercises
if (!require("dplyr")) install.packages("dplyr") # data cleaning
if (!require("ggplot2")) install.packages("ggplot2") # plotting
if (!require("shiny")) install.packages("shiny") # dependency for shinydashboard
if (!require("shinydashboard")) install.packages("shinydashboard")  # dashboard

# Below packages required to complete exercises in advanced topics
if (!require("dashboardthemes")) install.packages("dashboardthemes")  # themes for Shiny dashboards
if (!require("plotly")) install.packages("plotly")  # interactive example (advanced topics)

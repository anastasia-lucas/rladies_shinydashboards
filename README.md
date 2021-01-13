# rladies_shinydashboards
Shiny Dashboards Workshop for R-Ladies Philly

Developed using R version 4.0.3

## Folder Structure

### ./

- `rladies_shinydashboards.Rproj`: R project file
- `utils.R`: library installs - can be run using `source("utils.R")`
- `rladies_shinydashboards.pdf`: slide deck for the meet-up

### data/
  
- `*_lyrics.txt`: word counts for each song in selected discography
- `*_edges.txt`: edge tables for shared words in songs in selected discography for creating networks - not used in these exercises
- `compile_data.R`: script used to generate data. All files were generated using the `genius` and `tidytext` packages

### exercises/

- `shinydashboard_exercises.Rmd`: fill in the blank Rmarkdown file for dashboard exercises
- `shinydashboard_exercises_advanced.Rmd`: fill in the blank Rmarkdown file for dashboard exercises - advanced topics
- `app_basic.R`: stanadlone example of the basic/blank dashboard

### solutions/

- `shinydashboard_exercises.Rmd`: solutions for dashboard exercises
- `shinydashboard_exercises_advanced.Rmd`: solutions for dashboard exercises - advanced topics
- `app_advanced.R`: standalone version of the advanced app

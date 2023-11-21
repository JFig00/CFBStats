#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source('global.R')
library(shinythemes)
source('extra.R')

fluidPage(shinythemes::themeSelector(),
  navbarPage(
  "CFB Stats",
  tabPanel(
    "Stats",
    sidebarPanel(
      radioButtons(
        "p_o_t",
        "Select Stat Type:",
        choices = list("Player" = 1, "Team" = 2),
        selected = 1
      ),
      sliderInput(
        "year",
        "Select Year:",
        min = 2013,
        max = 2022,
        step = 1,
        value = 2017,
        sep = ""
      ),
      selectInput(
        "conf",
        "Select Conference:",
        choices = c(
          filter(cfbd_conferences(), classification == "fbs")$abbreviation[1:11]
        ),
        selected = "ACC"
      ),
      conditionalPanel(
        "input.p_o_t==1",
        selectInput(
          "cat",
          "Select Player Category:",
          choices = c(unique(
            cfbd_stats_season_player(2022)$category
          )),
          selected = "passing"
        )
      )
    ),
    mainPanel(tableOutput("first_mod"))
  ),
  
  tabPanel(
    "Visualization",
    sidebarPanel(
      sliderInput(
        "year2",
        "Select Year:",
        min = 2013,
        max = 2022,
        step = 1,
        value = 2017,
        sep = ""
      ),
      selectInput(
        "conf2",
        "Select Conference:",
        choices = c(
          filter(cfbd_conferences(), classification == "fbs")$abbreviation[1:11]
        ),
        selected = "ACC"
      ),
      selectInput("stat",
                  "Select Statistic:",
                  choices = colnames(stat_col))
    ),
    mainPanel(plotOutput("second_mod"))
  ),
  tabPanel(
    "Draft Predictor",
    sidebarPanel(
      selectInput("pos",
                  "Select Position:",
                  choices = c(unique(
                    draft_data$position
                  ))),
      selectInput(
        "conf3",
        "Select Conference:",
        choices = c(
          filter(cfbd_conferences(), classification == "fbs")$abbreviation[1:11]
        ),
        selected = "ACC"
      ),
      numericInput("pdpr", "PreDraft Position Ranking:", 10, step =
                     1)
    ),
    mainPanel(h2("Results"),
              textOutput("result"))
  )
))

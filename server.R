#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source('global.R')

function(input, output) {
  source('switchit.R')
  output$first_mod <- renderTable({
    if (input$p_o_t == 1) {
      switchit(input$year, input$conf, input$cat)
    }
    else{
      arrange(
        cfbd_stats_season_team(
          year = input$year,
          season_type = "both",
          conference = input$conf
        ),
        team
      )
    }
  })
  output$second_mod <- renderPlot({
    y = cfbd_stats_season_team(input$year2, conference = input$conf2)
    ggplot(y, mapping = aes(team, y[[input$stat]])) + geom_bar(stat = "identity") +
      labs(y = input$stat)
  })
  
  output$result<-renderText(
    predict_draft(draft_data,input$pos,input$pdpr,input$conf3)
  )
}

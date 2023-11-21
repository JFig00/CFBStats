switchit<-function(years,conference,category){
  return(switch (category,
          "passing" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"completions"=passing_completions,
                                     "attempts"=passing_att,"pass yards"=passing_yds,"touchdowns"=passing_td,"interceptions"=passing_int),team),
          "rushing" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"carries"=rushing_car,
                                     "yards"=rushing_yds,"touchdowns"=rushing_td),team),
          "receiving" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"receptions"=receiving_rec,"yards"=receiving_yds,
                                       "touchdowns"=receiving_td),team),
          "fumbles" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"fumbles"=fumbles_fum,
                                     "recovered"=fumbles_rec,"lost"=fumbles_lost),team),
          "defensive" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"solo tackles"=defensive_solo,
                                       "total tackles"=defensive_tot,"tackles for loss"=defensive_tfl,"sacks"=defensive_sacks,"QB hurries"=defensive_qb_hur,"defensive touchdowns"=defensive_td),team),
          "kicking" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"field goals made"=kicking_fgm,
                                     "field goals attempted"=kicking_fga,"extra points made"=kicking_xpm,"extra points attempted"=kicking_xpa,"points"=kicking_pts,"longest"=kicking_long),team),
          "kickReturns" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"returns"=kick_returns_no,"yards"=kick_returns_yds,
                                         "longest"=kick_returns_long,"touchdowns"=kick_returns_td),team),
          "punting" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"punts"=punting_no,"yards"=punting_yds,"longest"=punting_long,
                                     "inside 20 yards"=punting_in_20),team),
          "puntReturns" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"returns"=punt_returns_no,"yards"=punt_returns_yds,
                                         "longest"=punt_returns_long,"touchdowns"=punt_returns_td),team),
          "interceptions" = arrange(select(cfbd_stats_season_player(year=years,season_type = "both",category=category,conference = conference),team,conference,player,category,"interceptions"=interceptions_int,
                                           "yards"=interceptions_yds,"touchdowns"=interceptions_td),team)
  ))
}


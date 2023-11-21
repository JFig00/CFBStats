
stat_col<-cfbd_stats_season_team(2013)[,5:ncol(cfbd_stats_season_team(2013))]

draft_data<-cfbd_draft_picks(2022)[FALSE,]
for(i in 2004:2022){
  draft_data<-rbind(draft_data,cfbd_draft_picks(i))
}

predict_draft<-function(d,pos,pdpr,conf){
  draft_data<-na.omit(draft_data)
  #round by position and predraft pos. ranking
  model_draft<-randomForest(round~position+pre_draft_position_ranking+college_conference,data=draft_data)
  #(model_draft)
  #overall by position and predraft pos. ranking
  model_draft2<-randomForest(overall~position+pre_draft_position_ranking+college_conference,data=draft_data)
  
  filter_data<-filter(draft_data, position==pos & pre_draft_position_ranking==pdpr & college_conference==conf)
  if(nrow(filter_data)==0){
    return("This Player will either be undrafted or their draft stock could not be predicted")
  }
  
  predraft<-mean(predict(model_draft,filter_data))
  predraft2<-mean(predict(model_draft2,filter_data))
  paste("Round:",round(predraft),"\nOverall:",round(predraft2))
}



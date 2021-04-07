#line 3-10 loads packages we need as of 4/7/21 (feel free to add packages)
#line 11-25 ishows how I got the data we need for the project
  devtools::install_github("abresler/nbastatR")
  library(nbastatR)
  if(!require(ggplot2)) install.packages("ggplot2")
  library(ggplot2)
  if(!require(dplyr)) install.packages("dplyr")
  library(dplyr)
  if(!require(plotly)) install.packages("plotly")
  library(plotly)
#draft position for players from 1989-2018
df_drafts <-
  drafts(draft_years = 1989:2018, nest_data = FALSE, return_message = TRUE)
View(df_drafts)
#player stats from 1989-2018 can change "totals" to "per_game" if needed  
player_stats<-bref_players_stats(seasons = 1989:2018, tables = c("totals"))
View(player_stats)
#filtering out players not drafted between 1989-2018
drafted_player_complete_stats <- inner_join(df_drafts,player_stats, by = "namePlayer")  
View(drafted_player_complete_stats)
#filtering stats we need
complete_stats<-select(drafted_player_complete_stats,yearDraft,numberPickOverall,numberRound,numberRoundPick,namePlayer,nameTeam,slugTeamBREF,slugSeason,slugPosition,agePlayer,countGames,pctFG,pctFG3,pctFG2,pctEFG,pctFT,ftmTotals,trbTotals,astTotals,stlTotals,blkTotals,tovTotals,pfTotals,ptsTotals)
View(complete_stats)
#saving as excel
write.csv(complete_stats, "draftedstats.csv")
#start off data viz code
#reading the csv is necessary because the package is buggy on rstudio.cloud
draftedstats<-read.csv("draftedstats.csv")
View(draftedstats)

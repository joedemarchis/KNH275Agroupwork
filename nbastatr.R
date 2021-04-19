#lines 9-16 loads packages we need as of 4/7/21
#feel free to add packages
#DO NOT RUN LINES 9 AND 10
#IT TAKES up ALL THE RAM ON RSTUDIO.CLOUD.
#only run them if working with rstudio desktop
#lines 17-29 shows how I got the data needed
#There are going to be some mistakes due to the data size
#For example look at Glen rice in "draftedstats"
  devtools::install_github("abresler/nbastatR")
  library(nbastatR)
  if(!require(ggplot2)) install.packages("ggplot2")
  library(ggplot2)
  if(!require(dplyr)) install.packages("dplyr")
  library(dplyr)
  if(!require(plotly)) install.packages("plotly")
  library(plotly)
  library(plyr)
  install.packages("magrittr")
  library(magrittr)

#draft position for players from 2004-2018
df_drafts <-
  drafts(draft_years = 2004:2018, nest_data = FALSE, return_message = TRUE)
View(df_drafts)
#player stats from 1989-2018 can change "totals" to "per_game" if needed
player_stats<-bref_players_stats(seasons = 2004:2018, tables = c("totals"))
View(player_stats)
#filtering out players not drafted between 2004-2018
drafted_player_stats <- inner_join(df_drafts,player_stats, by = "namePlayer")
View(drafted_player_stats)
#filtering stats we need
complete_stats<-select(drafted_player_stats,yearDraft,numberPickOverall,numberRound,numberRoundPick,namePlayer,nameTeam,slugTeamBREF,slugPosition,countGames,pctFG,pctFG3,pctFG2,pctEFG,pctFT,ftmTotals,trbTotals,astTotals,stlTotals,blkTotals,tovTotals,pfTotals,ptsTotals)
View(complete_stats)
#picks we need
cavspicks<-filter(complete_stats, numberPickOverall >= 3 & numberPickOverall <= 8)
View(cavspicks)
as.datta
#saving as excel
write.csv(cavspicks, "cavspicks.csv")
#start off data viz code
#reading the csv is necessary because the package is buggy on rstudio.cloud
draftedstats<-read.csv("draftedstats.csv")
View(draftedstats)
lol2<-players_careers(players = c("Joe Harris", "Myles Turner", "Spencer Dinwiddie"),
                modes = c("Totals", "PerGame"))
View(lol2)

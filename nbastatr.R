#line 2 may not be needed
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
#saving as excel
write.table(df_drafts, file = "df_drafts.csv",
            sep = "\t", row.names = F)
write.table(player_stats, file = "player_stats.csv",
            sep = "\t", row.names = F)
write.table(drafted_player_complete_stats, file = "drafted_player_complete_stats.csv",
            sep = "\t", row.names = F)
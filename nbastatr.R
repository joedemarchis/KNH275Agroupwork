devtools::install_github("abresler/nbastatR")
library(nbastatR)
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)
if(!require(plotly)) install.packages("plotly")
library(plotly)
#draft pos for players from 1989-2018
df_drafts <-
  drafts(draft_years = 1989:2018, nest_data = FALSE, return_message = TRUE)
View(df_drafts)
#player stats from 1989-2018
player_stats<-bref_players_stats(seasons = 1989:2018, tables = c("totals"))
View(player_stats)

devtools::install_github("abresler/nbastatR")
library(nbastatR)
if(!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)
if(!require(plotly)) install.packages("plotly")
library(plotly)
df_drafts <-
  drafts(draft_years = 1989:2018, nest_data = FALSE, return_message = TRUE)
View(df_drafts)
#trying to figure out how to get a list of all the player names from the df_drafts table inserted where
#"Joe Harris", "Myles Turner", etc.. is on the line below. 
totals <- players_careers(players = c("Joe Harris", "Myles Turner", "Spencer Dinwiddie"),
                modes = c("Totals", "PerGame"))


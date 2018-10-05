#Title: workout01-data-cleaning
#Description:
#   This script performs cleaning tasks and transformations on 
#   various columns of 'nba2018.csv'.
#Input(s): 'nba2018.csv'
#Output(s): what are the outputs created when running the script?

  
  
library(readr)
nba2018 <- read_csv("../data/nba2018.csv")

#Replace all the occurrences of "R" with 0,
#and then convert the entire column into integers.
factor(nba2018$experience)
sub <- gsub("R", "0", nba2018$experience)
nba2018[["experience"]] <- sub
nba2018$experience <- as.numeric(levels(factor(nba2018$experience)))[factor(nba2018$experience)]


#Transform salary so that you have salaries in millions:
#e.g. 1000000 should be converted to 1.
nba2018$salary <- nba2018$salary / 1000000

#position should be a factor with 5 levels: 'C', 'PF', 'PG', 'SF', 'SG'.
#Relabel these factors using more descriptive names 
levels(factor(nba2018$position))
nba2018$position[nba2018$position == 'C'] <- "center"
nba2018$position[nba2018$position == 'PF'] <- 'power_fwd'
nba2018$position[nba2018$position == 'PG'] <- 'point_guard'
nba2018$position[nba2018$position == 'SF'] <- 'small_fwd'
nba2018$position[nba2018$position == 'SG'] <- 'shoot_guard'

library(dplyr)
#missed_fg = missed field goals
nba2018 <- mutate(nba2018, missed_fg = nba2018$field_goals_atts - nba2018$field_goals )
#missed_ft = missed free throws
nba2018 <- mutate(nba2018, missed_ft = nba2018$points1_atts - nba2018$points1)
#rebounds = offensive rebounds + defensive rebounds
nba2018 <- mutate(nba2018, rebounds = nba2018$off_rebounds + nba2018$def_rebounds)
#efficiency = efficiency index
nba2018 <- mutate(nba2018, efficiency = ((nba2018$points + nba2018$rebounds + nba2018$assists +
                                            nba2018$steals + nba2018$blocks - nba2018$missed_fg - 
                                            nba2018$missed_ft - nba2018$turnovers) / nba2018$games)) 


sink(file = '../output/efficiency-summary.txt')
summary(nba2018$efficiency)
sink()


#sink(file = '../data/teams-summary.txt')
teams = select(nba2018, team, experience, salary, points3, points2, points1, points, off_rebounds, def_rebounds, assists, steals, blocks, turnovers, fouls, efficiency)
#teams = summarise(
# group_by(teams_table, team),
#  total_val = experience + salary + points3 + points2 + points1 + points + off_rebounds + def_rebounds + assists + steals + blocks + turnovers + fouls +efficiency
#)
#sink()


write.csv(teams, file = '../data/nba2018-teams.csv')























































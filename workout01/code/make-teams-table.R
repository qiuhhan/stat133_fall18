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








teams = data.frame(summarise(group_by(nba2018, team), experience = round(sum(experience),2), salary = round(sum(salary),2), points3 = round(sum(points3),2), points2 = round(sum(points2),2), points1 = round(sum(points1),2), off_rebounds = round(sum(off_rebounds),2), def_rebounds = round(sum(off_rebounds),2), assists = round(sum(assists),2), steals = round(sum(steals),2), blocks = round(sum(blocks),2), turnovers = round(sum(turnovers),2), fouls = round(sum(fouls),2), efficiency = round(sum(efficiency),2)))


sink(file = '../data/teams-summary.txt')
summary(teams)
sink()

write.csv(teams, file = '../data/nba2018-teams.csv')



#Include library
library(ggplot2)
library(dplyr)

#Read file
transfer <- read.csv("Transfer.csv")
transfer <- subset(transfer,Season=="2018-2019",select=c(Name,Team_to,Transfer_fee))

#Data process
team.count<- transfer %>%
  group_by(Team_to) %>%
  summarise(Count=n())
team.count <- subset(team.count,Count>4)
team.count <- data.frame(Team=team.count$Team_to,Number=team.count$Count)

#Depict
ggplot(data=team.count , aes(x=Team,y=Number,fill=Number))+geom_bar(stat = "identity")+labs(title="2018 Team Transfer",x="Team",y="# of player")

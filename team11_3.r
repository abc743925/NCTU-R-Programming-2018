#Include library
library(ggplot2)
library(dplyr)
library(scales)

#Read file
transfer <- read.csv("Transfer.csv")
transfer <- subset(transfer,Season=="2018-2019",select=c(Name,Team_to,Transfer_fee))

#Data process
team.price<- transfer %>%
  group_by(Team_to) %>%
  summarise(Price=sum(Transfer_fee))
team.price <- subset(team.price,Price>80000000)
total <- sum(team.price$Price)
team.price$Price <- team.price$Price/total*100
data <- data.frame(Team=team.price$Team_to,Price=team.price$Price)
data <- arrange(data,desc(Price))
data

#Depict
g <- ggplot(data=data, aes(x="",y=Price,fill=Team)) + geom_bar(width=1, stat="identity")
pie <- g + coord_polar("y", start=0)+
      labs(title="2018 Top 10 BUYER",x="",y="")
pie
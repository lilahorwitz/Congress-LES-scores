setwd("/Users/lilahorwitz/Desktop/POLI 100X/poli 100x/week 5")
#Clear environemnt 
rm(list = ls())
# Load the csv data file
LESdata <- read.csv("LESCongress.csv")
#note: this data is Legislative Effectiveness Data from 93rd-110th Congress (1973-2008)
#load package in order to use fixed effects
library("fixest")
#load packages to make summary stat tables and graphs
library("psych")
library("tidyverse")
library("ggplot2")
library("gridExtra")

#basic regression LES on votepct, control for leslag
regressbasic<-lm(les~votepct+leslag, data=LESdata)
regresscontrols<-lm(les~votepct+leslag+seniority+majority, data=LESdata)
summary(regressbasic)
summary(regresscontrols)

#regression LES on votepct, with control leslag (previous LES) using interaction term leslag*votepct 
regress1<-lm(les~votepct+leslag+leslag:votepct, data=LESdata)
summary(regress1)

#regression LES on votepct, controlling for LESlag (previous LES) , using 
#interaction term, seniority 
regress2<-lm(les~votepct+leslag+seniority+majority+leslag:votepct, data=LESdata)
summary(regress2)

#regression LES on votepct (vote percent), controlling for LESlag (previous LES),
#using interaction term, seniority adding fixed effect for icpsr (member id)
fixed_1<-feols(les~votepct+leslag+seniority+majority+leslag:votepct |
                 icpsr, data=LESdata)
summary(fixed_1)

#make new table with only variables used
LESdata2<-LESdata%>%select(votepct, leslag, seniority, majority)%>%
  mutate(lesl_vo_inter=leslag*votepct)
#making tables for final project report
describeBy(LESdata2, na.rm=TRUE)
summary(LESdata2, na.rm=TRUE)

#basic plot
plot(LESdata$votepct, LESdata$leslag)
#better ones
#plot vpct against les
plot1<-ggplot()+geom_point(data=LESdata, aes(x=votepct, y=les),alpha = 0.3, 
                           color="darkblue", size=0.7 )+
  labs(y="LES", x="Vote Percent Received to enter Congress")
plot1
#plot vpct against leslag
plot2<-ggplot()+geom_point(data=LESdata, aes(x=votepct, y=leslag),alpha = 0.3, 
                           color="blue", size=0.7 )+
  labs(y="Previous LES", x="Vote Percent Received to enter Congress")
plot2

#arrange plots to be on top of each other
grid.arrange(plot1, plot2, ncol = 1)



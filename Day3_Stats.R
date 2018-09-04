### Day 3###########################################
# Some basic Statistical analyses covering:
# probability distributions
# Linear regression	
# Anova 
# t test
# this is not a lecture on Stats, but a lecture on Stats in R!

library(ggplot2)
#### General summary statistics ####
summary(CO2)
mean(CO2$uptake)
median(CO2[CO2$conc=="95",]$uptake)
sd(CO2[CO2$conc=="95",]$uptake)
var(CO2[CO2$conc=="95",]$uptake)

### Models and Regressions ####
# first plot data
plot(CO2$conc,CO2$uptake)
          
# linear regression assumptions: normality -  qq plot
qqnorm(CO2$uptake, pch = 1)
qqline(CO2$uptake, col = "red", lwd = 2)

#create a linear regression model
CO2.mod <- lm(uptake ~ conc+Treatment, # regression formula
              data=CO2)
names(CO2.mod)
summary(CO2.mod)
names(CO2.mod)
predictCO2<-data.frame()
predict(CO2.mod,predictCO2)

#or do an anova
CO2.aov2 <- aov(uptake ~ conc+Treatment, data = CO2)
summary(CO2.aov2)

### Probability Distributions ####
set.seed (234) # is your best friend for reproducibility 
runif(100,0,1)
?runif()
rnorm(n=20,mean=10,sd=2)
pnorm(1.4,mean=1.8,sd=0.5)


# 1) do a linear regression on the dataset::trees with girth and height and volume, with whatever hypothesis you can come up with
# 3) create the following scenario: a friend bets he will get no more than 5 heads in  20 coin flips.
# except they do not know that the coin is heavy and heads are favored 80% to tails (20%). What is
# the probility he can get 5? What is the probability he'll get more more than 7? use the dbinom and pbinom functions
dbinom(5, size=20, prob=0.2) 
1-pbinom(7, size=20,prob=0.2)

# You ordered 50 seedlings and expect based on lit review that they will be 20 cm in 6 weeks; tall enough for your first experiment.
# Based on a simple linear regression, which you also plot, are you optimistic that they will get to 25cm?

write.csv(seedlingGrowth,"seedlingGrowth.csv")

lm(Height~Day,data=seedlingGrowth)
ggplot(seedlingGrowth,aes(x=Day,y=Height)) + 
  geom_point()+
  geom_smooth(method="lm",fullrange=TRUE)+
  scale_x_continuous(limits = c(0, 50))
  scale_y_continuous(limits = c(0, 50))
  
#You can get your money back if you do a t-test and can suggest your plants didnt grow to 13 cm by week 4.
model<-lm(Height~Day,data=seedlingGrowth)
t.test(seedlingGrowth[seedlingGrowth$Day<29 &seedlingGrowth$Day>25,2],rep(13,50))

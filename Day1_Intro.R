### Day 1###########################################
# This is an R script. The file extension is ".R"
# At the beginning of every script
# provide some details about what, why, when.
# annotations/ notes require a "#" before it.
# If you try to execute/run this line, nothing happens
# Everything that comes after a # doesnt get run 

# This the first day of the R class, covering:
#.	Data Input/Output 
#.	Packages
#.	Creating Data: Variables and objects
#.	Manipulating Data
#.	Introduce datasets::CO2 for them to use again datasets::CO2

### First Things First #############################
# Describe parts of Rstudio: Script, Console, Environment.
# See what the current working directory (wd) is
# and then set it to another location (where the file is)
getwd() 
setwd()

### Topic 1: Data 

#Math ####
5+4
10*4+2
cos(82) # note the curved parentheses here

#Assignment (of values to objects) ####
#More details at http://stat.ethz.ch/R-manual/R-patched/library/base/html/assignOps.html
#We will see cases of <-, =, and ==
x<-5+4 #preferred
y=10*4+2  
sum(x,y)
x==10
z==4 # what is going on here? 
#more logic stuff tomorrow


#Object/Data types and structures ####
#More details at https://swcarpentry.github.io/r-novice-inflammation/13-supp-data-structures/

#types: character, numeric, integer, logical, complex
# using is.x and as.x
is.numeric(4)
is.integer(4)
is.double(4) #why?
is.integer(4L) #takes up less space
is.logical(10)
z<-10*4^(1/3) #what class is z?
z_new<-as.integer(z) # makes it an integer and adds an L

#structures:Vectors, Matrices, Dataframes, Lists
aVector<-c(1,3,2.5,2)
bVector<-aVector*1.3 ; bVector
aVector<-c(1, 3, 2.5, 2)
bVector<-aVector*1.3 ; bVector # Note: a semi-colon is functionally equivalent to a carriage return; it will execute the statement after it as a fresh line.
cVector<-sort(aVector,decreasing=FALSE);cVector
dVector<-rep(1,10)
eVector<-seq(from=2,to=42,by=4)

#Matrix: entries are all one type
aMatrix<-matrix(data = c(4,13), nrow = 3, ncol = 2, byrow = FALSE, dimnames = NULL) # 2-dimensional

#vs. Dataframe: columns can be of different types
aDataframe<-data.frame() #create empty dataframe
people <- c("Alex", "Barb", "Carl") # col 1
ages <- c(19, 29, 39)  # col 2
aDataframe <- data.frame(people, ages)  # create
colnames(aDataframe)
rownames(aDataframe)
aDataframe$people # a dollar sign extracts columns of that name
aDataframe$height<-c("short","tall","tall")
str(aDataframe)
aDataframe_asMatrix<-as.matrix(aDataframe)

#Lists
aList<-list(aVector,aMatrix,aDataframe)
aList<-list(aVector=aVector,aMatrix=aMatrix,aDataframe=aDataframe)

#Basic Data Manipulation ####
#index,extract,subset
length(aVector)
aVector[3] # square brackets extract from vectors, matrices
aMatrix[2,2] # comma to differentiate between rows and columns
dim(aMatrix)
aMatrix[2,1] 
aMatrix[1:3,1] #what's another way to get the same answer?
aMatrix[c(1,2,3),1]
aList[[1]] # double square brackets extract from a list

rbind(aVector,bVector)
cbind(aVector,bVector)
cbind(aVector,c(1,3,3,3,bVector))

# Reading and Writing ###
datasets::CO2
head(CO2)
tail(CO2)
View(CO2)
summary(CO2)
CO2<-CO2
write.csv(CO2,file="CO2.csv")
C02<-read.csv("CO2.csv",header=TRUE)

### HALP ###
?summary() # {package}
# Google queries

#Exercises ####
# 1) Extract from aList the third element in the first item 
firstItem<-aList[[1]]
firstItem[3]
aList[[1]][3]


# 2) How many entries are in CO2, and what features are being recorded? 
str(CO2)
dim(CO2)

# 2) What is the uptake rate of the 54th plant? What are the units of the uptake rate? 
CO2$uptake[54] ; "umol/m^2 sec"

# 3) What is the average uptake rate of Mississippi plants that were chilled?
mean(CO2[])
ChilledPlants<-CO2[CO2$Treatment=="chilled",]
MSplants<-ChilledPlants[ChilledPlants$Type=="Mississippi",]
mean(MSplants$uptake)

# 4) What is the total uptake rate of all the plants?
sum(CO2$uptake)
# 5) Change the concentration values to be of type 'factor' rather than of type 'numeric'
CO2$conc<-as.factor(CO2$conc)
# 6) What is the 'type' for uptake? Change it to type 'integer'. 
class(CO2$uptake) ; CO2$uptake<-as.integer(CO2$uptake)
# 7) What is the maximum uptake rate? Lowest uptake rate?'
max(CO2$uptake); min(CO2$uptake)
summary(CO2)


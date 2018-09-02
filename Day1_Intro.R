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
is.logical(TRUE)
z<-10*4^(1/3) #what class is z?
z_new<-as.integer(z) # makes it an integer and adds an L

#structures:Vectors, Matrices,Arrays, Dataframes, Lists

aVector<-c(1,3,2.5,2)
bVector<-aVector*1.3 ; bVector
cVector<-sort(aVector)
dVector<-rep(1,10)
eVector<-seq(from=2,to=42,by=4)

aMatrix<-matrix(data = c(4,13), nrow = 3, ncol = 2, byrow = FALSE, dimnames = NULL) # 2-dimensional
#anArray<-array(data=c(3,15),dim=c(2,2,2)) # multi-dimensional

aDataframe<-data.frame()
people <- c("Alex", "Barb", "Carl") # col 1
ages <- c(19, 29, 39)  # col 2
colnames(aDataframe)
rownames(aDataframe)

aDataframe <- data.frame(people, ages)  # create
aList<-list(aVector,aMatrix,anArray,aDataframe)
aList<-list(aVector=aVector,aMatrix=aMatrix,anArray=anArray,aDataframe=aDataframe)


#Basic Data Manipulation ####
#index, extract,subset
length(aVector)
aVector[3] # square brackets extract from vectors, matrices
aMatrix[4,3] # comma to differentiate between rows and columns
dim(aMatrix)
aMatrix[2,1] 
aMatrix[1:3,1] #what's another way to get the same answer?
aList[[1]] # double square brackets extract from a list
aDataframe$people # a dollar sign extracts columns of that name 

rbind(aVector,bVector)
cbind(aVector,bVector)


# Reading and Writing ###
datasets::CO2
?CO2
dim(CO2)
head(CO2)
View(CO2)
summary(CO2)
write.csv(CO2,file="CO2.csv")
C02<-read.csv(CO2.csv,header=TRUE)

#Exercises ####
# 1) What is the uptake rate of the 54th plant?
# 2) What is the average uptake rate of Mississippi plants that were chilled?
# 3) How many plants had greater uptake rates than 30 umol/m^2?
# 4) What is the total uptake rate of all the plants?
# 5) Change the concentration values to be factors rather than values
# 6) 


### Day 1###########################################
# At the beginning of every script
# provide some details about what, why, when
# annotations/ notes require a "#" at the beginning of the line
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
# and then set it to another location
getwd() 
setwd()

### Topic 1: Data 

#Math ####
5+4
10*4+2
cos(82)

#Assignment (of values to objects) ####
#More details at http://stat.ethz.ch/R-manual/R-patched/library/base/html/assignOps.html
#We will see cases of <-, =, and ==
x<-5+4 #preferred
y=10*4+2  

#Object/Data types and structures ####
#More details at https://swcarpentry.github.io/r-novice-inflammation/13-supp-data-structures/

#types: character, numeric, integer, logical, complex
is.numeric(4)
is.integer(4)
is.double(4) #why?
is.integer(4L) #takes up less space
is.logical(TRUE)
z<-10*4^(1/3)
z_new<-as.integer(z) # makes it an integer and adds an L

#structures:Vectors, Matrices,Arrays, Dataframes, Lists
#maybe save arrays for later?
aVector<-c(1,3,2.5,2)
bVector<-aVector*1.3 ; bVector
cVector<-sort(aVector)
dVector<-rep(1,10)
eVector<-seq(from=2,to=42,by=4)
aMatrix<-matrix(data = (4,13), nrow = 3, ncol = 2, byrow = FALSE,
                dimnames = NULL) # 2-dimensional
anArray<-array(data=c(3,15),dim=c(2,2,2)) # multi-dimensional
aDataframe<-data.frame()
people <- c("Alex", "Barb", "Carl") # col 1
ages <- c(19, 29, 39)  # col 2
aDataframe <- data.frame(people, ages)  # create
aList<-list(aVector,aMatrix,anArray,aDataframe)

#Basic Data Manipulation ####
#index, extract,subset
length(aVector)
aVector[3]
aMatrix[4,3]
dim(aMatrix)
aMatrix[2,1]
aMatrix[1:3,1]
aList[[1]]

rbind(aVector,bVector)
cbind(aVector,bVector)
colnames(aDataframe)
rownames(aDataframe)

# Reading and Writing ###
dim(USArrests)
head(USArrests)
View(USArrests)
write.csv(USArrests,file="USArrests.csv")
read.csv(usArrests.csv,header=TRUE)

#Exercises ####
# 1) What value is in the 3rd row and 2nd column of 'aMatrix'?
# 2) What do you get when you add the last row of 'aMatrix' and the 
#    2nd row and 2nd column of the 3rd item in 'aList'?
# 3) rename the rows of 'aDataframe' to be a, b, and c.
# 4) using the functions seq, rep, sort, cbind, create all 25 x,y coordinates
#   that uses all odd numbers up to 10. 
#   e.g., (1,1), (1,3), (1,5), ... , (9,9)
#   Hint: start with x values first.
# 5) remove duplicates, count uniques ; which rows have certain values

#Assignment ####
#Find a dataset for Day 5, and email to Instructors. Either a dataset you have to do analyses on for class or research, or choose one from the ones provided in class
#datasets::
#?iris()
#https://www.springboard.com/blog/free-public-data-sets-data-science-project/
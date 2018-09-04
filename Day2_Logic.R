# Intro to logical operations and subsetting in R

# T/F what are they? ---------------------------------------------------------------------------------------------------

# Internally, logical values TRUE and FALSE are stored as 1 and 0 respectively. Also known as Boolean vectors. 
# These are the simplest representations of data.
# Can represent as 'TRUE', or 'T', 'FALSE' or 'F'.

(logivec = rep(c(TRUE, FALSE), 2))
(logivecT = rep(T, 4))
(logivecF = rep(F, 4))

class(logivec)

as.integer(logivec)

# What are logical operations?
# Most of the operations below are pair-wise, meaning that every vector index is compared to the same index of other vectors.

# LOGICAL NOT (negation of a logical vector)

!logivec

# LOGICAL AND (which elements of vectors are ALL true?)

logivec & logivecT # The first and third positions of both vectors are ALL true.

# Notice that there won't be any TRUE's when logivecF is included

logivec & logivecT & logivecF # None of the positions in these vectors are ALL true, since logivecF is all FALSE.

# LOGICAL OR (which elements of vectors have *at least* one TRUE?)

logivec | logivecT # All true
logivec | logivecF # First and third

# LOGICAL XOR (which elements have one, and ONLY one TRUE)

xor(logivec, logivecT) # The second and fourth positions; see them together to see why
cat(logivec, '\n', logivecT) # What's this? A way to print data neatly to the console, in a fairly raw format. Similar to concatenate in Excel

# What should we get if we run xor(logivecT, logivecF) ?
xor(logivecT, logivecF)





# Logical vectors and their uses

# Tests of equality/inequality ---------------------------------------------------------------------------------------------------

# Mathematical equality

# Is `2 + 2 = 5` a true statement?
2 + 2 == 5

5 == sqrt(25)

1 > 0   # T 
1 >= 0  # T
1 == 0  # F 
1 <= 0  # F
1 < 0   # F
1 != 0  # T (logical NOT)

# What happens if we do this? 1 OR 0? 
1 | 0 
# What happens if we do this?
1 | 1   # T
0 & 1   # F
0 & 0   # F
1 & 1   # T

# Recall, T/F stored as 1/0, respectively

# Other value equality

# Works with characters
"A" == "A"
"B" == "A"

# Works with objects

bignum = 1e6

bignum == bignum

# What about missing values?

is.na(NA)
is.null(NULL)

# Don't try to use direct comparison though! Rstudio will display a warning here.

NA == NA
NULL == NA
NA == NULL








# Vector operations --------------------------------------------------------------------------------------------------------------

# All the operations above Work with vectors - pairwise comparisons; 
# compare a[1] to b[1], 
#         a[2] to b[2], 
#         a[3] to b[3], etc.

# Set values for a & b
(a = 1:10)
(b = c(1:5, 11:15))

a == b # The first five elements are the same, the rest are not

c = c(1:10, NA)

is.na(c) # last element is found to be NA. Again, don't use `==` ! 

# Already we can see the use of this - we can find (and/or remove) missing data!

# How do we see if two vectors are **exactly** alike?

identical(a,b)
identical(a,a)

# identical() is good for testing EXACT equality of OBJECTS, not just their
# values! Note, if there's an attribute like rownames that doesn't match up,
# identical will return FALSE!

d = a                    # d startss off the same as a
identical(a,d)           # d is identical to a at this point

names(d) = letters[1:10] # Set name attribute for each element of c
d                        # Each element (numbers) has a name attribute (letters) above it.

identical(a,a)           # a is still identical to a
identical(a,d)           # d is now NOT identical to a

# While `d` still has the same values as `a`, the OBJECTS are not completely the same. 

# Use all() alongside comparisons to test for value equality
# all() asks, are all the elements in the vector contained true?

all(a == d)              # Evaluates to TRUE because we are only comparing the VALUES. Be careful with identical() and all.equal().

# Similar to all() is any(), which asks within the contained vector, is ANY value true? 

# Will return TRUE with at least one true in the contained vector. Will only return false if ALL are false.

any(a == b)

# Matrix operations --------------------------------------------------------------------------------------------------------------

# A matrix is a bunch of equal-length vectors put together. We can put together a and b from above

ab_mat = matrix(data = c(a,b), nrow = 10, ncol = 2)           # I'm saying the data is a, followed by b, with 10 rows (length of vectors a & b), and 2 columns (two vectors)

ba_mat = matrix(data = c(b,a), nrow = 10, ncol = 2)           # What if we put it in the other way?

ab_mat
ba_mat

# Notice that the order of the data matters. a is in the first column in ab_mat, whereas b is in the first column in ba_mat.
# It may feel odd that the software fills in data by columns because we are accustomed to writing left-to-right.

# R defaults to filling in what's called column-major order, but it is ultimately irrelevant to the end-user because filling in by column-major order is the same as filling in by row-major order of the transpose matrix. The concern here rests squarely with the underlying memory structures.




# Tests of structure --------------------------------------------------------------------------------------------------------------

# Usually prefixed by 'is'

is.integer('a')

is.integer(integer(1))

is.character(23)

is.character('ABC')

is.logical(0)

is.logical(F)

isTRUE(F)

isTRUE(T)

# Most often used in control structures







# Subsetting/indexing -----------------------------------------------------------------------------------------------------------

# A really important part of R, and programming in general
# Sometimes we want to see, usem or manipulate a part of an object, and not the whole thing. 

# Methods for subsetting - By index ------------------------------------------------------------------------------------------

# R begins indexing at 1, and goes to N. Other programming languages start at 0 and go to N-1. Be careful!

a[0]         # There isn't a 0th index in R; integer(0) is R's way of holding an empty object that was set up to be an integer.
a[1]         # This is the first index
a[2]         # Second
             # ...
a[length(a)] # you can pass any object that evaluates to integers to index! Very useful.

head(a)      # Easy way to subset the first 6 values. Use argument `n` inside head(n = N) to set custom length.
tail(a)      # Same as head, but from the bottom.




# Revisit example with NA's above. How do we remove missing data from vector c?

c         # Missing value in 11th slot
# We could just subset c from 1:10

c[1:10]   # No NA

# But what if c was different, and really big?

c_long = sample(c, size = 1e5, replace = T)

table(c_long, useNA = 'always') # Note that there are about 9000 <NA> values. The argument `useNA` sets an option to count NA values - off by default.

# There are NA's, but it would be really cumbersome to remove them by hand. We
# want to subset `c_long` to include only the non-empty values. 

# We can subset by finding the indices of the NA values, using `which`; we get all the corresponding indices

(na.index = which(is.na(c_long)))

# If we pass this to c_long as an index, we should only see NA's

c_long[na.index]

# If the output is truncated, how do we know it's all NA's? Use a logical test

all(is.na(c_long[na.index]))

# Or use table() if it's not continuous values

table(c_long[na.index], useNA = 'always')






# Methods for subsetting - By index ------------------------------------------------------------------------------------------

# But wait - there's another way to subset, and that's by logical vector. If we pass a vector of true/false to an index, we can 'turn on/off' each index in turn. 

length(a)                             # There are 10 elements in `a`
logindex = c(rep(T, 5), rep(F,5))     # We need a vector of 10 logical elements. Let's see what happens if we set the first five to TRUE and the last to FALSE

a[logindex]                           # We receive back ONLY those elements that correspond to TRUE in logindex - that is 1:5.

# Notice that on line 216 when we asked for the indices of the NA values, we also used is.na. Recall that this is a logical test for NA values, and returns a logical vector of TRUE's corresponding to NA positions, and FALSES otherwise.

# This is the better way to subset over supplying indices themselves, because you can always ask for the inverse.

(na.index = is.na(c_long)) # Skip the which() statement for the index positions, and just get a logical vector of same length as c_long

c_clean = c_long[!na.index]          # If we want only those values that AREN'T NA, then we can just invert this logical vector with a logical NOT

# Test this

summary(c_clean)                     # No NA's

# An easy way to clean matrices and data.frames

c_long_mat = cbind(c_long, c_long + 1)                 # Make a new matrix with missing values

c_long_mat_index = complete.cases(c_long_mat)          # Get only those rows with 'complete cases', or no NA's. The result is a logical vector with the same length as the number of rows in the original matrix

c_long_mat_clean = c_long_mat[c_long_mat_index,] # Subset to obtain those rows without ANY NA's.

# Always prove to yourself that it worked! 

# EXERCISES

# Devise two tests to see that c_clean is indeed clean of NA values. ------------------------------------------------

# Clean the airquality dataset --------------------------------------------------------------------------------------

airquality %>% head

# CO2 dataset exercises

CO2 %>% head

# Formatting data - Categorical covariates --------------------------------------------------------------------------------------

# Often, covariates in a model are categorical, meaning they take on a few discrete values. The way to format this data for analysis is called dummy coding. 
# Load the dummy coded data

load('dummyCode.Rdata') # The object is named 'dummyCode'. Note that objects are named as they are saved, and .Rdata files can contain multiple objects, so don't assign it to an object here!

head(dummyCode)

# Load the adirondack habitats data, and using logical expressions, obtain a dummy-coded matrix. 

load('adk_habitats.Rdata')

# The object `habSummary` has a value for every single grid cell in the Adirondacks. 
# There are four levels; 0, 1, 2, 3, 4, representing categories for 'other', 'conifer', 'deciduous', 'mixed', and 'wetland' specifically.

str(habSummary)

# Exercise: Format the data to obtain the same matrix as dummyCode. Devise a test or two to verify that it is correct.


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# Control statements ---------------------------------------------------------------------------------------------------

# Control statements will execute parts of the script conditionally, in pre-defined loops, or indefinitely until a condition is met.

# There are several main control statements

# if(test){do_this}  -  use to execute lines of code conditionally on a logical test passed as an argument. Braces are used to bind the part of the script to be run.

c
(test = any(is.na(c)))

if(test){
  
  c = c[!is.na(c)]
  
}



# 
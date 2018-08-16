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
cat(logivec, '\n', logivecT)

# What should we get if we run xor(logivecT, logivecF) ?
xor(logivecT, logivecF)





# Logical vectors and their uses

# Tests of equality/inequality ---------------------------------------------------------------------------------------------------

# Mathematical equality

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

# Don't try to use direct comparison though!

NA == NA
NULL == NA
NA == NULL








# Vector operations --------------------------------------------------------------------------------------------------------------

# All the operations above Work with vectors - pairwise comparisons; compare a[1] to b[1], a[2] to b[2], etc.

(a = 1:10)
(b = 7:17)

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

d = a                    # c startss off the same as a
names(d) = letters[1:10] # Set name attribute for each element of c
d                        # Each element (numbers) has a name attribute (letters) above it.

identical(a,a)
identical(a,d)

# While `d` still has the same values as `a`, the OBJECTS are not completely the same. 

# Use all() alongside comparisons

all(a == d)              # Evaluates to TRUE because we are only comparing the VALUES. Be careful with identical(), all.equal().

# Matrix operations --------------------------------------------------------------------------------------------------------------

# A matrix is a bunch of equal-length vectors put together. We can put together a and b from above

ab_mat = matrix(data = c(a,b), nrow = 10, ncol = 2)           # I'm saying the data is a, followed by b, with 10 rows (length of vectors a & b), and 2 columns (two vectors)

ba_mat = matrix(data = c(b,a), nrow = 10, ncol = 2)           # What if we put it in the other way?

ab_mat
ba_mat

# Notice that the 

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

# We can subset by finding the indexes of the NA values, using `which`

na.index = which(is.na(c_long))

# If we pass this to c_long as an index, we should only see NA's

c_long[na.index] 

# Methods for subsetting - By index ------------------------------------------------------------------------------------------

# But wait - there's another way to subset, and that's by logical vector. If we pass a vector of true/false to an index, we can 'turn on/off' each index in turn. 

length(a)                             # There are 10 elements in `a`
logindex = c(rep(T, 5), rep(F,5))     # We need a vector of 10 logical elements. Let's see what happens if we set the first five to TRUE and the last to FALSE

a[logindex]                           # We receive back ONLY those elements that correspond to TRUE in logindex - that is 1:5.

# Notice that on line 216 when we asked for the indexes of the NA values, we also used is.na. Recall that this is a logical test for NA values, and returns a logical vector of 

# Control statements ---------------------------------------------------------------------------------------------------
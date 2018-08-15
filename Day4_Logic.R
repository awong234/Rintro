# Intro to logical operations in R

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

# What about missing values?

is.na(NA)
is.null(NULL)

# Don't try to use direct comparison though!

NA == NA
NULL == NA
NA == NULL
logical(0) == NULL







# Vector operations --------------------------------------------------------------------------------------------------------------

# All the operations above Work with vectors - pairwise comparisons; compare a[1] to b[1], a[2] to b[2], etc.

(a = 1:10)
(b = c(1:5, 7:11))

a == b # The first five elements are the same, the rest are not

c = c(1:10, NA)

is.na(c) # last element is found to be NA. Again, don't use `==` !

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

# Subsetting/indexing -----------------------------------------------------------------------------------------------------------

# Control statements ---------------------------------------------------------------------------------------------------s
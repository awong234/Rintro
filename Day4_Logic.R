# Intro to logical operations in R

# T/F what are they? ---------------------------------------------------------------------------------------------------

# Internally, logical values TRUE and FALSE are stored as 1 and 0 respectively. Also known as Boolean vectors. 
# These are the simplest representations of data.

(logivec = rep(c(TRUE, FALSE), 2))
(logivecT = rep(TRUE, 4))
(logivecF = rep(FALSE, 4))

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
xor(logivecT, logivecF) # All TRUE.





# Logical vectors and their uses

# Subsetting/indexing -----------------------------------------------------------------------------

# Tests of equality/inequality ---------------------------------------------------------------------------------------------------

# Tests of structure --------------------------------------------------------------------------------------------------------------

# Control statements ---------------------------------------------------------------------------------------------------s
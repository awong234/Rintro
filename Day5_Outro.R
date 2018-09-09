# # # Day 5 # # # 

# Code style
# Best practices
# Other tips

# Code styling, organization -------------------------------------------------------------

# COMMENT COMMENT COMMENT
# There is nothing more important than comments.
# Make them easy to read, and organize them using headers.
# Any comments are better than none. You WILL forget what you did years hence, and others will not know.
# COMMENT COMMENT COMMENT 

# Returns for organization ---------------------

# Why is this line problematic?

out=matrix(data=NA,nrow=200,ncol=2);for(i in 1:2){out[,i]=rpois(n=200,lambda=3)}

# This is much clearer - carriage returns make reading code easier; Excel can't do this!

out = matrix(data = NA, nrow = 200, ncol = 2)

for(i in 1:2){
  
  out[,i] = rpois(n = 200, lambda = 3)
  
}

# Indentation for organization ---------------------

# R does not keep track of indentation, so the following two are equivalent:

out = array(data = NA, dim = c(3,3,3))
set.seed(1)
for(i in 1:3){
for(j in 1:3){
for(k in 1:3){
out[i,j,k] = rpois(n = 1, lambda = 10)
}
}
}

out_2 = array(data = NA, dim = c(3,3,3))
set.seed(1)
for(i in 1:3){
  for(j in 1:3){
    for(k in 1:3){
      out_2[i,j,k] = rpois(n = 1, lambda = 10)
      } # Ending brackets . . .
    }# . . . are easier . . .
  }# . . . to match to start

identical(out, out_2)

# OR add some additional carriage returns so it's not so cluttered

out_2 = array(data = NA, dim = c(3,3,3))

set.seed(1)

for(i in 1:3){ # Annotate what this loop represents
  
  for(j in 1:3){ # Annotate each one
    
    for(k in 1:3){ # So your readers and your future self know.
      
      out_2[i,j,k] = rpois(n = 1, lambda = 10)
      
    }
    
  }
  
}

# Using returns to unclutter things ---------------------

# Rstudio will take care of a LOT of formatting for you. Easiest to accept its conventions.

# Normal

3 + 6

# Any hanging operator followed by a carriage return will take the next line to
# complete the command. These are silly examples, but they are very useful.

3 + 
  6

3 >
  6


# Operators include math operations, logical operations, %>%, commas, parentheses, braces, brackets

# Reflow long expressions . . . 

theta = exp(
  beta_1 * big_matrix[,1] + 
  beta_2 * big_matrix[,2] + 
  beta_3 * big_matrix[,3] + 
  beta_4 * big_matrix[,4] + 
  beta_5 * big_matrix[,5] + 
  beta_6 * big_matrix[,6] 
  )

# . . . so that you can see the components easier than if they were on one line. 

theta = exp(beta_1 * big_matrix[,1] + beta_2 * big_matrix[,2] + beta_3 * big_matrix[,3] + beta_4 * big_matrix[,3] + beta_5 * big_matrix[,3] + beta_6 * big_matrix[,3])


# Say you have a functionw with a lot of arguments, potentially with long names

test_fn = function(argument_1, argument_2, argument_3, argument_4, argument_5, argument_6){
  
  sum(argument_1, argument_2, argument_3, argument_4, argument_5, argument_6)
  
}

# You can separate and unclutter arguments by including carriage returns

# Run test_fn all in one line.

test_fn(argument_1 = 1, argument_2 = 3, argument_3 = 5, argument_4 = 7, argument_5 = 9, argument_6 = 11)

# Or, include returns for clarity. Helpful when argument names are really long,
# so that they don't run off the page. Easier to identify typos.

test_fn(argument_1 = 1,
        argument_2 = 3,
        argument_3 = 5,
        argument_4 = 7,
        argument_5 = 9,
        argument_6 = 11
        )


# Best practices -------------------------------------------------------------------------

# Object names ---------------------

# Name format ----------------------

# This is very subjective; take with grains of salt.

# Typical naming formats 

# camelCase
# names have no spaces or symbols separating letters; instead, new words after the first get Capitalized.

aSquareMatrix = matrix(data = 1:9, nrow = 3, ncol = 3)

# snake_case 
# Generally no capitalization, but words are instead separated by underscores.

a_square_matrix = matrix(data = 1:9, nrow = 3, ncol = 3)

# Evidence is mixed as to which one is 'better'.

# http://www.cs.kent.edu/~jmaletic/papers/ICPC2010-CamelCaseUnderScoreClouds.pdf
# http://citeseerx.ist.psu.edu/viewdoc/download;jsessionid=376163100A8301ECD04E9CECBE0F834F?doi=10.1.1.158.9499&rep=rep1&type=pdf
# https://softwareengineering.stackexchange.com/questions/27264/naming-conventions-camelcase-versus-underscore-case-what-are-your-thoughts-ab


# MAIN TAKEAWAY is be consistent, but try them out and be open to any naming convention. 

# The names of objects -------------------------

# Object names should be sufficiently descriptive to deduce what it is.

a_square_matrix = matrix(data = 1:9, nrow = 3, ncol = 3)

# . . . is better than . . . 

m = matrix(data = seq(1,9), nrow = 3, ncol = 3)

# Vectorization ---------------------

# Where possible, use vectorized, optimized functions instead of loops.

# Column means

n = 1e2

x = matrix(data = rnorm(n = n^2, mean = 0, sd = 1), nrow = n, ncol = n)

manual_colMeans = function(x){
  
  out = vector(mode = 'numeric', length = 3)
  
  for(i in 1:ncol(x)){
    
    out[i] = mean(x[,i])
    
  }
   
  return(out)
  
}

# Use the optimized function instead.

colMeans(x)

(item = microbenchmark::microbenchmark("Manual" = manual_colMeans(x), "Optimized" = colMeans(x), times = 1e2))

microbenchmark::autoplot.microbenchmark(item)

# The `apply` family of functions is often faster than loops as well, but not
# always! In this example, the manual functions are basically saying the same
# thing, but they are nowhere near as fast as the optimized function.

manual_colMeans_apply = function(x){
  
  out = apply(X = x, MARGIN = 2, FUN = mean)
  
  return(out)
  
}

(item = microbenchmark::microbenchmark("Manual" = manual_colMeans(x), 
                                       "Manual (apply)" = manual_colMeans_apply(x), 
                                       "Optimized" = colMeans(x), times = 1e2))

microbenchmark::autoplot.microbenchmark(item)


# Other tips -----------------------------------------------------------------------------

# Useful keyboard shortcuts - used most often

# Windows                Mac 

# Show all keyboard shortcuts
# alt-shift-k            option-shift-k

# New document
# ctrl-shift-n           command-shift-n

# Move focus to editor
# ctrl-1                 ctrl-1

# Move focus to console
# ctrl-2                 ctrl-2

# Move focus to plot area
# ctrl-6                 ctrl-6

# Maximize editor
# ctrl-shift-1           ctrl-shift-1 ?

# Maximize console
# ctrl-shift-2           ctrl-shift-2 ?

# Maximize plot area
# ctrl-shift-6           ctrl-shift-6 ?

# Run code from beginning to current line
# ctrl-alt-b             command-option-b

# Re-run previous command 
# ctrl-shift-p           command-shift-p

# Comment/uncomment lines
# ctrl-shift-c           command-shift-c

# Make comment lines neater
# ctrl-shift-/           command-shift-/

# Insert %>%
# ctrl-shift-m           command-shift-m

# Edit all names of a variable
# ctrl-alt-shift-m       ?
# Introduction to plotting in R

# Don't forget to try the vignettes at the bottom of each help page!

# Visualization types --------------------------------------------------------------------------------------------------------------------------------------------

## Plots of data distribution in one dimension ######################

### Histogram - group the data into bins (default or custom defined) spanning the range of the data and display frequency of each bin.
?hist

### Density - Smooth out the data and display density (analogous to continuous frequency) of data along the range of the data.
?density # Combine with plot() to vizualize; i.e. plot(density(x))

### Dotchart - Display all point values along one dimension.
?dotchart


## Plots in two-dimension ###########################

### Ordinary point plotting
?plot # Plot points along x and y axes. Follow with points() for additional points from related data, or lines(); examples below.

### Grid plotting with grid cell values
?image # Plot a raster 'image', which is a set of coordinates x & y, and cell values z. 

### Box plot - Group the data along discrete factors, and display median, interquartile range (whiskers), and outliers
?boxplot



# What makes a good visualization? 
# * Plots should have a **purpose**, a clearly defined set of variables and a message being conveyed. 
# * Plots should be succinct and uncluttered so as to allow easy interpretation of the purpose. 
# * Plots should be comprehensive, representing the data accurately and fairly.

# Save data from internal `datasets` package as a new object.
# This dataset is observations of CO2 uptake by plants originating from
# different locations, and with different temperature treatments performed.
CO2 = datasets::CO2

# Remind us what it looks like - three columns of character vectors represented as 'factors', and two numeric columns
head(CO2)

# More specific information about the structure (str) of the data
str(CO2)

# Visualization 1 ------------------------------------------------------------------------------------------------

# Changing ambient CO2 should affect CO2 uptake - less CO2 available might imply a slower uptake rate. Can we visualize this?

# Visualization 2 ------------------------------------------------------------------------------------------------

# Biological processes are usually temperature mediated. We should expect higher
# respiration (CO2 uptake) with higher temperatures. What are the temp
# treatments? 'levels' extracts the unique factors from a 'factor' vector. In
# this case, 'chilled' and 'nonchilled' represented as 1's and 2's

levels(CO2$Treatment)

# We're interested in the distribution of uptake as it relates to treatment. How can we visualize this?
# * Points colored by factor
# * Box plot - grouping along a discrete variable (treatment) and display distribution of data
# * Density plot with line type determined by factor

# Split data frame by treatment. Makes two lists of CO2$uptake separated by treatment.
(CO2_split = split(CO2$uptake, CO2$Treatment))


# Colored points
plot(CO2_split$nonchilled, col = 'blue')
points(CO2_split$chilled, col = 'red')

# Plot opens up the plotting window defaulting to the ranges of the data initially passed to plot()
# Additional points can be added by following plot() with points(), but the window size will not change!

plot(CO2$Treatment)

# Box plot - 'split' first by treatment and plot
boxplot(CO2_split_treatment)

# Plot density
plot( density(split(CO2$uptake, CO2$Treatment)$chilled) )
lines( density(split(CO2$uptake, CO2$Treatment)$nonchilled) , linetype)
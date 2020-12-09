
source("scatterhist-start.R")

set.seed(20141103)
x <- cbind(x1 = rexp(100), x2 = rnorm(100))

plot_scatterhist(x)


# a) ----------------------------------------------------------------------

plot_scatterhist(trees)


# Problem occurs in line #7 of the plot_scatterist() funciton.
# In the data.frame trees are three variables so the plot function
# returns a matrix scatterplot. The error of the argument "xlab" occurs,
# because there are more than two variables (three variables), 
# where a clear allocation to "xlab" and "ylab" is not possible.



# b) ----------------------------------------------------------------------

# debug(plot_scatterhist)
# plot_scatterhist(x)
# x <- x^2






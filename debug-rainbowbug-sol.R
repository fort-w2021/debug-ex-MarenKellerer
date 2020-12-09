
library(rainbow)
set.seed(121212)
n <- 80
n_grid <- 100
t_grid <- seq(0, 1, l = n_grid)
x <- replicate(
  n,
  dbeta(t_grid, shape1 = runif(1, 3, 4), shape2 = runif(1, 2, 7)) +
    rt(n_grid, df = 5) / 10
)

x_fds <- fds(x = t_grid, y = x)

layout(t(1:2))
matplot(t_grid, x, lty = 1, col = rgb(0, 0, 0, .2), type = "l", lwd = 1.5)
fboxplot(x_fds)



# a) ----------------------------------------------------------------------


# The error occurs at the function fboxplot() at the legend() function (trigger).
# The cause of the error is that x in x_fds has no column name 
# For avoiding the error column names can be set, as well as "legend = FALSE" ind
# the fboxplot() function.




# b) ----------------------------------------------------------------------

# The rainbow package could add checks for the input and changing the default
# values, for avoiding e.g. legend errors.









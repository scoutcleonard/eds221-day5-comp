# Testing testthat

#Requires packages:
# install.packages('testthat')
# install.packages('devtools')
# install.packages('remotes')

library(testthat)

# Create a function that takes any numeric data frame (all variables are numbers), finds the mean of all columns, then finds the maximum column mean, and the minimum column mean for that data frame, & returns those min and max mean values in a vector (min_mean_value, max_mean_value). 

#apply(X = df, MARGIN = 2, FUN = mean, na.rm = TRUE)

#' Minimum and Maximum Mean Function
#'
#' @param df This is a data frame of all numeric elements. 
#'
#' @return
#' @export
#'
#' @examples mean_range(mtcars)
mean_range <- function(df) {
  col_means <- apply(X = df, MARGIN = 2, FUN = mean, na.rm = TRUE)
  col_mean_max <- max(col_means)
  col_mean_min <- min(col_means)
 return(c(col_mean_min, col_mean_max))
}

#Below we are testing the length of the vector from our function. 2 is the expected length. If nothing happens, then our function passes the test. You get an error if you change to 3!
expect_length(mean_range(df = mtcars), 2)
expect_length(mean_range(df = mtcars), 3)


#We would expect the second element to be greater than the first element, because the min is less than the max. When this is true, expect-true returns nothing!
expect_true(mean_range(mtcars)[1] < mean_range(mtcars)[2])
# When it's false we get an error message. 
expect_true(mean_range(mtcars)[2] < mean_range(mtcars)[1])

#Check whether this returns a numeric vector

expect_type(mean_range(mtcars), "double")
#A broken example! 
expect_type(mean_rangw(mtcars), "character")



#' coolgraph.
#'
#' @name coolgraph
#' @docType package
#'
#'This package has been inspired by my research group and there desire to make awesome graphs without really knowing much about R. In this package I will be introducing three new funcitons, one that allows you to make a simple heatmap, another that lets you copare 2 continous variables and facet over anothe 2 categorical variables, and a 3rd that allows you to compare 3 continous variables by mapping the 3rd variable to the size of the data points.
#'
#'
#'Fuctions
#'
#'heatmap()
#'
#'prepares a heatmap from a summarized data table
#'
#'To use this function you must pre-prepare a table or else it won't. The term used in this pkg is the "summarized data table", which means for your two catigorical variables, you should have only one row in your table for each combination of catigorical variables, with one y output for each row. For example, if you want to see the effect of sex (male vs female) and smoking status (yes vs no), and you want to measure mutation rate accross 100 samples, you would prepare a table with 3 columns and 4 rows. Note that we have averaged the mutation for each of the 4 combinations of sex and smoking.
#'
#'Function structure:
#'heatmap(data, x1, x2, y, xlab = "x-axis", ylab = "y-axis", legendlab = "response\n variable")
#'
#'example:
#'testthat::test_that("make a heatmap from mtcars", {
#'my_cars <- dplyr::mutate(mtcars, cyl = as.factor(mtcars$cyl),
#'												 gear = as.factor(mtcars$gear),
#'												 carb = as.factor(mtcars$carb),
#'												 am = as.factor(mtcars$am),
#'												 vs = as.factor(mtcars$vs))
#'
#'heat_data <- dplyr::ungroup(
#'	dplyr::summarise(dplyr::group_by(my_cars, am, cyl),
#'									 average_mpg = mean(mpg)))
#'
#'heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$average_mpg, "cylinders", "am", "mpg")
#'
#'
#'
#'
#'facet2D()
#'
#'Prepares a matrix of scatter plots based on two coninous variables faceted by two categorical variables
#'
#'Note that this function is currently not working as intended.
#'
#'This function was inspired by my interested in showing 2 categorical variables in the same set of graphs as 2 continous variables, ploting a grid of faceted plots where each column represents different values of one categorical variable, and each row represents different values of the other categorical variable. Each plot would show one of the continous variables on the x axis, with the other continous variable on the y-axis. However at this moment the function is not working properly. I will go into that below.
#'
#'Function structure:
#'
#'facet2D(data, c1, c2, f1, f2, xlab = "x-axis", ylab = "y-axis")
#'
#'Example:
#'
#'facet2D(my_cars, my_cars$wt, my_cars$mpg, "am", "cyl", "weight", "miles per gallon")
#'
#'
#'
#'
#'sizescale()
#'
#'Prepares a plot to represent 3 continous variables, one of which is mapped to point size.
#'
#'This function is directly inspired by my lab's request to plot 3 continous variables on one graph, as such this function plots one variable on the x axis, one variable on the y axis, and maps on variable to the size of each point, which is drawn as an outline to reduce cluttering of the data.
#'
#'Function structure:
#'
#'sizescale(data, x1, y1, scale, xlab = "x-axis", ylab = "y-axis", legendlab = "legend")
#'
#'Example
#'
#'sizescale(mtcars, mtcars$wt, mtcars$mpg, mtcars$hp, "weight", "mpg", "horse power")
#'
#'
#'
NULL

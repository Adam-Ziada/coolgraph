#' facet2D
#'
#' This function was inspired by my interested in showing 2 categorical variables in the same set of graphs as 2 continous variables, ploting a grid of faceted plots where each column represents different values of one categorical variable, and each row represents different values of the other categorical variable. Each plot would show one of the continous variables on the x axis, with the other continous variable on the y-axis. However at this moment the function is not working properly.
#'
#' @param data is a data frame
#' @param c1 is a column of a data frame of the form data$variable name, containing int, dbl, or numeric data. Note that you must put the name of the variable in quotes when entering it into the function.
#' @param c2 is a column of a data frame of the form data$variable name, containing int, dbl, or numeric data. Note that you must put the name of the variable in quotes when entering it into the function.
#' @param f1 is a column of a data frame of the form 'variable' name, containing factor data. Note that you must put the name of the variable in quotes when entering it into the function.
#' @param f2 is a column of a data frame of the form 'variable' name, containing factor data. Note that you must put the name of the variable in quotes when entering it into the function.
#' @param xlab is the x-axis label - must be character data.
#' @param ylab is the y-axis label - must be character data.
#'
#' @return
#' @export facet2D
#'
#' @examples
#' my_cars <- dplyr::mutate(mtcars, cyl = as.factor(mtcars$cyl),
#'    gear = as.factor(mtcars$gear),
#'    carb = as.factor(mtcars$carb),
#'    am = as.factor(mtcars$am),
#'  	vs = as.factor(mtcars$vs))
#'
#' facet2D(data = my_cars, "wt", "mpg", "am", "cyl", "weight", "Miles per gallon")
#' facet2D(data = my_cars, "disp", "mpg", "am", "cyl", "Displacement", "Miles per gallon")
#' facet2D(data = my_cars, "drat", "mpg", "am", "cyl", "Rear axel ratio", "Miles per gallon")
facet2D <- function(data, c1, c2, f1, f2, xlab = "x-axis", ylab = "y-axis") {
	if(!is.data.frame(data)) {
		stop('the first variable (data) must be a data frame, you have entered ', class(data)[1], " data.")
	}
	if(!(is.factor(f1) | is.character(f1))) {
		stop('the fourth variable (f1) must be a factor, you have entered ', class(f1)[1], " data.")
	}
	if(!(is.factor(f2) | is.character(f2))) {
		stop('the fith variable (f2) must be a factor, you have entered ', class(f2)[1], " data.")
	}
	# if(!(is.character(c1))) {
	# 	stop('the second variable (c1) must be a factor, you have entered ', class(c1)[1], " data.")
	# }
	# if(!(is.character(c2))) {
	# 	stop('the third variable (c2) must be a factor, you have entered ', class(c2)[1], " data.")
	# }
	if(!(is.character(xlab))) {
		stop('the x-axis lable (xlab) must be a character, you have entered ', class(xlab)[1], " data.")
	}
	if(!(is.character(ylab))) {
		stop('the y-axis lable (ylab) must be a character, you have entered ', class(ylab)[1], " data.")
	}
	ggplot2::ggplot(data = data, ggplot2::aes_string(c1, c2)) +
		ggplot2::geom_point(alpha = 1) +
		ggplot2::facet_wrap(c(f1, f2)) +
		ggplot2::labs(x = xlab) +
		ggplot2::labs(y = ylab) +
		ggplot2::theme_bw(base_size = 10)
}









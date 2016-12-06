#' Title
#'
#' @param data is a data frame
#' @param c1 is a column of a data frame of the form data$variable name, containing int, dbl, or numeric data
#' @param c2 is a column of a data frame of the form data$variable name, containing int, dbl, or numeric data
#' @param f1 is a column of a data frame of the form 'variable' name, containing factor data. Note that you must put the name of the variable in quotes when entering it into the function.
#' @param f2 is a column of a data frame of the form 'variable' name, containing factor data. Note that you must put the name of the variable in quotes when entering it into the function.
#' @param xlab is the x-axis label - must be character data.
#' @param ylab is the y-axis label - must be character data.
#'
#' @return
#' @export facet2D
#'
#' @examples
#' #'my_cars <- dplyr::mutate(mtcars, cyl = as.factor(mtcars$cyl),
#' #'   gear = as.factor(mtcars$gear),
#' #'   carb = as.factor(mtcars$carb),
#' #	  am = as.factor(mtcars$am),
#' #' 	vs = as.factor(mtcars$vs))
#' #'
#' #'facet2D(data = my_cars, my_cars$wt, my_cars$mpg, "am", "cyl", "am", "cylinder")
facet2D <- function(data, c1, c2, f1, f2, xlab = "x-axis", ylab = "y-axis") {
	if(!is.data.frame(data)) {
		stop('the first variable (data) must be a data frame, you have entered ', class(data)[1], " data.")
	}
	if(!is.factor(f1)) {
		stop('the fourth variable (f1) must be a factor, you have entered ', class(f1)[1], " data.")
	}
	if(!is.factor(f2)) {
		stop('the fith variable (f2) must be a factor, you have entered ', class(f2)[1], " data.")
	}
	if(!(is.numeric(c1) | is.double(c1) | is.integer(c1))) {
		stop('the second variable (c1) must be a numeric or dbl or integer, you have entered ', class(c1)[1], " data.")
	}
	if(!(is.numeric(c2) | is.double(c2) | is.integer(c2))) {
		stop('the third variable (c2) must be a numeric or dbl or integer, you have entered ', class(c2)[1], " data.")
	}
	if(!(is.character(xlab))) {
		stop('the x-axis lable (xlab) must be a character, you have entered ', class(xlab)[1], " data.")
	}
	if(!(is.character(ylab))) {
		stop('the y-axis lable (ylab) must be a character, you have entered ', class(ylab)[1], " data.")
	}
	ggplot2::ggplot(data = data, ggplot2::aes(c1, c2)) +
		ggplot2::geom_point(alpha = 1) +
		ggplot2::facet_wrap(c(paste(f1), paste(f2))) +
		ggplot2::labs(x = xlab) +
		ggplot2::labs(y = ylab) +
		ggplot2::theme_bw(base_size = 10)
}









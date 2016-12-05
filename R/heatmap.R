

#' heatmap
#'
#' Creates of two catigorical variables, and 1 continous variable.
#'
#'
#'
#'
#'
#'
#' @param data is a summarized data frame with 2 factor variables and 1 continous variable
#' @param x1 is a column of a data frame of the form data$variable name, that must contain summarized factor data.
#' @param x2 is a column of a data frame of the form data$variable name, that must contain summarized factor data.
#' @param y is a column of a data frame of the form data$variable name, that must contain summarized (double, integer, or numeric) data.
#' @param xlab is the x-axis label - must be character data.
#' @param ylab is the y-axis label - must be character data.
#' @param legendlab is the legend label - must be character data.
#'
#' @return
#' @export heatmap
#'
#' @examples
#' #' my_cars <- dplyr::mutate(mtcars, cyl = as.factor(mtcars$cyl),
#' #'                                gear = as.factor(mtcars$gear),
#' #'                                carb = as.factor(mtcars$carb),
#' #'                                    am = as.factor(mtcars$am),
#' #'                                    vs = as.factor(mtcars$vs))
#' #'   heat_data <- dplyr::ungroup(
#' #'          	dplyr::summarise(dplyr::group_by(my_cars, am, cyl),
#' #' 									 average_mpg = mean(mpg)))
#' #' heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$average_mpg,
#' #'                                      "cylinders", "am", "mpg")
heatmap <- function(data, x1, x2, y, xlab = "x-axis", ylab = "y-axis", legendlab = "response\n variable") {
	if(!is.data.frame(data)) {
		stop('the first variable (data) must be a data frame, you have entered ', class(data)[1], " data.")
	}
	if(!is.factor(x1)) {
		stop('the first variable (data) must be a factor, you have entered ', class(x1)[1], " data.")
	}
	if(!is.factor(x2)) {
		stop('the first variable (data) must be a factor, you have entered ', class(x2)[1], " data.")
	}
	if(!(is.numeric(y) | is.double(y) | is.integer(y))) {
		stop('the first variable (data) must be a numeric or dbl or integer, you have entered ', class(y)[1], " data.")
	}
	if(!(is.character(xlab))) {
		stop('the x-axis lable (xlab) must be a character, you have entered ', class(xlab)[1], " data.")
	}
	if(!(is.character(ylab))) {
		stop('the y-axis lable (ylab) must be a character, you have entered ', class(ylab)[1], " data.")
	}
	if(!(is.character(legendlab))) {
		stop('the legend lable (legendlab) must be a character, you have entered ', class(legendlab)[1], " data.")
	}

	ggplot2::ggplot(data) +
		ggplot2::aes( y = x2, x = x1, fill = y) +
		ggplot2::geom_raster() +
		viridis::scale_fill_viridis() +
		ggplot2::xlab(xlab) +
		ggplot2::ylab(ylab) +
		ggplot2::labs(fill = legendlab)
}









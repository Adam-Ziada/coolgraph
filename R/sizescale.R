
#' sizescale
#'
#' description
#'
#' @param data is a data frame
#' @param x1 is a column of a data frame of the form data$variable name, containing int, dbl, or numeric data
#' @param y1 is a column of a data frame of the form data$variable name, containing int, dbl, or numeric data
#' @param scale is a column of a data frame of the form data$variable name, containing int, dbl, or numeric data
#' @param xlab is the x-axis label - must be character data.
#' @param ylab is the y-axis label - must be character data.
#' @param legendlab is the legend label - must be character data.
#'
#' @return
#' @export sizescale
#'
#' @examples
#' #'sizescale(mtcars, mtcars$wt, mtcars$mpg, mtcars$hp, "wt", "mpg", "hp")
#' #'sizescale(mtcars, mtcars$wt, mtcars$mpg, mtcars$hp, "weight", "mpg", "horse power")
#' #'sizescale(mtcars, mtcars$disp, mtcars$mpg, mtcars$hp, "size", "mpg", "horse power")
#' #'sizescale(mtcars, mtcars$disp, mtcars$mpg, mtcars$hp)
sizescale <- function(data, x1, y1, scale, xlab = "x-axis", ylab = "y-axis", legendlab = "legend") {
	if(!is.data.frame(data)) {
		stop('the first variable (data) must be a data frame, you have entered ', class(data)[1], " data.")
	}

	if(!(is.numeric(x1) | is.double(x1) | is.integer(x1))) {
		stop('the second variable (x1) must be a numeric or dbl or integer, you have entered ', class(x1)[1], " data.")
	}
	if(!(is.numeric(x2) | is.double(x2) | is.integer(x2))) {
		stop('the third variable (x2) must be a numeric or dbl or integer, you have entered ', class(x2)[1], " data.")
	}
	if(!(is.numeric(scale) | is.double(scale) | is.integer(scale))) {
		stop('the fourth variable (scale) must be a numeric or dbl or integer, you have entered ', class(scale)[1], " data.")
	}
	if(!(is.character(xlab))) {
		stop('the x-axis lable (xlab) must be a character, you have entered ', class(xlab)[1], " data.")
	}
	if(!(is.character(ylab))) {
		stop('the y-axis lable (ylab) must be a character, you have entered ', class(ylab)[1], " data.")
	}
	if(!(is.character(legendlab))) {
		stop('the y-axis lable (legendlab) must be a character, you have entered ', class(legendlab)[1], " data.")
	}
	ggplot2::ggplot(data, ggplot2::aes(x = x1, y = y1)) +
		ggplot2::geom_point(ggplot2::aes(size= scale), pch = 21) +
	  ggplot2::xlab(xlab) +
	  ggplot2::ylab(ylab) +
		ggplot2::labs(size = legendlab)
}



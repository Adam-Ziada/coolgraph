

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











heatmap <- function(data, x1, x2, y) {

	ggplot2::ggplot(data) +
		ggplot2::aes( y = x2, x = x1, fill = y) +
		ggplot2::geom_raster() +
		viridis::scale_fill_viridis()
}









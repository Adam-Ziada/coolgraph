context("Binding factors")

testthat::test_that("fbind binds factor (or character)", {
	my_cars <- dplyr::mutate(mtcars, cyl = as.factor(mtcars$cyl),
													 gear = as.factor(mtcars$gear),
													 carb = as.factor(mtcars$carb),
													 am = as.factor(mtcars$am),
													 vs = as.factor(mtcars$vs))

	heat_data <- dplyr::ungroup(
		dplyr::summarise(dplyr::group_by(my_cars, am, cyl),
										 average_mpg = mean(mpg)))

b <-	ggplot2::ggplot(heat_data) +
		ggplot2::aes( y = am, x = cyl, fill = average_mpg) +
		ggplot2::geom_raster() +
		viridis::scale_fill_viridis() +
		ggplot2::xlab("cylinders") +
		ggplot2::ylab("am") +
		ggplot2::labs(fill = "mpg")
z <- heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$average_mpg, "cylinders", "am", "mpg")
heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$average_mpg, "cylinders", "am", "mpg")

	testthat::expect_identical(heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$average_mpg, "cylinders", "am", "mpg")
									 , z)





})

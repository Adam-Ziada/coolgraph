context("Binding factors")

testthat::test_that("make a heatmap from mtcars", {
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


c <- heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$average_mpg, "cylinders", "am", "mpg")
d <- heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$average_mpg, "cylinders", "am", 1)
e <- heatmap(heat_data, heat_data, heat_data$am, heat_data$average_mpg, "cylinders", "am", "mpg")
f <- heatmap(heat_data$cyl, heat_data$cyl, heat_data$am, heat_data$average_mpg, "cylinders", "am", "mpg")
g <- heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$am, "cylinders", "am", "mpg")
h <- heatmap(heat_data, heat_data$cyl, heat_data$average_mpg, heat_data$average_mpg, "cylinders", "am", "mpg")
i <- heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$average_mpg, "cylinders", heat_data$am, "mpg")
z <- heatmap(heat_data, heat_data$cyl, heat_data$am, heat_data$average_mpg, "cylinders", "am", "mpg")




	testthat::expect_silent(c)
	testthat::expect_is(c, "ggplot")
	testthat::expect_equal(b$data, c$data)
	testthat::expect_equal(b$labels, c$labels)
	testthat::expect_equal(b$coordinates, c$coordinates)
	testthat::expect_equal(b$scales, c$scales)
	testthat::expect_equal(b$layers, c$layers)

	testthat::expect_error(d, regexp = NULL)
	testthat::expect_error(e, regexp = NULL)
	testthat::expect_error(f, regexp = NULL)
	testthat::expect_error(g, regexp = NULL)
	testthat::expect_error(h, regexp = NULL)
	testthat::expect_error(h, regexp = NULL)

})

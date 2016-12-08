context("makes a 2D faceted graph")

testthat::test_that("makes a 2D faceted graph", {
	my_cars <- dplyr::mutate(mtcars, cyl = as.factor(mtcars$cyl),
													 gear = as.factor(mtcars$gear),
													 carb = as.factor(mtcars$carb),
													 am = as.factor(mtcars$am),
													 vs = as.factor(mtcars$vs))



	b <- ggplot2::ggplot(my_cars, ggplot2::aes(wt, mpg)) +
		ggplot2::geom_point(alpha = 1) +
		ggplot2::facet_wrap(c("am", "cyl")) +
		ggplot2::labs(x = "am") +
		ggplot2::labs(y = "cylinder") +
		ggplot2::theme_bw(base_size = 10)



	c <- facet2D(my_cars, "wt", "mpg", "am", "cyl", "am", "cylinder")



	testthat::expect_silent(c)
		testthat::expect_is(c, "ggplot")
		testthat::expect_equal(b$data, c$data)
		testthat::expect_equal(b$labels, c$labels)
		testthat::expect_equal(b$coordinates, c$coordinates)
		testthat::expect_equal(b$scales, c$scales)
		testthat::expect_equal(b$layers, c$layers)



})

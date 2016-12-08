context("makes a 2D faceted graph")

testthat::test_that("makes a 2D faceted graph", {
	my_cars <- dplyr::mutate(mtcars, cyl = as.factor(mtcars$cyl),
													 gear = as.factor(mtcars$gear),
													 carb = as.factor(mtcars$carb),
													 am = as.factor(mtcars$am),
													 vs = as.factor(mtcars$vs))



	b <- ggplot2::ggplot(my_cars, ggplot2::aes_string("wt", "mpg")) +
		ggplot2::geom_point(alpha = 1) +
		ggplot2::facet_wrap(c("am", "cyl")) +
		ggplot2::labs(x = "Weight") +
		ggplot2::labs(y = "Miles per gallon") +
		ggplot2::theme_bw(base_size = 10)



	b1 <- facet2D(my_cars, "wt", "mpg", "am", "cyl", "Weight", "Miles per gallon")


	c <- ggplot2::ggplot(my_cars, ggplot2::aes_string("disp", "mpg")) +
		ggplot2::geom_point(alpha = 1) +
		ggplot2::facet_wrap(c("am", "cyl")) +
		ggplot2::labs(x = "Displacement") +
		ggplot2::labs(y = "Miles per gallon") +
		ggplot2::theme_bw(base_size = 10)



	c1 <- facet2D(data = my_cars, "disp", "mpg", "am", "cyl", "Displacement", "Miles per gallon")

	d <- ggplot2::ggplot(my_cars, ggplot2::aes_string("disp", "mpg")) +
		ggplot2::geom_point(alpha = 1) +
		ggplot2::facet_wrap(c("carb", "cyl")) +
		ggplot2::labs(x = "Displacement") +
		ggplot2::labs(y = "Miles per gallon") +
		ggplot2::theme_bw(base_size = 10)

	d1 <- facet2D(data = my_cars, "disp", "mpg", "carb", "cyl", "Displacement", "Miles per gallon")


  	testthat::expect_silent(b)
  	testthat::expect_silent(b1)
  	testthat::expect_error(facet2D(data = "disp", "disp", "mpg", "am", "cyl", "Displacement", "Miles per gallon"))
		testthat::expect_is(b, "ggplot")
		testthat::expect_is(b1, "ggplot")
		testthat::expect_equal(b$data, b1$data)
		testthat::expect_equal(b$labels, b1$labels)
		testthat::expect_equal(b$coordinates, b1$coordinates)
		testthat::expect_equal(b$scales, b1$scales)
		testthat::expect_equal(b$layers, b1$layers)

		testthat::expect_silent(c)
		testthat::expect_silent(c1)
		testthat::expect_error(facet2D(data = "disp", "disp", "mpg", "am", "cyl", "Displacement", "Miles per gallon"))
		testthat::expect_is(c, "ggplot")
		testthat::expect_is(c1, "ggplot")
		testthat::expect_equal(c$data, c1$data)
		testthat::expect_equal(c$labels, c1$labels)
		testthat::expect_equal(c$coordinates, c1$coordinates)
		testthat::expect_equal(c$scales, c1$scales)
		testthat::expect_equal(c$layers, c1$layers)

		testthat::expect_silent(d)
		testthat::expect_error(facet2D(data = "cyl", "disp", "mpg", "carb", "cyl", "Displacement", "Miles per gallon"))
		testthat::expect_silent(d1)
		testthat::expect_is(d, "ggplot")
		testthat::expect_is(d1, "ggplot")
		testthat::expect_equal(d$data, d1$data)
		testthat::expect_equal(d$labels, d1$labels)
		testthat::expect_equal(d$coordinates, d1$coordinates)
		testthat::expect_equal(d$scales, d1$scales)
		testthat::expect_equal(d$layers, d1$layers)


})

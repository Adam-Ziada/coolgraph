context("Make a graph with point size scaling")

testthat::test_that("Make a graph with point size scaling", {


	b <-	ggplot2::ggplot(mtcars, ggplot2::aes(x = mtcars$wt, y = mtcars$mpg)) +
		ggplot2::geom_point(ggplot2::aes(size= mtcars$hp), pch = 21) +
		ggplot2::xlab("weight") +
		ggplot2::ylab("mpg") +
		ggplot2::labs(size = "horse power")

	c <-	ggplot2::ggplot(mtcars, ggplot2::aes(x = mtcars$wt, y = mtcars$mpg)) +
		ggplot2::geom_point(ggplot2::aes(size= mtcars$hp), pch = 21) +
		ggplot2::xlab("x-axis") +
		ggplot2::ylab("y-axis") +
		ggplot2::labs(size = "legend")

	d <-	ggplot2::ggplot(mtcars, ggplot2::aes(x = mtcars$disp, y = mtcars$mpg)) +
		ggplot2::geom_point(ggplot2::aes(size= mtcars$hp), pch = 21) +
		ggplot2::xlab("Displacement") +
		ggplot2::ylab("mpg") +
		ggplot2::labs(size = "horse power")


	b1 <- sizescale(mtcars, mtcars$wt, mtcars$mpg, mtcars$hp, "weight", "mpg", "horse power")
	c1 <- sizescale(mtcars, mtcars$wt, mtcars$mpg, mtcars$hp)
	d1 <- sizescale(mtcars, mtcars$disp, mtcars$mpg, mtcars$hp, "Displacement", "mpg", "horse power")




	testthat::expect_silent(b)
	testthat::expect_silent(b1)
	testthat::expect_is(b, "ggplot")
	testthat::expect_is(b1, "ggplot")
	 testthat::expect_equal(b$data, b1$data)
	testthat::expect_equal(b$labels, b1$labels)
	testthat::expect_equal(b$coordinates, b1$coordinates)
	testthat::expect_equal(b$scales, b1$scales)

	testthat::expect_silent(c)
	testthat::expect_silent(c1)
	testthat::expect_is(c, "ggplot")
	testthat::expect_is(c1, "ggplot")
	testthat::expect_equal(c$data, c1$data)
	testthat::expect_equal(c$labels, c1$labels)
	testthat::expect_equal(c$coordinates, c1$coordinates)
	testthat::expect_equal(c$scales, c1$scales)

	testthat::expect_silent(d)
	testthat::expect_silent(d1)
	testthat::expect_is(d, "ggplot")
	testthat::expect_is(d1, "ggplot")
	testthat::expect_equal(d$data, d1$data)
	testthat::expect_equal(d$labels, d1$labels)
	testthat::expect_equal(d$coordinates, d1$coordinates)
	testthat::expect_equal(d$scales, d1$scales)


})

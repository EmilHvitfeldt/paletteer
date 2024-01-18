df <- data.frame(
  x = 1:3,
  y = 1:3,
  color = c("2", "3", "4")
)

test_that("scale_*_paletteer_d correctly assigns colors", {
  testthat::skip_if_not_installed("ggplot2")
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_d("nord::lumina")

  p2 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_d("nord::lumina")

  p3 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_d("nord::lumina")

  expect_equal(ggplot2::layer_data(p1)$colour, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(ggplot2::layer_data(p2)$colour, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(ggplot2::layer_data(p3)$fill, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
})

test_that("scale_*_paletteer_d correctly assigns colors when dynamic = TRUE", {
  testthat::skip_if_not_installed("ggplot2")
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_d("cartography::green.pal", dynamic = TRUE)

  p2 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_d("cartography::green.pal", dynamic = TRUE)

  p3 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_d("cartography::green.pal", dynamic = TRUE)

  expect_equal(ggplot2::layer_data(p1)$colour, c("#B2D6A3FF", "#5A9C50FF", "#197230FF"))
  expect_equal(ggplot2::layer_data(p2)$colour, c("#B2D6A3FF", "#5A9C50FF", "#197230FF"))
  expect_equal(ggplot2::layer_data(p3)$fill, c("#B2D6A3FF", "#5A9C50FF", "#197230FF"))
})

test_that("scale_*_paletteer_d correctly used direction", {
  testthat::skip_if_not_installed("ggplot2")
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_d("nord::lumina", direction = 1)

  p2 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_d("nord::lumina", direction = 1)

  p3 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_d("nord::lumina", direction = 1)

  p4 <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_d("nord::lumina", direction = -1)

  p5 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_d("nord::lumina", direction = -1)

  p6 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_d("nord::lumina", direction = -1)

  expect_equal(ggplot2::layer_data(p1)$colour, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(ggplot2::layer_data(p2)$colour, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(ggplot2::layer_data(p3)$fill, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(ggplot2::layer_data(p4)$colour, c("#222B4CFF", "#306489FF", "#4F93B8FF"))
  expect_equal(ggplot2::layer_data(p5)$colour, c("#222B4CFF", "#306489FF", "#4F93B8FF"))
  expect_equal(ggplot2::layer_data(p6)$fill, c("#222B4CFF", "#306489FF", "#4F93B8FF"))
})

test_that("scale_*_paletteer_d works with quoted palettes", {
  testthat::skip_if_not_installed("ggplot2")

  expect_equal_scales <- function(x, y, ...) {
    x <- as.list(x)
    y <- as.list(y)
    x$call <- y$call <- NULL # the calls are different between quoted/unquoted
    expect_equal(x, y, ...)
  }

  expect_equal_scales(
    scale_colour_paletteer_d(`"nord::lumina"`),
    scale_colour_paletteer_d("nord::lumina")
  )

  expect_equal_scales(
    scale_color_paletteer_d(palette = `"nord::lumina"`),
    scale_color_paletteer_d("nord::lumina")
  )

  expect_equal_scales(
    scale_fill_paletteer_d(`"nord::lumina"`),
    scale_fill_paletteer_d("nord::lumina")
  )
})

test_that("scale_*_paletteer_d works when called from another function", {
  testthat::skip_if_not_installed("ggplot2")
  colour_fun <- function(pal) {
    ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
      ggplot2::geom_point() +
      scale_colour_paletteer_d(pal)
  }

  color_fun <- function(pal) {
    ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
      ggplot2::geom_point() +
      scale_color_paletteer_d(pal)
  }

  fill_fun <- function(pal) {
    ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
      ggplot2::geom_raster() +
      scale_fill_paletteer_d(pal)
  }

  gg_colour_real <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_d("nord::lumina")

  gg_color_real <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_d("nord::lumina")

  gg_fill_real <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_d("nord::lumina")

  gg_colour_fun <- colour_fun("nord::lumina")
  gg_color_fun <- color_fun("nord::lumina")
  gg_fill_fun <- fill_fun("nord::lumina")

  expect_equal(
    ggplot2::layer_data(gg_colour_real)$colour,
    ggplot2::layer_data(gg_colour_fun)$colour
  )

  expect_equal(
    ggplot2::layer_data(gg_color_real)$colour,
    ggplot2::layer_data(gg_color_fun)$colour
  )

  expect_equal(
    ggplot2::layer_data(gg_fill_real)$fill,
    ggplot2::layer_data(gg_fill_fun)$fill
  )
})

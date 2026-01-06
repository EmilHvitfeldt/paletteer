df <- data.frame(
  x = 1:3,
  y = 1:3,
  color = c(1, 4, 9)
)

test_that("scale_*_paletteer_binned correctly assigns colors", {
  testthat::skip_if_not_installed("ggplot2")
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_binned("scico::berlin")

  p2 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_binned("scico::berlin")

  p3 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_binned("scico::berlin")

  colours <- if (utils::packageVersion("ggplot2") < "3.5.0") {
    c("#65A6E1", "#183E4F", "#CC7D72")
  } else {
    c("#519FD2", "#13313E", "#BB6C60")
  }

  expect_equal(ggplot2::layer_data(p1)$colour, colours)
  expect_equal(ggplot2::layer_data(p2)$colour, colours)
  expect_equal(ggplot2::layer_data(p3)$fill, colours)
})

test_that("scale_*_paletteer_binned correctly used direction", {
  testthat::skip_if_not_installed("ggplot2")
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_binned("scico::berlin", direction = 1)

  p2 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_binned("scico::berlin", direction = 1)

  p3 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_binned("scico::berlin", direction = 1)

  p4 <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_binned("scico::berlin", direction = -1)

  p5 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_binned("scico::berlin", direction = -1)

  p6 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_binned("scico::berlin", direction = -1)

  colours <- if (utils::packageVersion("ggplot2") < "3.5.0") {
    c("#65A6E1", "#183E4F", "#CC7D72")
  } else {
    c("#519FD2", "#13313E", "#BB6C60")
  }

  expect_equal(ggplot2::layer_data(p1)$colour, colours)
  expect_equal(ggplot2::layer_data(p2)$colour, colours)
  expect_equal(ggplot2::layer_data(p3)$fill, colours)

  colours <- if (utils::packageVersion("ggplot2") < "3.5.0") {
    c("#CC7D72", "#4B1501", "#65A6E1")
  } else {
    c("#BB6C60", "#3F1200", "#519FD2")
  }

  expect_equal(ggplot2::layer_data(p4)$colour, colours)
  expect_equal(ggplot2::layer_data(p5)$colour, colours)
  expect_equal(ggplot2::layer_data(p6)$fill, colours)

  expect_snapshot(
    error = TRUE,
    ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
      scale_colour_paletteer_binned("scico::berlin", direction = 10)
  )
})

test_that("scale_*_paletteer_binned works with quoted palettes", {
  testthat::skip_if_not_installed("ggplot2")
  expect_equal(
    ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
      ggplot2::geom_point() +
      scale_colour_paletteer_binned(`"scico::berlin"`),
    ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
      ggplot2::geom_point() +
      scale_colour_paletteer_binned("scico::berlin")
  )

  expect_equal(
    ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
      ggplot2::geom_point() +
      scale_color_paletteer_binned(`"scico::berlin"`),
    ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
      ggplot2::geom_point() +
      scale_color_paletteer_binned("scico::berlin")
  )

  expect_equal(
    ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
      ggplot2::geom_raster() +
      scale_fill_paletteer_binned(`"scico::berlin"`),
    ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
      ggplot2::geom_raster() +
      scale_fill_paletteer_binned("scico::berlin")
  )
})

test_that("scale_*_paletteer_binned works when called from another function", {
  testthat::skip_if_not_installed("ggplot2")
  colour_fun <- function(pal) {
    ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
      ggplot2::geom_point() +
      scale_colour_paletteer_binned(pal)
  }

  color_fun <- function(pal) {
    ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
      ggplot2::geom_point() +
      scale_color_paletteer_binned(pal)
  }

  fill_fun <- function(pal) {
    ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
      ggplot2::geom_raster() +
      scale_fill_paletteer_binned(pal)
  }

  gg_colour_real <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_binned("scico::berlin")

  gg_color_real <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_binned("scico::berlin")

  gg_fill_real <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_binned("scico::berlin")

  gg_colour_fun <- colour_fun("scico::berlin")
  gg_color_fun <- color_fun("scico::berlin")
  gg_fill_fun <- fill_fun("scico::berlin")

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

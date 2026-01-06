df <- data.frame(
  x = 1:3,
  y = 1:3,
  color = c(1, 4, 9)
)

test_that("scale_*_paletteer_c correctly assigns colors", {
  testthat::skip_if_not_installed("ggplot2")
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_c("scico::berlin")

  p2 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_c("scico::berlin")

  p3 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_c("scico::berlin")

  expect_equal(
    ggplot2::layer_data(p1)$colour,
    c("#9EB0FF", "#13313E", "#FFACAC")
  )
  expect_equal(
    ggplot2::layer_data(p2)$colour,
    c("#9EB0FF", "#13313E", "#FFACAC")
  )
  expect_equal(ggplot2::layer_data(p3)$fill, c("#9EB0FF", "#13313E", "#FFACAC"))
})

test_that("scale_*_paletteer_c correctly used direction", {
  testthat::skip_if_not_installed("ggplot2")
  p1 <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_c("scico::berlin", direction = 1)

  p2 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_c("scico::berlin", direction = 1)

  p3 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_c("scico::berlin", direction = 1)

  p4 <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_c("scico::berlin", direction = -1)

  p5 <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_c("scico::berlin", direction = -1)

  p6 <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_c("scico::berlin", direction = -1)

  expect_equal(
    ggplot2::layer_data(p1)$colour,
    c("#9EB0FF", "#13313E", "#FFACAC")
  )
  expect_equal(
    ggplot2::layer_data(p2)$colour,
    c("#9EB0FF", "#13313E", "#FFACAC")
  )
  expect_equal(ggplot2::layer_data(p3)$fill, c("#9EB0FF", "#13313E", "#FFACAC"))
  expect_equal(
    ggplot2::layer_data(p4)$colour,
    c("#FFACAC", "#3F1200", "#9EB0FF")
  )
  expect_equal(
    ggplot2::layer_data(p5)$colour,
    c("#FFACAC", "#3F1200", "#9EB0FF")
  )
  expect_equal(ggplot2::layer_data(p6)$fill, c("#FFACAC", "#3F1200", "#9EB0FF"))

  expect_snapshot(
    error = TRUE,
    ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
      scale_colour_paletteer_c("scico::berlin", direction = 10)
  )
})

test_that("scale_*_paletteer_c works with quoted palettes", {
  testthat::skip_if_not_installed("ggplot2")
  expect_equal(
    ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
      ggplot2::geom_point() +
      scale_colour_paletteer_c(`"scico::berlin"`),
    ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
      ggplot2::geom_point() +
      scale_colour_paletteer_c("scico::berlin")
  )

  expect_equal(
    ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
      ggplot2::geom_point() +
      scale_color_paletteer_c(`"scico::berlin"`),
    ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
      ggplot2::geom_point() +
      scale_color_paletteer_c("scico::berlin")
  )

  expect_equal(
    ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
      ggplot2::geom_raster() +
      scale_fill_paletteer_c(`"scico::berlin"`),
    ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
      ggplot2::geom_raster() +
      scale_fill_paletteer_c("scico::berlin")
  )
})

test_that("scale_*_paletteer_c works when called from another function", {
  testthat::skip_if_not_installed("ggplot2")
  colour_fun <- function(pal) {
    ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
      ggplot2::geom_point() +
      scale_colour_paletteer_c(pal)
  }

  color_fun <- function(pal) {
    ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
      ggplot2::geom_point() +
      scale_color_paletteer_c(pal)
  }

  fill_fun <- function(pal) {
    ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
      ggplot2::geom_raster() +
      scale_fill_paletteer_c(pal)
  }

  gg_colour_real <- ggplot2::ggplot(df, ggplot2::aes(x, y, colour = color)) +
    ggplot2::geom_point() +
    scale_colour_paletteer_c("scico::berlin")

  gg_color_real <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = color)) +
    ggplot2::geom_point() +
    scale_color_paletteer_c("scico::berlin")

  gg_fill_real <- ggplot2::ggplot(df, ggplot2::aes(x, y, fill = color)) +
    ggplot2::geom_raster() +
    scale_fill_paletteer_c("scico::berlin")

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

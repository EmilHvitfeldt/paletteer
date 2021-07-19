context("test-discrete-ggplot2-scales")

df <- data.frame(
  x = 1:3,
  y = 1:3,
  color = c("2", "3", "4")
)

library(ggplot2)

test_that("scale_*_paletteer_d correctly assigns colors", {
  p1 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_colour_paletteer_d("nord::lumina")

  p2 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_d("nord::lumina")

  p3 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_paletteer_d("nord::lumina")

  expect_equal(layer_data(p1)$colour, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(layer_data(p2)$colour, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(layer_data(p3)$fill, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
})

test_that("scale_*_paletteer_d correctly assigns colors when dynamic = TRUE", {
  p1 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_colour_paletteer_d("cartography::green.pal", dynamic = TRUE)

  p2 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_d("cartography::green.pal", dynamic = TRUE)

  p3 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_paletteer_d("cartography::green.pal", dynamic = TRUE)

  expect_equal(layer_data(p1)$colour, c("#B2D6A3FF", "#5A9C50FF", "#197230FF"))
  expect_equal(layer_data(p2)$colour, c("#B2D6A3FF", "#5A9C50FF", "#197230FF"))
  expect_equal(layer_data(p3)$fill, c("#B2D6A3FF", "#5A9C50FF", "#197230FF"))
})

test_that("scale_*_paletteer_d correctly used direction", {
  p1 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_paletteer_d("nord::lumina", direction = 1)

  p2 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_d("nord::lumina", direction = 1)

  p3 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_paletteer_d("nord::lumina", direction = 1)

  p4 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_paletteer_d("nord::lumina", direction = -1)

  p5 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_d("nord::lumina", direction = -1)

  p6 <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_paletteer_d("nord::lumina", direction = -1)

  expect_equal(layer_data(p1)$colour, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(layer_data(p2)$colour, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(layer_data(p3)$fill, c("#EDDAEBFF", "#AD8CAEFF", "#4F93B8FF"))
  expect_equal(layer_data(p4)$colour, c("#222B4CFF", "#306489FF", "#4F93B8FF"))
  expect_equal(layer_data(p5)$colour, c("#222B4CFF", "#306489FF", "#4F93B8FF"))
  expect_equal(layer_data(p6)$fill, c("#222B4CFF", "#306489FF", "#4F93B8FF"))
})

test_that("scale_*_paletteer_d works with quoted palettes", {
  expect_equal(
    ggplot(df, aes(x, y, colour = color)) +
      geom_point() +
      scale_colour_paletteer_d(`"nord::lumina"`),
    ggplot(df, aes(x, y, colour = color)) +
      geom_point() +
      scale_colour_paletteer_d("nord::lumina")
  )

  expect_equal(
    ggplot(df, aes(x, y, color = color)) +
      geom_point() +
      scale_color_paletteer_d(palette = `"nord::lumina"`),
    ggplot(df, aes(x, y, color = color)) +
      geom_point() +
      scale_color_paletteer_d("nord::lumina")
  )

  expect_equal(
    ggplot(df, aes(x, y, fill = color)) +
      geom_raster() +
      scale_fill_paletteer_d(`"nord::lumina"`),
    ggplot(df, aes(x, y, fill = color)) +
      geom_raster() +
      scale_fill_paletteer_d("nord::lumina")
  )
})

test_that("scale_*_paletteer_d works when called from another function", {
  colour_fun <- function(pal) {
    ggplot(df, aes(x, y, colour = color)) +
      geom_point() +
      scale_colour_paletteer_d(pal)
  }

  color_fun <- function(pal) {
    ggplot(df, aes(x, y, color = color)) +
      geom_point() +
      scale_color_paletteer_d(pal)
  }

  fill_fun <- function(pal) {
    ggplot(df, aes(x, y, fill = color)) +
      geom_raster() +
      scale_fill_paletteer_d(pal)
  }

  gg_colour_real <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_paletteer_d("nord::lumina")

  gg_color_real <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_d("nord::lumina")

  gg_fill_real <- ggplot(df, aes(x, y, fill = color)) +
    geom_raster() +
    scale_fill_paletteer_d("nord::lumina")

  gg_colour_fun <- colour_fun("nord::lumina")
  gg_color_fun <- color_fun("nord::lumina")
  gg_fill_fun <- fill_fun("nord::lumina")

  expect_equal(
    layer_data(gg_colour_real)$colour,
    layer_data(gg_colour_fun)$colour
  )

  expect_equal(
    layer_data(gg_color_real)$colour,
    layer_data(gg_color_fun)$colour
  )

  expect_equal(
    layer_data(gg_fill_real)$fill,
    layer_data(gg_fill_fun)$fill
  )
})

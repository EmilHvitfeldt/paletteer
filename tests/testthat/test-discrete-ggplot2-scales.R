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

  expect_equal(layer_data(p1)$colour, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
  expect_equal(layer_data(p2)$colour, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
  expect_equal(layer_data(p3)$fill, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
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

  expect_equal(layer_data(p1)$colour, c("#B2D6A3", "#5A9C50", "#197230"))
  expect_equal(layer_data(p2)$colour, c("#B2D6A3", "#5A9C50", "#197230"))
  expect_equal(layer_data(p3)$fill, c("#B2D6A3", "#5A9C50", "#197230"))
})

test_that("scale_colour_paletteer_d works with quotation", {
  p1 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_paletteer_d("nord::lumina")

  p2 <- ggplot(df, aes(x, y, colour = color)) +
    geom_point() +
    scale_colour_paletteer_d(`nord::lumina`)

  expect_equal(layer_data(p1)$colour, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
  expect_equal(layer_data(p2)$colour, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
})

test_that("scale_color_paletteer_d works with quotation", {
  p1 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_d("nord::lumina")

  p2 <- ggplot(df, aes(x, y, color = color)) +
    geom_point() +
    scale_color_paletteer_d(`nord::lumina`)

  expect_equal(layer_data(p1)$colour, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
  expect_equal(layer_data(p2)$colour, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
})


test_that("scale_fill_paletteer_d works with quotation", {
  p1 <- ggplot(df, aes(x, y, fill = color)) +
    geom_point() +
    scale_fill_paletteer_d("nord::lumina")

  p2 <- ggplot(df, aes(x, y, fill = color)) +
    geom_point() +
    scale_fill_paletteer_d(`nord::lumina`)

  expect_equal(layer_data(p1)$fill, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
  expect_equal(layer_data(p2)$fill, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
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

  expect_equal(layer_data(p1)$colour, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
  expect_equal(layer_data(p2)$colour, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
  expect_equal(layer_data(p3)$fill, c("#EDDAEB", "#AD8CAE", "#4F93B8"))
  expect_equal(layer_data(p4)$colour, c("#222B4C", "#306489", "#4F93B8"))
  expect_equal(layer_data(p5)$colour, c("#222B4C", "#306489", "#4F93B8"))
  expect_equal(layer_data(p6)$fill, c("#222B4C", "#306489", "#4F93B8"))
})


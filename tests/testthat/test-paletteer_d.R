test_that("paletteer_d return correct number of colors", {
  expect_length(paletteer_d("wesanderson::Royal1", 3), 3)
  expect_length(paletteer_d("grDevices::blues9", 9), 9)
})

test_that("paletteer_d returns characters", {
  expect_type(paletteer_d("wesanderson::Royal1", 3), "character")
})

test_that("paletteer_d returns something when n is unspecified", {
  expect_length(paletteer_d("wesanderson::Royal1"), 4)
})

test_that("paletteer_d throws an error when n is specified too high", {
  expect_error(paletteer_d("wesanderson::Royal1", 100))
})

test_that("paletteer_d return correct amount when type is set to continuous", {
  expect_length(paletteer_d("wesanderson::Royal1", 1, type = "continuous"), 1)
  expect_length(paletteer_d("wesanderson::Royal1", 2, type = "continuous"), 2)
  expect_length(paletteer_d("wesanderson::Royal1", 4, type = "continuous"), 4)
  expect_length(paletteer_d("wesanderson::Royal1", 100, type = "continuous"), 100)
})

test_that("direction works correctly in paletteer_d", {
  expect_equal(
    paletteer_d("wesanderson::Royal1", 3, direction = 1),
    prismatic::color(c("#899DA4", "#C93312", "#FAEFD1"))
  )
  expect_equal(
    paletteer_d("wesanderson::Royal1", 3, direction = -1),
    prismatic::color(c("#FAEFD1", "#C93312", "#899DA4"))
  )
  expect_error(paletteer_d("wesanderson::Royal1", 3, direction = 10))
})

test_that("all ggthemes palettes are of length two or longer", {
  expect_true(all(sapply(palettes_d$ggthemes, length) > 1))
})

test_that("paletteer_d works with quoted palettes", {
  expect_equal(
    paletteer_d(`"wesanderson::Royal1"`, 3),
    paletteer_d("wesanderson::Royal1", 3)
  )
})

test_that("paletteer_d works when called from another function", {
  new_function <- function(x) {
    paletteer_d(x, 4)
  }

  expect_equal(
    new_function("wesanderson::Royal1"),
    paletteer_d("wesanderson::Royal1", 4)
  )
})


test_that("palettes_d_names has the right number of rows", {

  expect_identical(
    length(unlist(lapply(palettes_d, names))),
    nrow(palettes_d_names)
  )
})

test_that("paletteer_d errors with wrong names", {
  expect_snapshot(
    error = TRUE,
    paletteer_d("paletteer::notreal")
  )
})


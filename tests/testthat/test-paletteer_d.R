context("test-paletteer_d")

test_that("paletteer_d return correct number of colors", {
  expect_length(paletteer_d("wesanderson", "Royal1", 3), 3)
  expect_length(paletteer_d("grDevices", "blues9", 9), 9)
})

test_that("paletteer_d returns characters", {
  expect_type(paletteer_d("wesanderson", "Royal1", 3), "character")
})

test_that("paletteer_d returns something when n is unspecified", {
  expect_length(paletteer_d("wesanderson", "Royal1"), 4)
})

test_that("paletteer_d throws an error when n is specified too high", {
  expect_error(paletteer_d("wesanderson", "Royal1", 100))
})

test_that("paletteer_d return correct amount when type is set to continuous", {
  expect_length(paletteer_d("wesanderson", "Royal1", 1, "continuous"), 1)
  expect_length(paletteer_d("wesanderson", "Royal1", 2, "continuous"), 2)
  expect_length(paletteer_d("wesanderson", "Royal1", 4, "continuous"), 4)
  expect_length(paletteer_d("wesanderson", "Royal1", 100, "continuous"), 100)
})


test_that("paletteer_d works when package and name are provided as symbols", {
  expect_length(paletteer_d(wesanderson, "Royal1"), 4)
  expect_length(paletteer_d("wesanderson", Royal1), 4)
  expect_length(paletteer_d(wesanderson, Royal1), 4)
})


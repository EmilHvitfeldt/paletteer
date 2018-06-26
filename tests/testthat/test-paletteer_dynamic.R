context("test-paletteer_dynamic")

test_that("paletteer_dynamic return correct number of colors", {
  expect_length(paletteer_dynamic("ggthemes_solarized", "green", 1), 1)
  expect_length(paletteer_dynamic("ggthemes_solarized", "green", 3), 3)
  expect_length(paletteer_dynamic("ggthemes_solarized", "green", 8), 8)
})

test_that("paletteer_dynamic returns characters", {
  expect_type(paletteer_dynamic("ggthemes_solarized", "green", 3), "character")
})

test_that("paletteer_dynamic returns something when n is unspecified", {
  expect_error(paletteer_dynamic("ggthemes_solarized", "green"))
})

test_that("paletteer_dynamic throws an error when n is specified too high", {
  expect_error(paletteer_dynamic("ggthemes_solarized", "green", 100))
})

test_that("paletteer_dynamic works when package and name are provided as symbols", {
  expect_length(paletteer_dynamic(ggthemes_solarized, "green", 4), 4)
  expect_length(paletteer_dynamic("ggthemes_solarized", green, 4), 4)
  expect_length(paletteer_dynamic(ggthemes_solarized, green, 4), 4)
})


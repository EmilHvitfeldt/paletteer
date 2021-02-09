context("test-paletteer_dynamic")

test_that("paletteer_dynamic return correct number of colors", {
  expect_length(paletteer_dynamic("ggthemes_solarized::green", 1), 1)
  expect_length(paletteer_dynamic("ggthemes_solarized::green", 3), 3)
  expect_length(paletteer_dynamic("ggthemes_solarized::green", 8), 8)
})

test_that("paletteer_dynamic returns characters", {
  expect_type(paletteer_dynamic("ggthemes_solarized::green", 3), "character")
})

test_that("paletteer_dynamic returns something when n is unspecified", {
  expect_error(paletteer_dynamic("ggthemes_solarized::green"))
})

test_that("paletteer_dynamic throws an error when n is specified too high", {
  expect_error(paletteer_dynamic("ggthemes_solarized::green", 100))
})

test_that("direction works correctly in paletteer_dynamic", {
  expect_equal(
    paletteer_dynamic("ggthemes_solarized::green", 3, direction = 1),
    prismatic::color(c("#859900", "#dc322f", "#268bd2"))
  )
  expect_equal(
    paletteer_dynamic("ggthemes_solarized::green", 3, direction = -1),
    prismatic::color(c("#268bd2", "#dc322f", "#859900"))
  )
  expect_error(paletteer_dynamic("ggthemes_solarized::green", 3, direction = 10))
})

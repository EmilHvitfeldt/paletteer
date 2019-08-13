context("test-paletteer_c")

test_that("paletteer_c return correct number of colors", {
  expect_length(paletteer_c("grDevices::rainbow", 3), 3)
  expect_length(paletteer_c("grDevices::rainbow", 9), 9)
})

test_that("paletteer_c returns characters", {
  expect_type(paletteer_c("grDevices::rainbow", 3), "character")
})

test_that("paletteer_c throws an error when n is unspecified", {
  expect_error(paletteer_c("grDevices::rainbow"))
})

test_that("paletteer_c works when package and name are provided as symbols", {
  expect_length(paletteer_c("grDevices::rainbow", 4), 4)
  expect_length(paletteer_c(`grDevices::rainbow`, 4), 4)
})

test_that("direction works correctly in paletteer_c", {
  expect_equal(paletteer_c("grDevices::rainbow", 3, direction = 1),
              c("#FF0000FF", "#00FF00FF", "#0000FFFF"))
  expect_equal(paletteer_c("grDevices::rainbow", 3, direction = -1),
              c("#0000FFFF", "#00FF00FF", "#FF0000FF"))
  expect_error(paletteer_c("grDevices::rainbow", 3, direction = 10))
})

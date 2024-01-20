test_that("paletteer_c_ggthemes return correct number of colors", {
  testthat::skip_if_not_installed("ggthemes")
  expect_length(paletteer_c_ggthemes("Blue", 10), 10)
})

test_that("paletteer_c_grDevices return correct number of colors", {
  testthat::skip_if_not_installed("grDevices")
  expect_length(paletteer_c_grDevices("rainbow", 10), 10)
})

test_that("paletteer_c_oompaBase return correct number of colors", {
  testthat::skip_if_not_installed("oompaBase")
  expect_length(paletteer_c_oompaBase("cyanyellow", 10), 10)
})

test_that("paletteer_c_palr return correct number of colors", {
  testthat::skip_if_not_installed("palr")
  expect_length(paletteer_c_palr("sst_pal", 10), 10)
})

test_that("paletteer_c_pals return correct number of colors", {
  testthat::skip_if_not_installed("pals")
  expect_length(paletteer_c_pals("coolwarm", 10), 10)
})

test_that("paletteer_c_scico return correct number of colors", {
  testthat::skip_if_not_installed("scico")
  expect_length(paletteer_c_scico("berlin", 10), 10)
})

test_that("paletteer_c_viridis return correct number of colors", {
  testthat::skip_if_not_installed("viridisLite")
  expect_length(paletteer_c_viridis("magma", 10), 10)
})

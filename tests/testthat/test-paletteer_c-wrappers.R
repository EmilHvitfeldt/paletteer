context("test-paletteer_c-wrappers")

test_that("paletteer_c_ggthemes return correct number of colors", {
  expect_length(paletteer_c_ggthemes("Blue", 10), 10)
})

test_that("paletteer_c_grDevices return correct number of colors", {
  expect_length(paletteer_c_grDevices("rainbow", 10), 10)
})

test_that("paletteer_c_jcolors return correct number of colors", {
  expect_length(paletteer_c_jcolors("pal2", 10), 10)
})

test_that("paletteer_c_oompaBase return correct number of colors", {
  expect_length(paletteer_c_oompaBase("cyanyellow", 10), 10)
})

test_that("paletteer_c_palr return correct number of colors", {
  expect_length(paletteer_c_palr("sstPal", 10), 10)
})

test_that("paletteer_c_pals return correct number of colors", {
  expect_length(paletteer_c_pals("coolwarm", 10), 10)
})

test_that("paletteer_c_scico return correct number of colors", {
  expect_length(paletteer_c_scico("berlin", 10), 10)
})

test_that("paletteer_c_viridis return correct number of colors", {
  expect_length(paletteer_c_viridis("magma", 10), 10)
})
